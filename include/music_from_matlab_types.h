// 
// File: music_from_matlab_types.h 
//  
// MATLAB Coder version            : 2.7 
// C/C++ source code generated on  : 01-Feb-2016 14:02:25 
//

#ifndef __MUSIC_FROM_MATLAB_TYPES_H__
#define __MUSIC_FROM_MATLAB_TYPES_H__

// Include Files 
#include "rtwtypes.h"

// Type Definitions 
#ifndef struct_emxArray_int32_T_4
#define struct_emxArray_int32_T_4
struct emxArray_int32_T_4
{
    int data[4];
    int size[1];
};
#endif /*struct_emxArray_int32_T_4*/
#ifndef struct_emxArray_int32_T_6
#define struct_emxArray_int32_T_6
struct emxArray_int32_T_6
{
    int data[6];
    int size[1];
};
#endif /*struct_emxArray_int32_T_6*/
#ifndef struct_emxArray_real_T_6
#define struct_emxArray_real_T_6
struct emxArray_real_T_6
{
    double data[6];
    int size[1];
};
#endif /*struct_emxArray_real_T_6*/
typedef struct
{
    boolean_T isInitialized;
    boolean_T isReleased;
} c_phased_internal_SpatialCovEst;
typedef struct
{
    int dummy;
} phased_IsotropicAntennaElement;
typedef struct
{
    phased_IsotropicAntennaElement *Element;
} phased_ULA_2;
typedef struct
{
    boolean_T isInitialized;
    boolean_T isReleased;
    phased_ULA_2 *SensorArray;
    c_phased_internal_SpatialCovEst cCovEstimator;
} phased_RootMUSICEstimator_2;

#endif
// 
// File trailer for music_from_matlab_types.h 
//  
// [EOF] 
//
