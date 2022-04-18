clear
rm mathlogic_wrap.cxx
swig -lua -c++ mathlogic.i
gcc -fmax-errors=5 -std=c++17 -shared -fPIC -O2 -o ml.so mathlogic_wrap.cxx expr.cpp -lstdc++ -lluajit-5.1 
