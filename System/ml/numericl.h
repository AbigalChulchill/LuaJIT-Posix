#ifndef __NUMERICL_H 
#define __NUMERICL_H 

#include "mathlogic.h"

template<class T>
struct NumericLimits
{
    std::numeric_limits<T> nl;

    bool is_specialized() { return nl.is_specialized; }
    T min() { return nl.min(); }
    T max() { return nl.max(); }
    int digits() { return nl.digits; }
    int digits10() { return nl.digits10; }
    bool is_signed() { return nl.is_signed; }
    bool is_integer() { return nl.is_integer; }
    bool is_exact() { return nl.is_exact; }
    int radix() { return nl.radix; }
    T epsilon() { return nl.epsilon(); }
    T round_error() { return nl.round_error(); }
    int min_exponent() { return nl.min_exponent; }
    int min_exponent10() { return nl.min_exponent10; }
    int max_exponent() { return nl.max_exponent; }
    int max_exponent10() { return nl.max_exponent10; }
    bool has_infinity() { return nl.has_infinity; }
    bool has_quiet_NaN() { return nl.has_quiet_NaN; }
    bool has_signaling_NaN() { return nl.has_signaling_NaN; }
    bool has_denorm_loss() { return nl.has_denorm_loss; }
    T infinity() { return nl.infinity(); }
    T quiet_NaN() { return nl.quiet_NaN(); }
    T signaling_NaN() { return nl.signaling_NaN(); }
    T denorm_min() { return nl.denorm_min(); }
    bool is_iec5599() { return nl.is_iec559; }
    bool is_bounded() { return nl.is_bounded; }
    bool is_modulo() { return nl.is_modulo; }
    bool traps() { return nl.traps; }
    bool tinyness_before() { return nl.tinyness_before; }
};

#endif