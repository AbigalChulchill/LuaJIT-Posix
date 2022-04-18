%module struct 
%{
#include <map>
#include <vector>
using namespace std;
%}

%include "stdint.i"
%include "std_vector.i"
%include "std_string.i"
%include "lua_fnptr.i"

%template(RefVector) std::vector<SWIGLUA_REF>;

%inline %{

  struct Struct
  {
      std::map<std::string,SWIGLUA_REF> vars; 
      
      SWIGLUA_REF __getitem(const char * key)
      {       return vars[key];                  }
          
      void __setitem(const char * key, SWIGLUA_REF ref)
      { vars[key] = ref; }      
      
      void   add_var(const char * key, SWIGLUA_REF r) { vars[key]= r; }
    
  };

    // same thing, different name
  struct Class
  {
      std::map<std::string,SWIGLUA_REF> vars; 
      
      SWIGLUA_REF __getitem(const char * key)
      {       return vars[key];                  }
          
      void __setitem(const char * key, SWIGLUA_REF ref)
      { vars[key] = ref; }      
      
      void   add_var(const char * key, SWIGLUA_REF r) { vars[key]= r; }
    
  };
  
%}