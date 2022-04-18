clear
rm jsoncpp_wrap.cxx
swig -lua -c++ -Ijsoncpp/include jsoncpp.i
gcc -fmax-errors=5 -Ijsoncpp/include -std=c++17 -shared -fPIC -O2 -o jsoncpp.so jsoncpp_wrap.cxx -lstdc++ -lluajit-5.1 -lstdc++fs -L. -ljsoncpp
