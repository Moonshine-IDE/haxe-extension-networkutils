#include <NetworkUtils.h>
#import <CoreFoundation/CoreFoundation.h>
#import <Cocoa/Cocoa.h>
#define __STDC_FORMAT_MACROS // non needed in C, only in C++
#include <inttypes.h>
#include <ifaddrs.h>
#include <arpa/inet.h>

namespace networkutils {
		
	const char* getInterfacesJSON () {

		struct ifaddrs* interfaces = NULL;
		struct ifaddrs* temp_addr = NULL;
		
		NSString *interfacesJsonString = @"{\"data\":[";
		
		// retrieve the current interfaces - returns 0 on success
		NSInteger success = getifaddrs(&interfaces);
		if (success == 0)
		{
		    // Loop through linked list of interfaces
		    temp_addr = interfaces;
		    NSMutableArray *items = [[NSMutableArray alloc] init];
		    while (temp_addr != NULL)
		    {
		    	if (temp_addr->ifa_addr->sa_family == AF_INET) // internetwork only
      			{
        	    	NSString* name = [NSString stringWithUTF8String:temp_addr->ifa_name];
					NSString* address = [NSString stringWithUTF8String:inet_ntoa(((struct sockaddr_in *)temp_addr->ifa_addr)->sin_addr)]; 
    	        	NSLog(@"interface name: %@ address: %@", name, address);
    	        	
    	        	[items addObject:[NSString stringWithFormat: @"{\"name\":\"%@\", \"address\":\"%@\"}", name, address]];
    	        }

			    temp_addr = temp_addr->ifa_next;
		    }
		    
		    interfacesJsonString = [interfacesJsonString stringByAppendingString:[items componentsJoinedByString:@","]];
		}
		
		interfacesJsonString = [interfacesJsonString stringByAppendingString:@"]}"];

		// Free memory
		freeifaddrs(interfaces);
		
		return [interfacesJsonString cStringUsingEncoding:NSUTF8StringEncoding];
	}
	
}