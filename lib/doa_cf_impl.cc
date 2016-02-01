/* -*- c++ -*- */
/*
 * Copyright 2015 <+YOU OR YOUR COMPANY+>.
 *
 * This is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; either version 3, or (at your option)
 * any later version.
 *
 * This software is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this software; see the file COPYING.  If not, write to
 * the Free Software Foundation, Inc., 51 Franklin Street,
 * Boston, MA 02110-1301, USA.
 */

#ifdef HAVE_CONFIG_H
#include "config.h"
#endif

#include <gnuradio/io_signature.h>
#include "doa_cf_impl.h"

//MATLAB Datatypes
#include "rtwtypes.h"
#include <music_from_matlab.h>

#define INPUT_VECTOR 4096

namespace gr {
  namespace matlab {

    doa_cf::sptr
    doa_cf::make()
    {
      return gnuradio::get_initial_sptr
        (new doa_cf_impl());
    }

    /*
     * The private constructor
     */
    doa_cf_impl::doa_cf_impl()
      : gr::sync_block("doa_cf",
              gr::io_signature::make(4, 4, INPUT_VECTOR*sizeof(gr_complex)),
              gr::io_signature::make(1, 1, sizeof(float)))
    {

      music_not_empty_init();

      // Setup MATLAB compatable type containers
      d_input_mat_ant1 = new creal_T[INPUT_VECTOR];
      d_input_mat_ant2 = new creal_T[INPUT_VECTOR];
      d_input_mat_ant3 = new creal_T[INPUT_VECTOR];
      d_input_mat_ant4 = new creal_T[INPUT_VECTOR];
    }

    /*
     * Our virtual destructor.
     */
    doa_cf_impl::~doa_cf_impl()
    {
    }

    int
    doa_cf_impl::work (int noutput_items,
      gr_vector_const_void_star &input_items,
      gr_vector_void_star &output_items)
      {
        const gr_complex *in1 = (const gr_complex *) input_items[0];
        const gr_complex *in2 = (const gr_complex *) input_items[1];
        const gr_complex *in3 = (const gr_complex *) input_items[2];
        const gr_complex *in4 = (const gr_complex *) input_items[3];

        float *out = (float*) output_items[0];
        int indexOffset = 0;

        for (int vec=0; vec<noutput_items; vec++)
        {
          for (int i=0; i<INPUT_VECTOR; i++)
          {
            // Convert to MATLAB compatible type
            d_input_mat_ant1[i].re = in1[indexOffset+i].real();
            d_input_mat_ant1[i].im = in1[indexOffset+i].imag();

            d_input_mat_ant2[i].re = in2[indexOffset+i].real();
            d_input_mat_ant2[i].im = in2[indexOffset+i].imag();

            d_input_mat_ant3[i].re = in3[indexOffset+i].real();
            d_input_mat_ant3[i].im = in3[indexOffset+i].imag();

            d_input_mat_ant4[i].re = in4[indexOffset+i].real();
            d_input_mat_ant4[i].im = in4[indexOffset+i].imag();
          }

          indexOffset += INPUT_VECTOR;

          // Pass to MATLAB generated C++ function
          out[vec] = (float) music_from_matlab(d_input_mat_ant1, d_input_mat_ant2, d_input_mat_ant3, d_input_mat_ant4);
          //std::cout << "out[vec]: " << out[vec]<< std::endl;
        }

        // Tell runtime system how many output items we produced.
        return noutput_items;
      }

  } /* namespace matlab */
} /* namespace gr */
