%module po6 
%{
#include "po6/errno.h"
#include "po6/path.h"
#include "po6/time.h"
#include "po6/io/fd.h"
#include "po6/io/mmap.h"
#include "po6/net/hostname.h"
#include "po6/net/ipaddr.h"
#include "po6/net/location.h"
#include "po6/net/socket.h"


using namespace po6;
using namespace po6::io;
using namespace po6::net;
%}

%include "stdint.i"
%include "std_vector.i"
%include "std_string.i"


%include "po6/errno.h"

#undef PO6_WARN_UNUSED
#define PO6_WARN_UNUSED



%include "po6/path.h"
%include "po6/time.h"
%include "po6/io/fd.h"
%include "po6/io/mmap.h"
%rename(foo) socket::socket(int fd);
%include "po6/net/socket.h"
%include "po6/net/hostname.h"
%include "po6/net/ipaddr.h"
%include "po6/net/location.h"

