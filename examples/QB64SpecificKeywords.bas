
_A (QB64)
    _ACCEPTFILEDROP (statement) turns a program window into a valid drop destination for dragging files from Windows Explorer.
    _ACOS (function) arccosine function returns the angle in radians based on an input COSine value range from -1 to 1.
    _ACOSH (function) Returns the nonnegative arc hyperbolic cosine of x, expressed in radians.
    _ADLER32 (function) Returns the Adler-32 checksum of any arbitrary string.
    _ALLOWFULLSCREEN (statement) allows setting the behavior of the ALT+ENTER combo.
    _ALPHA (function) returns the alpha channel transparency level of a color value used on a screen page or image.
    _ALPHA32 (function) returns the alpha channel transparency level of a color value used on a 32 bit screen page or image.
    _ANDALSO (logical operator) performs short-circuiting logical conjunction on two expressions.
    _ARCCOT (function) is the inverse function of the cotangent.
    _ARCCSC (function) is the inverse function of the cosecant.
    _ARCSEC (function) is the inverse function of the secant.
    _ASIN (function) Returns the principal value of the arc sine of x, expressed in radians.
    _ASINH (function) Returns the arc hyperbolic sine of x, expressed in radians.
    _ASSERT (statement) Performs debug tests.
    $ASSERTS (metacommand) enables debug tests with the _ASSERT macro.
    _ATAN2 (function) Returns the principal value of the arc tangent of y/x, expressed in radians.
    _ATANH (function) Returns the arc hyperbolic tangent of x, expressed in radians.
    _AUTODISPLAY (statement) enables the automatic display of the screen image changes previously disabled by _DISPLAY.
    _AUTODISPLAY (function) returns the current display mode as true (-1) if automatic or false (0) if per request using _DISPLAY.
    _AXIS (function) returns a SINGLE value between -1 and 1 indicating the maximum distance from the device axis center, 


_B (QB64)
    _BACKGROUNDCOLOR (function) returns the current background color for an image handle or page.
    _BASE64DECODE$ (function) Decodes a Base64-encoded string.
    _BASE64ENCODE$ (function) Encodes a string into Base64 format.
    _BIT (numerical type) can return only signed values of 0 (bit off) and -1 (bit on). Unsigned 0 or 1.
    _BIN$ (function) returns the binary (base 2) STRING representation of the INTEGER part of any value.
    _BLEND (statement) statement turns on 32 bit alpha blending for the current image or screen mode and is default.
    _BLEND (function) returns -1 if enabled or 0 if disabled by _DONTBLEND statement.
    _BLINK (statement) statement turns blinking colors on/off in SCREEN 0
    _BLINK (function) returns -1 if enabled or 0 if disabled by _BLINK statement.
    _BLUE (function) function returns the palette or the blue component intensity of a 32-bit image color.
    _BLUE32 (function) returns the blue component intensity of a 32-bit color value.
    _BRIGHTNESS32 (function) returns the brightness value (HSB colorspace) of a given 32-bit ARGB color.
    _BUTTON (function) returns -1 when a controller device button is pressed and 0 when button is released.
    _BUTTONCHANGE (function) returns -1 when a device button has been pressed and 1 when released. Zero indicates no change.
    _BYTE (%% numerical type) can hold signed values from -128 to 127 (one byte or _BIT * 8). Unsigned from 0 to 255.


