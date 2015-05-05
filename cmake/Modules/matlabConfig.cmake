INCLUDE(FindPkgConfig)
PKG_CHECK_MODULES(PC_MATLAB matlab)

FIND_PATH(
    MATLAB_INCLUDE_DIRS
    NAMES matlab/api.h
    HINTS $ENV{MATLAB_DIR}/include
        ${PC_MATLAB_INCLUDEDIR}
    PATHS ${CMAKE_INSTALL_PREFIX}/include
          /usr/local/include
          /usr/include
)

FIND_LIBRARY(
    MATLAB_LIBRARIES
    NAMES gnuradio-matlab
    HINTS $ENV{MATLAB_DIR}/lib
        ${PC_MATLAB_LIBDIR}
    PATHS ${CMAKE_INSTALL_PREFIX}/lib
          ${CMAKE_INSTALL_PREFIX}/lib64
          /usr/local/lib
          /usr/local/lib64
          /usr/lib
          /usr/lib64
)

INCLUDE(FindPackageHandleStandardArgs)
FIND_PACKAGE_HANDLE_STANDARD_ARGS(MATLAB DEFAULT_MSG MATLAB_LIBRARIES MATLAB_INCLUDE_DIRS)
MARK_AS_ADVANCED(MATLAB_LIBRARIES MATLAB_INCLUDE_DIRS)

