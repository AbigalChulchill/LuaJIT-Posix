#ifndef __COMPLEX_H 
#define __COMPLEX_H 

#include "mathlogic.h"

template<class T>
struct Complex
{
    std::complex<T> c;

    Complex() {}
    Complex(const T & r, const T & i) { c = std::complex<T>(r,i); }
    Complex(const std::complex<T> & q) { c = q; } 

    T imag() { return c.imag(); }
    T real() { return c.real(); }


    Complex<T>& operator = (const Complex& q) { c = q.c; return *this; }
    Complex<T>& operator += (const Complex& q) { c += q.c; return *this; }
    Complex<T>& operator -= (const Complex& q) { c -= q.c; return *this; }
    Complex<T>& operator *= (const Complex& q) { c *= q.c; return *this; }
    Complex<T>& operator /= (const Complex& q) { c /= q.c; return *this; }

    Complex<T> operator + (const Complex & q) { return Complex<T>(c + q.c); }
    Complex<T> operator - (const Complex & q) { return Complex<T>(c - q.c); }
    Complex<T> operator * (const Complex & q) { return Complex<T>(c * q.c); }
    Complex<T> operator / (const Complex & q) { return Complex<T>(c / q.c); }

    bool operator == (const Complex& q) { return c == q.c;  }
    bool operator != (const Complex& q) { return c != q.c;  }

    T abs() { return std::abs(c); }
    T arg() { return std::arg(c); }
    T norm() { return std::norm(c); }
    Complex<T> conj() { return Complex<T>(std::conj(c)); }
    Complex<T> polar(const T& rho, const T &theta) { return Complex<T>(std::polar(rho,theta));}
    Complex<T> proj() { return Complex<T>(std::proj(c));}

    Complex<T> cos() { return Complex<T>(std::cos(c));}
    Complex<T> cosh() { return Complex<T>(std::cosh(c));}
    Complex<T> exp() { return Complex<T>(std::exp(c));}
    Complex<T> log() { return Complex<T>(std::log(c));}
    Complex<T> log10() { return Complex<T>(std::log10(c));}
    
    Complex<T> pow(const Complex<T> & p) { return Complex<T>(std::pow(c,p.c));}
    Complex<T> sin() { return Complex<T>(std::sin(c));}
    Complex<T> sinh() { return Complex<T>(std::sinh(c));}
    Complex<T> tan() { return Complex<T>(std::tan(c));}
    Complex<T> tanh() { return Complex<T>(std::tanh(c));}
    Complex<T> acos() { return Complex<T>(std::acos(c));}
    Complex<T> acosh() { return Complex<T>(std::acosh(c));}
    Complex<T> asin() { return Complex<T>(std::asin(c));}    
    Complex<T> asinh() { return Complex<T>(std::asinh(c));}    
    Complex<T> atan() { return Complex<T>(std::atan(c));}
    Complex<T> atanh() { return Complex<T>(std::atanh(c));}

};

template<class T>
Complex<T> operator + (const Complex<T> & a, const Complex<T> & b)
{
    Complex<T> r;
    r.c = a.c + b.c;
    return r;
}
template<class T>
Complex<T> operator - (const Complex<T> & a, const Complex<T> & b)
{
    Complex<T> r;
    r.c = a.c - b.c;
    return r;
}
template<class T>
Complex<T> operator * (const Complex<T> & a, const Complex<T> & b)
{
    Complex<T> r;
    r.c = a.c * b.c;
    return r;
}
template<class T>
Complex<T> operator / (const Complex<T> & a, const Complex<T> & b)
{
    Complex<T> r;
    r.c = a.c / b.c;
    return r;
}

Complex<float> complex(float complex c) {
    Complex<float> r(creal(c),cimag(c));
    return r;
}
Complex<double> complex(double complex c) {
    Complex<double> r(creal(c),cimag(c));
    return r;
}

float complex complex(Complex<float> & c) {
    float complex c = c.real() + c.imag()*I;
    return c;
}
double complex complex(Complex<double> & c) {
    double complex c = c.real() + c.imag()*I;
    return c;
}

#endif