_C (QB64)
    _CAPSLOCK (function) returns -1 when Caps Lock is on
    _CAPSLOCK (statement) sets Caps Lock key state
    _CAST (function) performs a C-like cast of a numerical value to a specified numerical type.
    $CHECKING (metacommand) turns event and error checking OFF or ON.
    _CEIL (function) Rounds x upward, returning the smallest integral value that is not less than x.
    _CINP (function) Returns a key code from $CONSOLE input
    _CLAMP (function) Forces the given numeric value into a specific range.
    _CLEARCOLOR (function) returns the current transparent color of an image.
    _CLEARCOLOR (statement) sets a specific color index of an image to be transparent
    _CLIP (PUT graphics option) allows placement of an image partially off of the screen.
    _CLIPBOARD$ (function) returns the operating system's clipboard contents as a STRING.
    _CLIPBOARD$ (statement) sets and overwrites the STRING value in the operating system's clipboard.
    _CLIPBOARDIMAGE (function) pastes an image from the clipboard into a new QB64 image in memory.
    _CLIPBOARDIMAGE (statement) copies a valid QB64 image to the clipboard.
    $COLOR (metacommand) includes named color constants in a program.
    _COLORCHOOSERDIALOG (function) Displays a standard color picker dialog box and returns a 32-bit RGBA color selected by the user.
    _COMMANDCOUNT (function) returns the number of arguments passed to the compiled program from the command line.
    _CONNECTED (function) returns the status of a TCP/IP connection handle.
    _CONNECTIONADDRESS$ (TCP/IP function) returns a connected user's STRING IP address value using the handle.
    $CONSOLE (metacommand) creates a console window that can be used throughout a program.
    _CONSOLE (statement) used to turn a console window OFF or ON or to designate _DEST _CONSOLE for output.
    _CONSOLEINPUT (function) fetches input data from a $CONSOLE window to be read later (both mouse and keyboard)
    _CONSOLECURSOR (statement) is used to switch the text cursor in Console Windows off/on or change its size.
    _CONSOLEFONT (statement) is used to change the text font used in Console Windows or change its size.
    _CONSOLETITLE (statement) creates the title of the console window using a literal or variable string.
    _CONTINUE (statement) skips the remaining lines in a control block (DO/LOOP, FOR/NEXT or WHILE/WEND)
    _CONTROLCHR (statement) OFF allows the control characters to be used as text characters. ON (default) can use them as commands.
    _CONTROLCHR (function) returns the current state of _CONTROLCHR as 1 when OFF and 0 when ON.
    _COPYIMAGE (function) copies an image handle value to a new designated handle.
    _COPYPALETTE (statement) copies the color palette intensities from one 4 or 8 BPP image to another image.
    _COT (function) the mathematical function cotangent defined by 1/TAN.
    _COTH (function) Returns the hyperbolic cotangent.
    _COSH (function) Returns the hyperbolic cosine of x radians.
    _CRC32 (function) Returns the Crc-32 checksum of any arbitrary string.
    _CSC (function) the mathematical function cosecant defined by 1/SIN.
    _CSCH (function) Returns the hyperbolic cosecant.
    _CV (function) converts any _MK$ STRING value to the designated numerical type value.
    _CWD$ (function) returns the current working directory as a STRING value.


_D (QB64)
    _D2G (function) converts degrees to gradient angle values.
    _D2R (function) converts degrees to radian angle values.
    $DEBUG (metacommand) enables debugging features, allowing you to step through your code line by line.
    _DECODEURL$ (function) returns the decoded plain text URL of the given encoded URL.
    _DEFAULTCOLOR (function) returns the current default (text/drawing) color for an image handle or page.
    _DEFINE (statement) defines a range of variable names according to their first character as a data type.
    _DEFLATE$ (function) Compresses a string.
    _DELAY (statement) suspends program execution for a SINGLE number of seconds.
    _DEPTHBUFFER (statement) enables, disables, locks or clears depth buffering.
    _DESKTOPHEIGHT (function) returns the height of the desktop (not program window).
    _DESKTOPWIDTH (function) returns the width of the desktop (not program window).
    _DEST (statement) sets the current write image or SCREEN page destination for prints or graphics.
    _DEST (function) returns the current destination screen page or image handle value.
    _DEVICE$ (function) returns a STRING expression listing a designated numbered input device name and types of input.
    _DEVICEINPUT (function) returns the _DEVICES number of an _AXIS, _BUTTON or _WHEEL event.
    _DEVICES (function) returns the number of input devices found on a computer system including the keyboard and mouse.
    _DIR$ (function) returns common paths in Windows only, like My Documents, My Pictures, My Music, Desktop.
    _DIREXISTS (function) returns -1 if the Directory folder name string parameter exists. Zero if it does not.
    _DISPLAY (statement) turns off the automatic display while only displaying the screen changes when called.
    _DISPLAY (function) returns the handle of the current image that is displayed on the screen.
    _DISPLAYORDER (statement) designates the order to render software, hardware and custom-opengl-code.
    _DONTBLEND (statement) statement turns off default _BLEND 32 bit alpha blending for the current image or screen.
    _DONTWAIT (SHELL action) specifies that the program should not wait until the shelled command/program is finished.
    _DROPPEDFILE (function) returns the list of items (files or folders) dropped in a program's window after _ACCEPTFILEDROP is enabled.


