# haxe-extension-networkutils
Haxe/Openfl extension to access system network information (Mac)

## Installation

This library is not yet available on Haxelib. To install, run the following command in a terminal:

    haxelib git networkutils https://github.com/Moonshine-IDE/haxe-extension-networkutils

To add it to a Lime or OpenFL project, add this to your project file:

    <haxelib name="networkutils" if="mac"/>


## API

Currently, the extension avails for Mac only.

### 1. Network Interfaces

Get available network interfaces as JSON in `name:address` pair:

```
// import project
import extension.networkutils.NetworkUtils;

// receive as JSON string and parse
var json = Json.parse(
	NetworkUtils.getInterfacesJSON()
);

// trace(json)
{ data => [{ address => 127.0.0.1, name => lo0 },{ address => 192.168.0.6, name => en0 }] }
```

## Development Builds

Clone the NetworkUtils repository:

    git clone https://github.com/Moonshine-IDE/haxe-extension-networkutils

Tell haxelib where your development copy of NetworkUtils is installed:

    haxelib dev networkutils path/to/download/directory

You can build the binaries using:

    lime rebuild networkutils mac

To return to release builds:

    haxelib dev networkutils
