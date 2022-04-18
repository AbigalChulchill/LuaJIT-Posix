swig -lua -c++ filesys.i 
gcc -fmax-errors=1 -std=c++17 -shared -fPIC -O2 -ofs.so filesys_wrap.cxx -lstdc++ -lstdc++fs -lluajit-5.1