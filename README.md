# gr-matlab
Example gnuradio block that used codegenerated function from MATLAB.

Generating from MATLAB directly can allow you to easily import complex mathematical functions into gnuradio processing blocks.  Since, lets be honest, most of us do this translation by hand anyway.

This example first generates a function from MATLAB into a dll which we will call from a gnuradio block.  To make this work we made two changes to the gnuradio source.  The first we added appropriate header files to the include folder as well as added them to our block's source code.  Second we modified CMakeLists.txt in the libs folder in make sure linking and installing is done correctly against our dll.  We have added comments on the changed lines to make the differences obvious.

Steps:
- Build MATLAB dll library  
  - From MATLAB navigate to the folder `matlab_code` and run `builder_lib.m`.  Now you can close MATLAB, we are done with it.  

- Build gnuradio block as usual from the repository root
  `mkdir build`  
  `cd build`  
  `cmake ..`  
  `make`  
  `sudo make install`
