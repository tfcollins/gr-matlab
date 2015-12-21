//
// File: music_from_matlab_types.h
//
// MATLAB Coder version            : 3.0
// C/C++ source code generated on  : 21-Dec-2015 16:19:24
//
#ifndef __MUSIC_FROM_MATLAB_TYPES_H__
#define __MUSIC_FROM_MATLAB_TYPES_H__

// Include Files
#include "rtwtypes.h"

// Type Definitions
typedef struct {
  int isInitialized;
} c_phased_internal_SpatialCovEst;

typedef struct {
  int dummy;
} phased_IsotropicAntennaElement;

typedef struct {
  phased_IsotropicAntennaElement *Element;
} phased_ULA_2;

typedef struct {
  int isInitialized;
  phased_ULA_2 *SensorArray;
  c_phased_internal_SpatialCovEst cCovEstimator;
} phased_RootMUSICEstimator_2;

#endif

//
// File trailer for music_from_matlab_types.h
//
// [EOF]
//
