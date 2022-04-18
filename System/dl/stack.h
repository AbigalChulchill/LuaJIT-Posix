#ifndef __STACK_H 
#define __STACK_H 

#include "datalogic.h"

template<class T>
struct Stack : public Base
{
    std::stack<T> s;

    Stack() {} 

    bool empty() { return s.empty(); }
    size_t size(){ return s.size(); }
    T& top() { return s.top(); }
    void push(const T val) { s.push(val); }
    void pop() { s.pop(); }
};


#endif