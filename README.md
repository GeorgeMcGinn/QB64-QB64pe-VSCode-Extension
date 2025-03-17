# QB64/QB64PE Language Support for Visual Studio Code

This extension provides an enhanced syntax highlighting and language support for QB64/QB64PE and related Basic dialects (.bas, .bi, .bm, .inc files) in Visual Studio Code.


## Features

- Syntax highlighting for QB64/QB64PE and related Basic dialects (Conforms to QB64 Phoenix Edition v4.0.0 keywords)
- Support for .bas, .bi, .bm, and .inc file extensions
- Custom dark theme optimized for QB64/QB64PE development
- Custom/enhanced highlighting scheme over QB64/pe IDE settings
- Execute either QB64 or QB64pe compilers (must be defined in your PATH)


## Requirements

If you have any requirements or dependencies, add a section describing those and how to install and configure them.

## Extension Settings

This extension does not add any VS Code settings.


## QB64 Enhanced Syntax Highlighting Colors

This table shows the colors used for various syntax elements in the QB64 extension.

- ![#569CD6](https://raw.githubusercontent.com/GeorgeMcGinn/QB64-QB64pe-VSCode-Extension/main/images/colors/color-569CD6.png) **Keywords, Support functions, String processing, Error processing, File processing, Image processing, Device processing**

- ![#23e4eb](https://raw.githubusercontent.com/GeorgeMcGinn/QB64-QB64pe-VSCode-Extension/main/images/colors/color-23e4eb.png) **Screen**

- ![#faaa4e](https://raw.githubusercontent.com/GeorgeMcGinn/QB64-QB64pe-VSCode-Extension/main/images/colors/color-faaa4e.png) **Double quoted strings** 

- ![#4EC9B0](https://raw.githubusercontent.com/GeorgeMcGinn/QB64-QB64pe-VSCode-Extension/main/images/colors/color-4EC9B0.png) **Storage and math functions**

- ![#f54129](https://raw.githubusercontent.com/GeorgeMcGinn/QB64-QB64pe-VSCode-Extension/main/images/colors/color-f54129.png) **Graphics and OpenGL** 

- ![#f0b411](https://raw.githubusercontent.com/GeorgeMcGinn/QB64-QB64pe-VSCode-Extension/main/images/colors/color-f0b411.png) **Sound** 

- ![#d611f0](https://raw.githubusercontent.com/GeorgeMcGinn/QB64-QB64pe-VSCode-Extension/main/images/colors/color-d611f0.png) **Control, Conditional & Logical keywords**

- ![#f7f441](https://raw.githubusercontent.com/GeorgeMcGinn/QB64-QB64pe-VSCode-Extension/main/images/colors/color-f7f441.png) **Numeric constants (Hex, Binary, Octal) (Bold)** 

- ![#f59324](https://raw.githubusercontent.com/GeorgeMcGinn/QB64-QB64pe-VSCode-Extension/main/images/colors/color-f59324.png) **Debug keywords and functions**

- ![#9eaa67](https://raw.githubusercontent.com/GeorgeMcGinn/QB64-QB64pe-VSCode-Extension/main/images/colors/color-9eaa67.png) **User-defined functions (e.g., SUBs or FUNCTIONs)**

- ![#00ff2a](https://raw.githubusercontent.com/GeorgeMcGinn/QB64-QB64pe-VSCode-Extension/main/images/colors/color-00ff2a.png) **Meta commands (Versioninfo, Unstable, Include, etc.) (Bold)** 

- ![#84e9a6](https://raw.githubusercontent.com/GeorgeMcGinn/QB64-QB64pe-VSCode-Extension/main/images/colors/color-84e9a6.png) **Numeric processing, storage & conversions (Bold)**

- ![#416347](https://raw.githubusercontent.com/GeorgeMcGinn/QB64-QB64pe-VSCode-Extension/main/images/colors/color-416347.png) **Comment statements (Bold)**

- ![#f84040](https://raw.githubusercontent.com/GeorgeMcGinn/QB64-QB64pe-VSCode-Extension/main/images/colors/color-f84040.png) **TCP/IP & Memory management keywords (Bold)**


This should leave all variables, SUB and FUNCTION names white.


## Known Issues

1. Using this extension will disable all other extensions. So if you have in your project .json or .md files, the colors used for this extension will be applied to them. For example, markdowm (.md) and C/C++ (.c, .cpp, .h) files, no highlighting will be done.

## Release Notes


### 1.1.4 - Not compiling in Windows
  - Made changes to the args for the compiles so it does not display makefile commands, especially for qb64pe (clean up compiler messages).

### 1.1.3 - Not compiling in Windows
  - Updated to put .exe after qb64 and qb64pe for Windows.
  - Fixed the issue where the .vscode in workspace wasn't being recreated properly when extension changes.

### 1.1.2 - Fix for missing compiler function
  - Updated to create the workspace .vscode directory to enable compiling option.

### 1.1.1 - Fix for language ID mismatches
  - package.json and tasks.json had different language ID's. Fixed them to match.

### 1.1.0 - Added compiler/run for QB64 & QB64PE
  - Added compile & run for both QB64 and QB64pe compilers
  - Updated ctrl-F5 to run either compiler (QB64/Qb64pe)

### 1.0.0 - Initial release of QB64/QB64PE Language Support
  - Syntax highlighting for QB64/QB64PE
  - Custom dark theme



## Usage

1. Install the extension
2. Open a .bas, .bi, .bm, .inc or .frm file
3. The syntax highlighting and language features will be automatically applied

To apply the custom QB64/QB64PE theme:
1. Open the Command Palette (Ctrl+Shift+P)
2. Type "Preferences: Color Theme"
3. Select "QB64 Theme"

To compile and run your program (either or):
1. Select either "Run QB64" or "Run QB64pe" in upper right hand corner
2. Hit ctrl-F5 and select top center your compiler


## Support

For issues, feature requests, or questions, please visit the [GitHub repository](https://github.com/GeorgeMcGinn/QB64-QB64pe-VSCode-Extension).


**Enjoy!**
