#ifndef STATIC_LINK
#define IMPLEMENT_API
#endif

#if defined(HX_WINDOWS) || defined(HX_MACOS) || defined(HX_LINUX)
#define NEKO_COMPATIBLE
#endif


#include <hx/CFFI.h>
#include <stdio.h>
#include <hxcpp.h>
#include "NetworkUtils.h"


using namespace networkutils;



static value networkutils_interfaces()
{
	#if defined(HX_MACOS)
	return alloc_string(getInterfacesJSON());
	#else
	return alloc_null();
	#endif
}
DEFINE_PRIM(networkutils_interfaces, 0);



extern "C" void networkutils_main () {
	
	val_int(0); // Fix Neko init
	
}
DEFINE_ENTRY_POINT (networkutils_main);



extern "C" int networkutils_register_prims () { return 0; }