_E (QB64)
_ECHO (statement) used in conjunction with $IF for the precompiler.
    $ELSE (metacommand) used in conjunction with $IF for the precompiler.
    $ELSEIF (metacommand) used in conjunction with $IF for the precompiler.
    $EMBED (metacommand) is used to embed any file's contents into the compiled executable.
    _EMBEDDED$ (function) recalls the contents of a file embedded using $EMBED.
    $END IF (metacommand) used in conjunction with $IF for the precompiler.
    _ENCODEURL$ (function) returns the so called percent encoded representation of the given URL.
    _ENVIRONCOUNT (function) returns the number of key/value pairs currently exist in the environment table.
    $ERROR (metacommand) used to trigger compiler errors from within the precompiling pass.
    _ERRORLINE (function) returns the source code line number that caused the most recent runtime error.
    _ERRORMESSAGE$ (function) returns a human-readable message describing the most recent runtime error.
    $EXEICON (metacommand) used with a .ICO icon file name to embed the image into the QB64 executable.
    _EXIT (function) prevents a user exit and indicates if a user has clicked the close X window button or CTRL + BREAK.


_F (QB64)
    _FILEEXISTS (function) returns -1 if the file name string parameter exists. Zero if it does not.
    _FILES$ (function) returns a file or directory name that matches the specified pattern.
    _FINISHDROP (statement) resets _TOTALDROPPEDFILES and clears the _DROPPEDFILE list of items (files/folders).
    _FLOAT (numerical type ##) offers the maximum floating-point decimal precision available using QB64.
    _FONT (statement) sets the current font handle to be used by PRINT or _PRINTSTRING.
    _FONT (function) creates a new font handle from a designated image handle.
    _FONTHEIGHT (function) returns the current text or font height.
    _FONTWIDTH (function) returns the current text or font width.
    _FREEFONT (statement) releases the current font handle from memory.
    _FREEIMAGE (statement) releases a designated image handle from memory.
    _FREETIMER (function) returns an unused timer number value to use with ON TIMER(n).
    _FULLPATH$ (function) returns an absolute or full path name for the specified relative path name.
    _FULLSCREEN (statement) sets the program window to full screen or OFF. Alt + Enter does it manually.
    _FULLSCREEN (function) returns the fullscreen mode in use by the program.


_G (QB64)
    _G2D (function) converts gradient to degree angle values.
    _G2R (function) converts gradient to radian angle values.
    _GLRENDER (statement) sets whether context is displayed, on top of or behind the software rendering.
    _GREEN (function) function returns the palette or the green component intensity of a 32-bit image color.
    _GREEN32 (function) returns the green component intensity of a 32-bit color value.


_H (QB64)
    _HEIGHT (function) returns the height of a designated image handle.
    _HIDE (SHELL action) hides the command line display during a shell.
    _ACCEPTFILEDROP (statement) turns a program window into a valid drop destination for dragging files from Windows Explorer.
    _ACOS (function) arccosine function returns the angle in radians based on an input COSine value range from -1 to 1.
    _ACOSH (function) Returns the nonnegative arc hyperbolic cosine of x, expressed in radians.
    _ADLER32 (function) Returns the Adler-32 checksum of any arbitrary string.
    _ALLOWFULLSCREEN (statement) allows setting the behavior of the ALT+ENTER combo.
    _ALPHA (function) returns the alpha channel transparency level of a color value used on a screen page or image.
    _ALPHA32 (function) returns the alpha channel transparency level of a color value used on a 32 bit screen page or image.
    _ANDALSO (logical operator) performs short-circuiting logical conjunction on two expressions.
    _ARCCOT (function) is the inverse function of the cotangent.
    _ARCCSC (function) is the inverse function of the cosecant.
    _ARCSEC (function) is the inverse function of the secant.
    _ASIN (function) Returns the principal value of the arc sine of x, expressed in radians.
    _ASINH (function) Returns the arc hyperbolic sine of x, expressed in radians.
    _ASSERT (statement) Performs debug tests.
    $ASSERTS (metacommand) enables debug tests with the _ASSERT macro.
    _ATAN2 (function) Returns the principal value of the arc tangent of y/x, expressed in radians.
    _ATANH (function) Returns the arc hyperbolic tangent of x, expressed in radians.
    _AUTODISPLAY (statement) enables the automatic display of the screen image changes previously disabled by _DISPLAY.
    _AUTODISPLAY (function) returns the current display mode as true (-1) if automatic or false (0) if per request using _DISPLAY.
    _AXIS (function) returns a SINGLE value between -1 and 1 indicating the maximum distance from the device axis center, 
    _HSB32 (function) returns the 32-bit ARGB color value equivalent to the specified HSB colorspace values.
    _HSBA32 (function) returns the 32-bit ARGB color value equivalent to the specified HSB colorspace values + alpha channel.
    _HUE32 (function) returns the hue value (HSB colorspace) of a given 32-bit ARGB color.
    _HYPOT (function) Returns the hypotenuse of a right-angled triangle whose legs are x and y.


_I (QB64)
    $IF (metacommand) used to set an IF condition for the precompiler.
    _ICON (statement) designates a _LOADIMAGE image file handle to be used as the program's icon or loads the embedded icon (see $EXEICON).
    _IIF (function) provides conditional evaluations similar to a ternary operator, with short-circuiting behavior.
    _INCLERRORFILE$ (function) returns the name of the original source code $INCLUDE module that caused the most recent error.
    _INCLERRORLINE (function) returns the line number in an included file that caused the most recent error.
    $INCLUDEONCE (metacommand) prevents that include file contents is injected multiple times into a program.
    _INFLATE$ (function) Decompresses a string.
    _INPUTBOX$ (function) displays a prompt in a dialog box, waits for the user to input text or click a button, and returns a string containing the contents of the text box.
    _INSTRREV (function) allows searching for a substring inside another string, but unlike INSTR it returns the last occurrence instead of the first one.
    _INTEGER64 (&& numerical type) can hold whole numerical values from -9223372036854775808 to 9223372036854775807.


_K (QB64)
    _KEYCLEAR (statement) clears the keyboard buffers for INKEY$, _KEYHIT, and INP.
    _KEYHIT (function) returns ASCII one and two byte, SDL Virtual Key and Unicode keyboard key press codes.
    _KEYDOWN (function) returns whether CTRL, ALT, SHIFT, combinations and other keys are pressed.


_L (QB64)
    $LET (metacommand) used to set a variable for the precompiler.
    _LASTAXIS (function) returns the number of axis available on a specified number device listed by _DEVICE$.
    _LASTBUTTON (function) returns the number of buttons available on a specified number device listed by DEVICE$.
    _LASTWHEEL (function) returns the number of scroll wheels available on a specified number device listed by _DEVICE$.
    _LIMIT (statement) sets the loops per second rate to slow down loops and limit CPU usage.
    _LOADFONT (function) designates a font TTF file to load and returns a handle value.
    _LOADIMAGE (function) designates an image file to load and returns a handle value.
    _LOGERROR (statement) writes a log message at the Error level with an accompanying stacktrace.
    _LOGINFO (statement) writes a log message at the Information level.
    _LOGMINLEVEL (function) returns the current minimum logging level that is being output.
    _LOGTRACE (statement) writes a log message at the Trace level.
    _LOGWARN (statement) writes a log message at the Warning level.


_M (QB64)
    _MAPTRIANGLE (statement) maps a triangular image source area to put on a destination area.
    _MAPUNICODE (statement) maps a Unicode value to an ASCII code number.
    _MAPUNICODE (function) returns the Unicode (UTF32) code point value of a mapped ASCII character code.
    _MAX (function) Returns the greater of two given numeric values.
    _MD5$ (function) Returns the MD5 hash value of any arbitrary string.
    _MEM (function) returns _MEM block referring to the largest continuous memory region beginning at a designated variable's offset.
    _MEM (variable type) contains read only dot elements for the OFFSET, SIZE, TYPE and ELEMENTSIZE of a block of memory.
    _MEMCOPY (statement) copies a value from a designated OFFSET and SIZE TO a block of memory at a designated OFFSET.
    _MEMELEMENT (function) returns a _MEM block referring to a variable's memory (but not past it).
    _MEMEXISTS (function) verifies that a memory block exists for a memory variable name or returns zero.
    _MEMFILL (statement) fills a designated memory block OFFSET with a certain SIZE and TYPE of value.
    _MEMFREE (statement) frees a designated memory block in a program. Only free memory blocks once.
    _MEMGET (statement) reads a value from a designated memory block at a designated OFFSET
    _MEMGET (function) returns a value from a designated memory block and OFFSET using a designated variable TYPE.
    _MEMIMAGE (function) returns a _MEM block referring to a designated image handle's memory
    _MEMNEW (function) allocates new memory with a designated SIZE and returns a _MEM block referring to it.
    _MEMPUT (statement) places a designated value into a designated memory block OFFSET
    _MEMSOUND (function) returns a _MEM block referring to a designated sound handle's memory
    _MESSAGEBOX (function) Displays a message dialog box, which presents a message and returns the button ID clicked by the user.
    _MESSAGEBOX (statement) Displays a message dialog box, which presents a message to the user.
    _MIDDLE (_SCREENMOVE parameter) centers the program window on the desktop in any screen resolution.
    _MIDISOUNDBANK enables _SNDOPEN to use external FM Banks or SoundFonts when playing MIDI files.
    $MIDISOUNDFONT (metacommand) (deprecated) enables the MIDI support for _SNDOPEN.
    _MIN (function) Returns the lesser of two given numeric values.
    _MK$ (function) converts a numerical value to a designated ASCII STRING value.
    _MOUSEBUTTON (function) returns the status of a designated mouse button.
    _MOUSEHIDDEN (function) returns the current state of the mouse pointer.
    _MOUSEHIDE (statement) hides the mouse pointer from view
    _MOUSEINPUT (function) returns a value if the mouse status has changed since the last read.
    _MOUSEMOVE (statement) moves the mouse pointer to a designated position on the program SCREEN.
    _MOUSEMOVEMENTX (function) returns the relative horizontal position of the mouse cursor compared to the previous position.
    _MOUSEMOVEMENTY (function) returns the relative vertical position of the mouse cursor compared to the previous position.
    _MOUSESHOW (statement) displays the mouse cursor after it has been hidden or can change the cursor shape.
    _MOUSEWHEEL (function) returns the number of mouse scroll wheel "clicks" since last read.
    _MOUSEX (function) returns the current horizontal position of the mouse cursor.
    _MOUSEY (function) returns the current vertical position of the mouse cursor.


_N (QB64)
    _NEGATE (logical operator) returns True when a boolean evaluation is False and vice-versa.
    _NEWIMAGE (function) creates a designated size program SCREEN or page image and returns a handle value.
    $NOPREFIX (metacommand) (deprecated) allows QB64-specific keywords to be used without the underscore prefix.
    _NOTIFYPOPUP (statement) Shows a system notification popup.
    _NUMLOCK (function) returns -1 when Num Lock is on
    _NUMLOCK (statement) sets Num Lock key state


_O (QB64)
    _OFFSET (function) returns the memory offset of a variable when used with DECLARE LIBRARY or _MEM only.
    _OFFSET (%& numerical type) can be used store the value of an offset in memory when using DECLARE LIBRARY or MEM only.
    _OPENCLIENT (TCP/IP function) connects to a Host on the Internet as a Client and returns the Client status handle.
    _OPENCONNECTION (TCP/IP function) open's a connection from a client that the host has detected and returns a status handle.
    _OPENFILEDIALOG$ (function) Displays a standard dialog box that prompts the user to open a file.
    _OPENHOST (TCP/IP function) opens a Host and returns a Host status handle.
    OPTION _EXPLICIT (Pre-compiler directive) instructs the compiler to require variable declaration with DIM or an equivalent statement.
    OPTION _EXPLICITARRAY (Pre-compiler directive) instructs the compiler to require array declaration with DIM or an equivalent statement.
    _ORELSE (logical operator) performs short-circuiting inclusive logical disjunction on two expressions.
    _OS$ (function) returns the QB64 compiler version in which the program was compiled as [WINDOWS], [LINUX] or [MACOSX] and [32BIT] or [64BIT].


_P (QB64)
    _PALETTECOLOR (statement) sets the color value of a palette entry of an image using 256 colors or less palette modes.
    _PALETTECOLOR (function) return the 32 bit attribute color setting of an image or screen page handle's palette.
    _PI (function) returns the value of π or parameter multiples for angle or circle calculations.
    _PIXELSIZE (function) returns the pixel palette mode of a designated image handle.
    _PRESERVE (REDIM action) preserves the data presently in an array when REDIM is used.
    _PRINTIMAGE (statement) sends an image to the printer that is stretched to the current printer paper size.
    _PRINTMODE (statement) sets the text or _FONT printing mode on a background when using PRINT or _PRINTSTRING.
    _PRINTMODE (function) returns the present _PRINTMODE value number.
    _PRINTSTRING (statement) locates and prints a text string using graphic coordinates.
    _PRINTWIDTH (function) returns the pixel width of a text string to be printed using _PRINTSTRING.
    _PUTIMAGE (statement) maps a rectangular image source area to an image destination area.


_R (QB64)
    _R2D (function) converts radians to degree angle values.
    _R2G (function) converts radians to gradient angle values.
    _RED (function) function returns the palette or the red component intensity of a 32-bit image color.
    _RED32 (function) returns the red component intensity of a 32-bit color value.
    _READBIT (function) returns the state of the specified bit of an integer variable.
    _READFILE$ (function) directly read a file into a string, without OPEN/CLOSE overhead.
    _RESETBIT (function) is used to set the specified bit of an integer variable to 0.
    $RESIZE: ($RESIZE) (metacommand) used with ON allows a user to resize the program window where OFF does not.
    _RESIZE (statement) sets resizing of the window ON or OFF and sets the method as _STRETCH or _SMOOTH.
    _RESIZE (function) returns -1 when a program user wants to resize the program screen.
    _RESIZEHEIGHT (function) returns the requested new user screen height when $RESIZE:ON allows it.
    _RESIZEWIDTH (function) returns the requested new user screen width when $RESIZE:ON allows it.
    _RGB (function) returns the closest palette index OR the LONG 32 bit color value in 32 bit screens.
    _RGB32 (function) returns the LONG 32 bit color value in 32 bit screens only
    _RGBA (function) returns the closest palette index OR the LONG 32 bit color value in 32 bit screens with the ALPHA
    _RGBA32 (function) returns the LONG 32 bit color value in 32 bit screens only with the ALPHA
    _ROL (function) used to rotate the bits of a numerical value to the left
    _ROR (function) used to rotate the bits of a numerical value to the right.
    _ROUND (function) rounds to the closest INTEGER, LONG or _INTEGER64 numerical value.


_S (QB64)
    _SATURATION32 (function) returns the saturation value (HSB colorspace) of a given 32-bit ARGB color.
    _SAVEFILEDIALOG$ (function) Displays a standard dialog box that prompts the user to save a file.
    _SAVEIMAGE (statement) Saves the screen or an image handle to an image file.
    _SEC (function) the mathematical function secant defined by 1/COS.
    _SECH (function) Returns the hyperbolic secant.
    _SELECTFOLDERDIALOG$ (function) Displays a dialog box that enables the user to select a folder (directory).
    _SCREENCLICK (statement) simulates clicking on a point on the desktop screen with the left mouse button.
    _SCREENEXISTS (function) returns a -1 value once a screen has been created.
    $SCREENHIDE (metacommand) hides the program window from view.
    _SCREENHIDE (statement) hides the program window from view.
    _SCREENICON (function) returns -1 or 0 to indicate if the window has been minimized to an icon on the taskbar.
    _SCREENICON (statement) minimizes the program window to an icon on the taskbar.
    _SCREENIMAGE (function) creates an image of the current desktop and returns an image handle.
    _SCREENMOVE (statement) positions program window on the desktop using designated coordinates or the _MIDDLE option.
    _SCREENPRINT (statement) simulates typing text into a Windows program using the keyboard.
    $SCREENSHOW (metacommand) displays the program window after it was hidden.
    _SCREENSHOW (statement) displays the program window after it has been hidden by _SCREENHIDE.
    _SCREENX (function) returns the program window's upper left corner horizontal position on the desktop.
    _SCREENY (function) returns the program window's upper left corner vertical position on the desktop.
    _SCROLLLOCK (function) returns -1 when Scroll Lock is on
    _SCROLLLOCK (statement) sets Scroll Lock key state
    _SETALPHA (statement) sets the alpha channel transparency level of some or all of the pixels of an image.
    _SETBIT (function) is used to set the specified bit of an integer variable to 1.
    _SHELLHIDE (function) returns the code sent by a program exit using END or SYSTEM followed by an INTEGER value.
    _SHL (function) used to shift the bits of a numerical value to the left
    _SHR (function) used to shift the bits of a numerical value to the right.
    _SINH (function) Returns the hyperbolic sine of x radians.
    _SMOOTH (function) checks whether the current _FULLSCREEN mode has antialiasing enabled or not.
    _SNDBAL (statement) attempts to set the balance or 3D position of a sound file.
    _SNDCLOSE (statement) frees and unloads an open sound using the sound handle created by _SNDOPEN.
    _SNDCOPY (function) copies a sound handle value to a new designated handle.
    _SNDGETPOS (function) returns the current playing position in seconds from a sound file.
    _SNDLEN (function) returns the length of a sound in seconds from a sound file.
    _SNDLIMIT (statement) stops playing a sound after it has been playing for a set number of seconds.
    _SNDLOOP (statement) plays a sound repeatedly until _SNDSTOP is used.
    _SNDNEW (function) creates a raw empty sound in memory and returns a LONG handle value for later access.
    _SNDOPEN (function) loads a sound file and returns a sound handle.
    _SNDOPENRAW (function) opens a new channel to shove _SNDRAW content into without mixing.
    _SNDPAUSE (statement) stops playing a sound file until resumed.
    _SNDPAUSED (function) returns the current pause status of a sound file handle.
    _SNDPLAY (statement) plays a sound file handle that was created by _SNDOPEN or _SNDCOPY.
    _SNDPLAYCOPY (statement) copies a sound handle, plays it and automatically closes the copy when done.
    _SNDPLAYFILE (statement) directly plays a designated sound file.
    _SNDPLAYING (function) returns the current playing status of a sound handle.
    _SNDRATE (function) returns the sound card sample rate to set _SNDRAW durations.
    _SNDRAW (statement) plays a mono or stereo sound sample frame.
    _SNDRAWBATCH (statement) plays a batch of mono or stereo sound sample frames from an array.
    _SNDRAWDONE (statement) pads a _SNDRAW stream so the final (partially filled) buffer section is played.
    _SNDRAWLEN (function) returns a value until the _SNDRAW buffer is empty.
    _SNDSETPOS (statement) sets the playing position of a sound handle.
    _SNDSTOP (statement) stops playing a sound handle.
    _SNDVOL (statement) sets the volume of a sound file handle.
    _SOURCE (statement) sets the source image handle.
    _SOURCE (function) returns the present source image handle value.
    _STARTDIR$ (function) returns the user's program calling path as a STRING.
    _STATUSCODE (function) gives the HTTP status code of an HTTP response that was opened using _OPENCLIENT.
    _STRCMP (function) compares the relationship between two strings.
    _STRICMP (function) compares the relationship between two strings, without regard for case-sensitivity.


_T (QB64)
    _TANH (function) Returns the hyperbolic tangent of x radians.
    _TITLE (statement) sets the program title string value.
    _TITLE$ (function) gets the program title string value.
    _TOGGLEBIT (function) is used to toggle the specified bit of an integer variable from 1 to 0 or 0 to 1.
    _TOSTR$ (function) Returns the STRING representation of a numerical value. It's a successor of the legacy STR$ function.
    _TOTALDROPPEDFILES (function) returns the number of items (files or folders) dropped in a program's window after _ACCEPTFILEDROP is enabled.
    _TRIM$ (function) shorthand to LTRIM$(RTRIM$("text"))


_U (QB64)
    _UCHARPOS (function) calculates the starting pixel positions of every character of a (unicode) text string.
    _UFONTHEIGHT (function) returns the global glyph height (incl. ascender/descender) of a loaded font.
    _ULINESPACING (function) returns the vertical line spacing (distance between two consecutive baselines) in pixels.
    _UNSIGNED (numerical type) expands the positive range of numerical INTEGER, LONG or _INTEGER64 values returned.
    $UNSTABLE (metacommand) will enable the use of features that have not yet been made a permanent part of the language.
    _UPRINTSTRING (statement) locates and prints a (unicode) text string using graphic coordinates.
    _UPRINTWIDTH (function) returns the pixel width of a (unicode) text string to be printed using _UPRINTSTRING.


_V (QB64)
    $VERSIONINFO:CompanyName= ($VERSIONINFO) (metacommand) adds metadata to Windows only binaries for identification purposes across the OS.


_W (QB64)
    _WAVE (statement) defines the waveform shape for a specified audio channel when used with SOUND or PLAY.
    _WHEEL (function) returns -1 when a control device wheel is scrolled up and 1 when scrolled down. Zero indicates no activity.
    _WIDTH (function) returns the width of a SCREEN or image handle.
    _WINDOWHANDLE (function) returns the window handle assigned to the current program by the OS. Windows-only.
    _WINDOWHASFOCUS (function) returns true (-1) if the current program's window has focus. Windows-only.
    _WRITEFILE (statement) directly write a string into a file, without OPEN/CLOSE overhead.



