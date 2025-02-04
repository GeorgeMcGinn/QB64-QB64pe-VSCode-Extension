# QB64/QB64PE Language Support for Visual Studio Code

This extension provides syntax highlighting and language support for QB64/QB64PE and related Basic dialects (.bas, .bi, .bm, .inc files) in Visual Studio Code.


## Features

- Syntax highlighting for QB64/QB64PE and related Basic dialects (Conforms to QB64 Phoenix Edition v4.0.0)
- Support for .bas, .bi, .bm, and .inc file extensions
- Support for InForm .frm extensions (Future enhancement)
- Custom dark theme optimized for QB64/QB64PE development
- Language configuration for improved editing experience


## Requirements

If you have any requirements or dependencies, add a section describing those and how to install and configure them.

## Extension Settings

This extension does not add any VS Code settings.

## QB64 Syntax Highlighting Colors

This table shows the colors used for various syntax elements in the QB64 extension.

# QB64 Syntax Highlighting Colors

This table shows the colors used for various syntax elements in the QB64 extension.

- ![#569CD6](images/colors/color-569CD6.png) **Keywords, Support functions, String processing, Error processing, File processing, Image processing, Device processing**

- ![#23e4eb](images/colors/color-23e4eb.png) **Screen**

- ![#faaa4e](images/colors/color-faaa4e.png) **Double quoted strings** 

- ![#4EC9B0](images/colors/color-4EC9B0.png) **Storage and math functions**

- ![#f54129](images/colors/color-f54129.png) **Graphics and OpenGL** 

- ![#f0b411](images/colors/color-f0b411.png) **Sound** 

- ![#d611f0](images/colors/color-d611f0.png) **Control, Conditional & Logical keywords**

- ![#f7f441](images/colors/color-f7f441.png) **Numeric constants (Hex, Binary, Octal) (Bold)** 

- ![#f59324](images/colors/color-f59324.png) **Debug keywords and functions**

- ![#9eaa67](images/colors/color-9eaa67.png) **User-defined functions (e.g., SUBs or FUNCTIONs)**

- ![#00ff2a](images/colors/color-00ff2a.png) **Meta commands (Versioninfo, Unstable, Include, etc.) (Bold)** 

- ![#84e9a6](images/colors/color-84e9a6.png) **Numeric processing, storage & conversions (Bold)**

- ![#416347](images/colors/color-416347.png) **Comment statements (Bold)**

- ![#f84040](images/colors/color-f84040.png) **TCP/IP & Memory management keywords (Bold)**


This should leave all variables, SUB and FUNCTION names white.


## Known Issues

1. Using this extension will disable all other extensions. So if you have in your project .json or .md files, the colors used for this extension will be applied to them. For markdowm (.md) and C++ (.cpp, .h) files, no highlighting will be done. I can add this in the next release if desired.

## Release Notes

### 1.0.0 - Initial release of QB64/QB64PE Language Support
  - Syntax highlighting for QB64/QB64PE
  - Custom dark theme
  - Language configuration


## Usage

1. Install the extension
2. Open a .bas, .bi, .bm, .inc or .frm file
3. The syntax highlighting and language features will be automatically applied

To apply the custom QB64/QB64PE theme:
1. Open the Command Palette (Ctrl+Shift+P)
2. Type "Preferences: Color Theme"
3. Select "QB64 Theme"


## Support

For issues, feature requests, or questions, please visit the [GitHub repository](https://github.com/GeorgeMcGinn/qb64-vscode).


**Enjoy!**
