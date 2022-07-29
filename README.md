# haxe-extension-networkutils
Haxe/Openfl extension to access system network information (Mac)

## Installation

This library is not yet available on Haxelib. To install, run the following command in a terminal:

    haxelib git networkutils https://github.com/Moonshine-IDE/haxe-extension-networkutils

To add it to a Lime or OpenFL project, add this to your project file:

    <haxelib name="networkutils" if="mac"/>


## API

Currently, the extension avails for Mac only.


## Development Builds

Clone the NetworkUtils repository:

    git clone https://github.com/Moonshine-IDE/haxe-extension-networkutils

Tell haxelib where your development copy of NetworkUtils is installed:

    haxelib dev networkutils $pathToDownloadDirectory

You can build the binaries using "lime rebuild"

    lime rebuild networkutils mac

To return to release builds:

    haxelib dev networkutils
