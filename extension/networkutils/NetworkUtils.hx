package extension.networkutils;


import lime.system.CFFI;
import lime.system.JNI;


class NetworkUtils {
	
	
	public static function getInterfacesJSON ():String {

		#if (mac)
		return networkutils_interfaces ();
		#else
		return null;
		#end
				
	}
	
	
	#if mac
	private static var networkutils_interfaces = cpp.Lib.load ("networkutils", "networkutils_interfaces", 0);
	#end
	
	
}