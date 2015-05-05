/* -*- c++ -*- */

#define MATLAB_API

%include "gnuradio.i"			// the common stuff

//load generated python docstrings
%include "matlab_swig_doc.i"

%{
#include "matlab/doa_cf.h"
%}


%include "matlab/doa_cf.h"
GR_SWIG_BLOCK_MAGIC2(matlab, doa_cf);
