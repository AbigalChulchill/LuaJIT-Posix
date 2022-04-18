%module ml
%{
#include "mathlogic.h"
#include "complex.h"
#include "expr.h"
#include "random.h"
#include "valarray.h"
#include <climits>
%}

%include "stdint.i"
%include "std_common.i"
%include "stl.i"
%include "std_deque.i"
%include "std_except.i"
%include "std_map.i"
%include "std_pair.i"
%include "std_string.i"
%include "std_vector.i"
%include "typemaps.i"
%include "carrays.i"
%include "lua_fnptr.i"

%include "mathlogic.h"
%include "complex.h"
%include "expr.h"
%include "random.h"
%include "valarray.h"

%template(DoubleComplex) Complex<double>;
%template(FloatComplex) Complex<float>;

%template(DoubleNumericLimits) NumericLimits<double>;
%template(FloatNumericLimits) NumericLimits<float>;

%template(FloatScalar) Scalar<float>;
%template(DoubleScalar) Scalar<double>;

%template(DoubleValArray) ValArray<double>;
%template(FloatValArray) ValArray<float>;


%inline 
%{

SWIGLUA_REF apply_cheater;    

// I can't temlatize this crap
double lua_apply_double_func(const double & val)
{
    double x;
    swiglua_ref_get(&apply_cheater);
    lua_pushnumber( apply_cheater.L,  val);
    lua_pcall(apply_cheater.L,1,1,0);
    x = lua_tonumber(apply_cheater.L,-1);
    return x;
}

ValArray<double> apply_double(const ValArray<double> &  a, SWIGLUA_REF r)
{
    apply_cheater = r;
    std::valarray<double> x = a.a.apply(lua_apply_double_func);
    return ValArray<double>(x);
}

float lua_apply_float_func(const float & val)
{
    double x;
    swiglua_ref_get(&apply_cheater);
    lua_pushnumber( apply_cheater.L,  val);
    lua_pcall(apply_cheater.L,1,1,0);
    x = lua_tonumber(apply_cheater.L,-1);
    return x;
}

ValArray<float> apply_float(const ValArray<float> &  a, SWIGLUA_REF r)
{
    apply_cheater = r;
    std::valarray<float> x = a.a.apply(lua_apply_float_func);
    return ValArray<float>(x);
}

int system(const char * cmd) { return std::system(cmd);}

%}

%template(DoubleMath) Math<double>;
%template(FloatMath) Math<float>;

%constant int fp_infinite = FP_INFINITE;
%constant int fp_nan = FP_NAN;
%constant int fp_zero = FP_ZERO;
%constant int fp_subnormal = FP_SUBNORMAL;
%constant int fp_normal = FP_NORMAL;

%constant int char_bit = CHAR_BIT;
%constant int schar_min = SCHAR_MIN;
%constant int schar_max = SCHAR_MAX;
%constant int uchar_max = UCHAR_MAX;
%constant int char_min = CHAR_MIN;
%constant int char_max = CHAR_MAX;
%constant int shrt_min = SHRT_MIN;
%constant int shrt_max = SHRT_MAX;
%constant int ushrt_max = USHRT_MAX;
%constant int int_min = INT_MIN;
%constant int int_max = INT_MAX;
%constant int uint_max = UINT_MAX;
%constant int long_min = LONG_MIN;
%constant int long_max = LONG_MAX;
%constant int ulong_max = ULONG_MAX;
%constant int llong_min = LLONG_MIN;
%constant int llong_max = LLONG_MAX;
%constant int ullong_max = ULLONG_MAX;


%include "expr.h"



