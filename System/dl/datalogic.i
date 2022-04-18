// %include "vecarray.h"
// %template(MyArray) VectorArray<MyType>; 
// in your swig 

// you can use these with basic types or JSON strings.
// for custom swig, you can use them for your types.

// you can use void* in lua as a userdata type 
// if you use swig then you will have to convert it to the swig type 
// or have a function in the interface to convert 
// eg:  MyType* convert_ptr(void * ptr) { return static_cast<MyType*>(ptr); }

%module dl
%{
#include "datalogic.h"
#include "vecarray.h"
#include "assocmap.h"
#include "cbuffer.h"
#include "deque.h"
#include "forwardlist.h"
#include "list.h"
#include "queue.h"
#include "set.h"
#include "stack.h"
#include "string.h"

#include "csv-parser/parser.hpp"
#include <fstream>

#include <climits>

using namespace std;
using namespace aria;


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

/*
%inline %{
struct LuaType
{
    char    c;    
    bool    b;
    double  d;    
    void * ptr;    
    std::string str;        
    std::vector<char> char_vector;
    std::vector<unsigned char> byte_vector;
    std::vector<int8_t>  int8_vector;
    std::vector<uint8_t> uint8_vector;
    std::vector<int16_t>  int16_vector;
    std::vector<uint16_t> uint16_vector;
    std::vector<int32_t>  int32_vector;
    std::vector<uint32_t> uint32_vector;
    std::vector<int64_t>  int64_vector;
    std::vector<uint64_t> uint64_vector;    
    std::vector<float>  float_vector;
    std::vector<double> double_vector;    
    std::vector<long double> ldouble_vector;    
    std::vector<std::string> string_vector;    
    SWIGLUA_REF lua_ref;
    SWIGLUA_FN lua_func;
    int key;

    bool operator < (const LuaType  b)
    {
        return key < b.key;
    }
    bool operator == (const LuaType  b)
    {
        return key == b.key;
    }
};
%}
*/

%template(string_vector) std::vector<string>;
// this does nothign to prevent the reference from being gc in lua
%template(RefVector)     std::vector<SWIGLUA_REF>;
%template(FuncVector)    std::vector<SWIGLUA_FN>;
%template(RefMap)        std::map<string,SWIGLUA_REF>;
%template(FuncMap)       std::map<string,SWIGLUA_FN>;


%include "vecarray.h"
%include "assocmap.h"
%include "cbuffer.h"
%include "deque.h"
%include "forwardlist.h"
%include "list.h"
%include "queue.h"
%include "set.h"
%include "stack.h"
%include "string.h"


// todo - I will eventually rewrite these as template macros

%template(FloatArray) Array<float>;
%template(DoubleArray) Array<double>;
%template(Int8Array) Array<int8_t>;
%template(UInt8Array) Array<uint8_t>;
%template(Int16Array) Array<int16_t>;
%template(UInt16Array) Array<uint16_t>;
%template(Int32Array) Array<int32_t>;
%template(UInt32Array) Array<uint32_t>;
%template(Int64Array) Array<long long int>;
%template(UInt64Array) Array<unsigned long long int>;
%template(StringArray) Array<string>;
%template(PtrArray) Array<void*>;
%template(BasicArray) Array<BasicType>;
%template(RefArray) Array<SWIGLUA_REF>;

%template(FloatMatrix)  Matrix<float>;
%template(DoubleMatrix) Matrix<double>;
%template(Int8Matrix)   Matrix<int8_t>;
%template(UInt8Matrix)  Matrix<uint8_t>;
%template(Int16Matrix)  Matrix<int16_t>;
%template(UInt16Matrix) Matrix<uint16_t>;
%template(Int32Matrix)  Matrix<int32_t>;
%template(UInt32Matrix) Matrix<uint32_t>;
%template(Int64Matrix)  Matrix<long long int>;
%template(UInt64Matrix) Matrix<unsigned long long int>;
%template(StringMatrix) Matrix<string>;
%template(BasicMatrix)  Matrix<BasicType>;

%template(FloatList) List<float>;
%template(DoubleList) List<double>;
%template(Int8List) List<int8_t>;
%template(UInt8list) List<uint8_t>;
%template(Int16List) List<int16_t>;
%template(UInt16list) List<uint16_t>;
%template(Int32List) List<int32_t>;
%template(UInt32List) List<uint32_t>;
%template(Int64List) List<long long int>;
%template(UInt64List) List<unsigned long long int>;
%template(StringList) List<string>;
%template(PtrList) List<void*>;
%template(BasicList) List<BasicType>;

%template(FloatForwardList) ForwardList<float>;
%template(DoubleForwardList) ForwardList<double>;
%template(Int8ForwardList) ForwardList<int8_t>;
%template(UInt8forwardlist) ForwardList<uint8_t>;
%template(Int16ForwardList) ForwardList<int16_t>;
%template(UInt16forwardlist) ForwardList<uint16_t>;
%template(Int32ForwardList) ForwardList<int32_t>;
%template(UInt32ForwardList) ForwardList<uint32_t>;
%template(Int64ForwardList) ForwardList<long long int>;
%template(UInt64ForwardList) ForwardList<unsigned long long int>;
%template(StringForwardList) ForwardList<string>;
%template(PtrForwardList) ForwardList<void*>;
%template(BasicForwardList) ForwardList<BasicType>;


%template(FloatDeque) Deque<float>;
%template(DoubleDeque) Deque<double>;
%template(Int8Deque) Deque<int8_t>;
%template(UInt8deque) Deque<uint8_t>;
%template(Int16Deque) Deque<int16_t>;
%template(UInt16Deque) Deque<uint16_t>;
%template(Int32Deque) Deque<int32_t>;
%template(UInt32Deque) Deque<uint32_t>;
%template(Int64Deque) Deque<long long int>;
%template(UInt64Deque) Deque<unsigned long long int>;
%template(StringDeque) Deque<string>;
%template(PtrDeque) Deque<void*>;


%template(FloatSet) Set<float>;
%template(DoubleSet) Set<double>;
%template(Int8Set) Set<int8_t>;
%template(UInt8set) Set<uint8_t>;
%template(Int16Set) Set<int16_t>;
%template(UInt16Set) Set<uint16_t>;
%template(Int32Set) Set<int32_t>;
%template(UInt32Set) Set<uint32_t>;
%template(Int64Set) Set<long long int>;
%template(UInt64Set) Set<unsigned long long int>;
%template(StringSet) Set<string>;
%template(PtrSet) Set<void*>;


%template(FloatStack) Stack<float>;
%template(DoubleStack) Stack<double>;
%template(Int8Stack) Stack<int8_t>;
%template(UInt8stack) Stack<uint8_t>;
%template(Int16Stack) Stack<int16_t>;
%template(UInt16Stack) Stack<uint16_t>;
%template(Int32Stack) Stack<int32_t>;
%template(UInt32Stack) Stack<uint32_t>;
%template(Int64Stack) Stack<long long int>;
%template(UInt64Stack) Stack<unsigned long long int>;
%template(StringStack) Stack<string>;
%template(PtrStack) Stack<void*>;
%template(BasicStack) Stack<BasicType>;

%template(StrMap)   AssociativeArray<string,string>;
%template(PtrMap)   AssociativeArray<string,void*>;
%template(Map)      AssociativeArray<string, BasicType>;

%template (FloatBuffer) CBuffer<float>;
%template (DoubleBuffer) CBuffer<double>;
%template (CharBuffer) CBuffer<char>;
%template (Int8Buffer) CBuffer<int8_t>;
%template (UInt8Buffer) CBuffer<uint8_t>;
%template (Int16Buffer) CBuffer<int16_t>;
%template (UInt16Buffer) CBuffer<uint16_t>;
%template (Int32Buffer) CBuffer<int32_t>;
%template (UInt32Buffer) CBuffer<uint32_t>;
%template (Int64Buffer) CBuffer<long long int>;
%template (UInt64Buffer) CBuffer<unsigned long long int>;





%inline 
%{

    struct CSVParser
    {
        std::vector<std::vector<std::string>> m;

        CSVParser(const std::string & file)
        {            
            ifstream f;
            size_t r = 0;
            f.open(file);
            if(f.is_open())
            {
                size_t row = 0;
                size_t col = 0;
                csv::CsvParser parser(f);
                while(!parser.empty())
                {                
                    std::vector<std::string> row;                    
                    while(1)
                    {
                        csv::Field field = parser.next_field();
                        if(field.type == csv::FieldType::ROW_END)
                        {
                            m.push_back(row);                            
                        }
                        else
                        {
                            row.push_back(*field.data);
                        }
                        if(field.type == csv::FieldType::ROW_END || parser.empty()) break;
                    }
                    
                }
            }            
        }

        size_t num_rows() { return m.size(); }
        size_t num_cols(size_t r) { return m[r].size(); }

        Array<std::string> get_row(size_t r)
        {
            assert(r < m.size());
            return Array<std::string>(m[r]);
        }
        std::string get_col(size_t r, size_t c) { return m[r][c]; }

        Matrix<std::string>& get_data(Matrix<std::string>& r)
        {
            r.v = std::vector<std::vector<std::string>>();
            r.v.resize(m.size());
            for(int i = 0; i < m.size(); i++)
                r.v[i] = m[i];
            return r;
        }

        void write_file(const char * file)
        {
            FILE * f = fopen(file,"w");
            for(size_t i = 0; i < m.size(); i++)
            {
                for(size_t j = 0; j < m[i].size()-1; j++)
                {
                    fprintf(f,"%s,",m[i][j].c_str());
                }
                fprintf(f,"\n");
            }
            fclose(f);
        }

        void print_row(size_t r)
        {
            for(size_t i = 0; i < m[r].size(); i++)
            {
                cout << m[r][i];
                if(i != m[r].size()-1) cout << ",";
            }
            cout << endl;
        }
    };


%}

%inline 
%{
    double SwigRefTableGet(SWIGLUA_REF  r, size_t index){
    swiglua_ref_get(&r);
    assert(lua_istable(r.L,-1));
    lua_rawgeti(r.L,-1,index);
    return lua_tonumber(r.L,-1);
}
double SwigRefTableGet2(SWIGLUA_REF  r, size_t row, size_t col){
    swiglua_ref_get(&r);
    assert(lua_istable(r.L,-1));
    lua_rawgeti(r.L,-1,row);
    assert(lua_istable(r.L,-1));
    lua_rawgeti(r.L,-1,col);
    return lua_tonumber(r.L,-1);
}
void SwigRefTableSet(SWIGLUA_REF  r, size_t index, double val){
    swiglua_ref_get(&r);
    assert(lua_istable(r.L,-1));
    lua_pushnumber(r.L,val);
    lua_rawseti(r.L,-1,index);    
}
void SwigRefTableSet2(SWIGLUA_REF  r, size_t row, size_t col, double val){
    swiglua_ref_get(&r);
    assert(lua_istable(r.L,-1));
    lua_rawgeti(r.L,-1,row);
    assert(lua_istable(r.L,-1));
    lua_rawseti(r.L,-1,val);
}

size_t SwigRefGetTableSize(SWIGLUA_REF ref)
{
    // i am not sure if this needs to be popped from the lua stack.
    swiglua_ref_get(&ref);
    assert(lua_istable(ref.L,-1));
    size_t s = lua_objlen(ref.L,-1);    
    return s;
}

template<typename T>
Array<T> CreateArray(SWIGLUA_REF ref)
{
    Array<T> r;
    size_t size = SwigRefGetTableSize(ref);
    r.resize(size);
    for(size_t i = 0; i < size; i++)
        r[i] = SwigRefTableGet(ref,i+1);
    return r;
}


%}

%template(CreateArrayFloat) CreateArray<float>;
%template(CreateArrayDouble) CreateArray<double>;
%template(CreateArrayInt8) CreateArray<int8_t>;
%template(CreateArrayInt16) CreateArray<int16_t>;
%template(CreateArrayInt32) CreateArray<int32_t>;
%template(CreateArrayInt64) CreateArray<long long int>;
%template(CreateArrayUInt8) CreateArray<uint8_t>;
%template(CreateArrayUInt16) CreateArray<uint16_t>;
%template(CreateArrayUInt32) CreateArray<uint32_t>;
%template(CreateArrayUInt64) CreateArray<unsigned long long int>;
%template(CreateArrayString) CreateArray<std::string>;
//%template(CreateArray) CreateArray<BasicType>;



// I don't like this but it can not be in the class to compile some types.

%inline 
%{
    // these need to be made outside the class
    
    template<typename T>
    void sort(Array<T> & v) { std::sort(v.v.begin(),v.v.end()); }

    template<typename T>
    void rsort(Array<T> & v) { std::sort(v.v.rbegin(),v.v.rend()); }

    template<typename T>
    void reverse(Array<T> & v) { std::reverse(v.v.begin(), v.v.end()); }

    template<typename T>
    bool binary_search(Array<T> & v, const T val)     {
        return std::binary_search(v.v.begin(),v.v.end(),val);
    }
    
    template<typename T>
    int count(Array<T> & v,const T val) { return std::count(v.v.begin(),v.v.end(),val); }        

    template<typename T>
    void fill(Array<T> & v, size_t i1, size_t i2,const T& val)    {
        assert(i1 < i2);
        std::fill(v.v.begin()+i1,v.v.begin()+i2,val);
    }        
    template<typename T>
    void make_heap(Array<T> & v)     {
        std::make_heap(v.v.begin(),v.v.end());
    
    } 
    template<typename T>
    void pop_heap(Array<T> & v) { std::pop_heap(v.v.begin(),v.v.end()); }

    template<typename T>
    void push_heap(Array<T> & v,const T val){
        v.push_back(val);
        std::push_heap(v.v.begin(),v.v.end()); 
    }

    template<typename T>
    void sort_heap(Array<T> & v) { std::sort_heap(v.v.begin(),v.v.end()); }

    template<typename T>
    T get_max(Array<T> & v)    {
        return *std::max_element(v.v.begin(),v.v.end());
    }

    template<typename T>
    T get_min(Array<T> & v)    {
        return *std::min_element(v.v.begin(),v.v.end());
    }        

    template<typename T>
    Pair<T,T> minmax(Array<T> & v) { 
        Pair<T,T> p;
        auto x = std::minmax_element(v.v.begin(),v.v.end());
        p.p.first = *x.first;
        p.p.second = *x.second;
        return p;
    }
    
    template<typename T>
    bool next_permutation(Array<T> & v) { return std::next_permutation(v.v.begin(),v.v.end()); }
    
    template<typename T>
    bool is_sorted(Array<T> & v) { return std::is_sorted(v.v.begin(), v.v.end()); }

    template<typename T>
    bool is_heap(Array<T> & v) { return std::is_heap(v.v.begin(),v.v.end()); }
    //bool is_partitioned() { return std::is_partitioned(v.begin(),v.end()); }

    template<typename T>
    bool is_permutation(const Array<T> &a, Array<T> & v) { return std::is_permutation(a.v.begin(),a.v.end(),v.v.begin()); }


    template<typename T>
    void merge_front(const Array<T> & a, const Array<T> &b, Array<T> & v)    {
        std::merge(a.v.begin(),a.v.end(),b.v.begin(),b.v.end(),v.v.begin());
    }

    template<typename T>
    void merge_back(const Array<T> & a, const Array<T> &b, Array<T> & v)    {
        std::merge(a.v.begin(),a.v.end(),b.v.begin(),b.v.end(),v.v.end());
    }

    template<typename T>
    void random_shuffle(Array<T> & v) { std::random_shuffle(v.v.begin(),v.v.end()); }

    template<typename T>
    void replace(Array<T> & v,const T a, const T b)    {
        std::replace(v.v.begin(),v.v.end(),a,b);
    }

    template<typename T>
    void shuffle(Array<T> & v) { 
        unsigned seed = std::chrono::system_clock::now().time_since_epoch().count();
        std::shuffle(v.v.begin(),v.v.end(),std::default_random_engine(seed));
    }
%}

// it can be done with a macro I just dont feel like doing it at the moment.
%template(sort_float_vector) sort<float>;
%template(rsort_float_vector) rsort<float>;
%template(reverse_float_vector) reverse<float>;
%template(bsearch_float_vector) binary_search<float>;
%template(count_float_vector) count<float>;
%template(fill_float_vector) fill<float>;
%template(make_heap_float_vector) make_heap<float>;
%template(pop_heap_vector) pop_heap<float>;
%template(push_heap_float_vector) push_heap<float>;
%template(sort_heap_float_vector) sort_heap<float>;
%template(max_float_vector) get_max<float>;
%template(min_float_vector) get_min<float>;
%template(next_permutation_float_vector) next_permutation<float>;
%template(is_sorted_float_vector) is_sorted<float>;
%template(is_heap_float_vector) is_heap<float>;
%template(is_permutation_float_vector) is_permutation<float>;
%template(merge_front_float_vector) merge_front<float>;
%template(merge_back_float_vector) merge_back<float>;
%template(random_shuffle_float_vector) random_shuffle<float>;
%template(replace_float_vector) replace<float>;
%template(shuffle_float_vector) shuffle<float>;
