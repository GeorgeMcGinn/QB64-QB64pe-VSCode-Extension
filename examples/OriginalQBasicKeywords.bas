Original QBasic keywords
These original QBasic keywords (with a few noted exceptions) will also work in all versions of QB64.
A (QBasic)
    ABS (function) converts any negative numerical value to a positive value.
    ABSOLUTE (statement) is used to access computer interrupt registers.
    ACCESS (file statement) sets the read and write access of a file when opened.
    ALIAS (QB64 DECLARE LIBRARY statement) denotes the actual name of an imported FUNCTION or SUB procedure.
    AND (logical operator) is used to compare two numerical values bitwise.
    AND (boolean) conditonal operator is used to include another evaluation in an IF...THEN or Boolean statement.
    (FOR APPEND AS) (file mode) creates a new file or allows an existing file to have data added using WRITE or PRINT
    AS is used to denote a variable type or file number.
    ASC (function) returns the ASCII code number of a text string character.
    ASC (statement) (QB64 only) sets the code value of an ASCII text character at a designated string position.
    ATN (function) or arctangent returns the angle in radians of a numerical tangent value.


B (QBasic)
    BEEP (statement) creates an error sound of a fixed duration.
    (FOR BINARY AS) (file mode) creates or opens an existing file for read and write byte-wise access.
    BLOAD (statement) transfers the contents of a BINARY BSAVE file to a specific array.
    BSAVE (statement) transfers the contents of an array to a specified size BINARY file.
    BYVAL (statement) assigns a numerical variable value by its value, not the name.


C (QBasic)
    CALL (statement) optional statement that sends the program to a SUB procedure. Requires parameters be enclosed in brackets(parenthesis).
    CALL ABSOLUTE (statement) is used to access computer interrupt registers.
    CASE (SELECT CASE condition) designates specific conditions in a SELECT CASE statement block.
    CASE ELSE (SELECT CASE condition) designates an alternative condition to be evaluated in a SELECT CASE statement block.
    CASE IS (SELECT CASE condition) designates specific conditions in a SELECT CASE statement block.
    CDBL (function) returns the closest DOUBLE value of a number.
    CHAIN (statement) sends a program to another specified program module or compiled program.
    CHDIR (statement) changes the current program path for file access.
    CHR$ (function) returns a text string character by the specified ASCII code number.
    CINT (function) returns the closest INTEGER value of a numerical value.
    CIRCLE (statement) creates a circle, ellipse or arc at a designated graphical coordinate position.
    CLEAR (statement) sets all variable and array values to zero number values or empty STRINGs.
    CLNG (function) returns the closest LONG value of a numerical value.
    CLOSE (statement) closes specific file number(s) or all files when a number is not specified.
    CLS (statement) clears a program screen, VIEW port or WINDOW.
    COLOR (statement) sets the current text foreground and/or background color to be used.
    COMMAND$ (function) returns the command line arguments passed when a program is run.
    COMMON (statement) sets a variable name as shared by CHAINed program modules.
    CONST (statement) sets a variable name and its value as a constant value to be used by all procedures.
    COS (function) returns the cosine of a radian angle value.
    CSNG (function) returns the closest SINGLE value of a numerical value.
    CSRLIN (function) returns the present PRINT cursor text row SCREEN coordinate position.
    CVD (function) returns the DOUBLE numerical value of an 8 byte MKD$ string.
    CVDMBF (function) returns the DOUBLE numerical value of a Microsoft Binary Format string.
    CVI (function) returns the INTEGER numerical value of a 2 byte MKI$ string.
    CVL (function) returns the LONG numerical value of a 4 byte MKL$ string.
    CVS (function) returns the SINGLE numerical value of a 4 byte MKS$ string.
    CVSMBF (function) returns the SINGLE numerical value of a Microsoft Binary Format string.


D (QBasic)
    DATA (statement) creates a line of fixed program information separated by commas.
    DATE$ (function) returns the present Operating System date string formatted as mm-dd-yyyy.
    DECLARE LIBRARY (QB64 statement block) declares a C++, SDL or Operating System SUB or FUNCTION to be used.
    DEF SEG (statement) defines a segment in memory to be accessed by a memory procedure.
    DEFDBL (statement) defines a set of undefined variable name starting letters as DOUBLE type numerical values.
    DEFINT (statement) defines a set of undefined variable name starting letters as INTEGER type numerical values.
    DEFLNG (statement) defines a set of undefined variable name starting letters as LONG type numerical values.
    DEFSNG (statement) defines a set of undefined variable name starting letters as SINGLE type numerical values.
    DEFSTR (statement) defines a set of undefined variable name starting letters as STRING type values.
    DIM (statement) defines a variable as a specified type and can size a STATIC array.
    DO...LOOP (statement) sets a recursive procedure loop that can be ignored or exited using conditional arguments.
    DOUBLE (numerical type #) 8 byte value limited to values up to 15 decimal places.
    DRAW (statement) uses a special string format that draws graphical lines in specific directions.
    $DYNAMIC (metacommand) used at the start of a program to set all program arrays as changeable in size using REDIM.


E (QBasic)
    ELSE (IF...THEN statement) is used to direct program flow when no other condition is evaluated as true.
    ELSEIF (IF...THEN statement) is used with THEN to set alternate conditional evaluations.
    END (statement) sets the end of a program, sub-procedure, statement block, DECLARE LIBRARY or TYPE definition.
    END IF (statement) ENDs an IF...THEN conditional block statement using more than one line of code.
    ENVIRON (statement) temporarily sets an environmental key/pair value.
    ENVIRON$ (function) returns a specified string setting or numerical position as an environmental STRING value.
    EOF (function) returns -1 when a file INPUT or GET has reached the end of a file.
    EQV (logic operator) is used to compare two numerical values bitwise.
    ERASE (statement) clears the values from $STATIC arrays and completely removes $DYNAMIC arrays.
    ERL (function) returns the closest line number before an error occurred if line numbers are used.
    ERR (function) returns the ERROR code when a program error occurs.
    ERROR (statement) sets a specific ERROR code to be simulated.
    EXIT (statement) immediately exits a program FOR...NEXT, DO...LOOP, SUB or FUNCTION procedure.
    EXP (function) returns the value of e to the exponential power specified.


F (QBasic)
    FIELD (statement) defines the variable sizes to be written or read from a file.
    FILES (statement) returns a list of files in the current directory path to the SCREEN.
    FIX (function) returns the rounded INTEGER value of a numerical value.
    FOR...NEXT (statement) creates a recursive loop procedure that loop a specified number of times.
    FOR (file statement) used in an OPEN file or device statement to indicate the access mode.
    FREE (QB64 TIMER statement) frees a numbered TIMER event in QB64.
    FREEFILE (function) returns a file number that is currently not in use by the Operating System.
    FUNCTION (procedure block) sub-procedure that can calculate and return one value to a program in its name.


G (QBasic)
    GET (file statement) reads a file sequencially or at a specific position and returns the value as the variable type used.
    GET (HTTP statement) reads the response of an HTTP request that was opened using _OPENCLIENT.
    GET (TCP/IP statement) reads a TCP/IP connection port to return a value.
    GET (graphics statement) maps an area the current screen's video information and places it in an INTEGER array.
    GOSUB (statement) sends the program to a designated line label procedure in the main program.
    GOTO (statement) sends the program to a designated line number or line label in a procedure.


H (QBasic)
    HEX$ (function) returns the hexadecimal (base 16) STRING representation of the INTEGER part of any value.


I (QBasic)
    IF...THEN (statement) a conditional block statement used control program flow.
    IMP (logic operator) is used to compare two numerical values bitwise.
    '$INCLUDE: 'include/endPROG.inc' ($INCLUDE) (metacommand) designates a text code library file to include with the program.
    INKEY$ (function) ASCII returns a string value entry from the keyboard.
    INP (function) returns a numerical value from a specified port register address. See Keyboard scancodes
    INPUT (statement) a user input that returns a value to one or more specified variable(s).
    INPUT (file mode) OPEN statement that only allows an existing file to be read using INPUT (file statement) or INPUT$.
    INPUT (file statement) reads a file sequentially using the variable types designated.
    INPUT$ (function) returns a designated number of string bytes from the keyboard entry or a file number.
    INSTR (function) returns the position in a text string where a character sequence match starts.
    INT (function) rounds a numerical value to an INTEGER value by removing the decimal point fraction.
    INTEGER (% numerical type) 2 byte whole values from -32768 to 32767.
    INTERRUPT (statement) is used to access computer interrupt registers.
    INTERRUPTX (statement) is used to access computer interrupt registers.


K (QBasic)
    KEY n (statement) used with ON KEY(n) events to assign a "softkey" string to a key or create a user defined key.
    KEY(n) (statement) used with ON KEY(n) events to assign, enable, disable or suspend event trapping.
    KEY LIST (statement) lists the 12 Function key soft key string assignments going down left side of screen.
    KILL (statement) deletes the specified file without a warning. Remove empty folders with RMDIR.


L (QBasic)
    LBOUND (function) returns the lower boundary of the specified array.
    LCASE$ (function) returns the lower case value of a STRING.
    LEFT$ (function) returns the specified number of text characters from the left end of a STRING.
    LEN (function) returns the length or number of characters in a STRING value in bytes.
    LET (statement) assigns a variable a literal value. Not required.
    LINE (statement) creates a graphic line or box on the SCREEN.
    LINE INPUT (statement) user input can be any text character including commas and quotes as a STRING value only.
    LINE INPUT (file statement) returns an entire text file line and returns it as a STRING value.
    LIST displays the current ON KEY(n) function key (F1 to F10) "soft key" settings.
    LOC (function) returns the present file byte position or number of bytes in the OPEN COM buffer.
    LOCATE (statement) sets the text cursor's row and column position for a PRINT or INPUT statement.
    LOCK (statement) restricts access to portions or all of a file by other programs or processes.
    LOF (function) returns the size of an OPEN file in bytes.
    LOG (function) returns the natural logarithm of a specified numerical value
    LONG (& numerical type) 4 byte whole values from -2147483648 to 2147483647.
    LOOP (block statement) bottom end of a recursive DO loop.
    LPOS (function) returns the printer head position.
    LPRINT (statement) sends STRING data to the default LPT or USB printer.
    LPRINT USING (statement) sends template formatted text to the default LPT or USB printer.
    LSET (statement) left justifies the text in a string so that there are no leading spaces.
    LTRIM$ (function) returns a string value with no leading spaces.


M (QBasic)
    MID$ (function) returns a designated portion of a STRING.
    MID$ (statement) redefines existing characters in a STRING.
    MKD$ (function) returns an 8 byte ASCII string representation of a DOUBLE numerical value.
    MKDIR (statement) creates a new folder in the current or designated program path.
    MKDMBF$ (function) returns an 8 byte Microsoft Binary Format STRING representation of a DOUBLE numerical value.
    MKI$ (function) returns a 2 byte ASCII string representation of an INTEGER.
    MKL$ (function) returns a 4 byte ASCII string representation of a LONG numerical value.
    MKS$ (function) returns a 4 byte ASCII string representation of a SINGLE numerical value.
    MKSMBF$ (function) returns an 8 byte Microsoft Binary Format STRING representation of a DOUBLE numerical value.
    MOD (math operator) performs integer remainder division on a numerical value.


N (QBasic)
    NAME (statement) names an existing file name AS a new file name.
    NEXT (statement) bottom end of a FOR...NEXT counter loop to returns to the start or a RESUME NEXT error.
    NOT (logical operator) inverts the value of a logic operation or returns True when a boolean evaluation is False.


O (QBasic)
    OCT$ (function) returns the octal (base 8) STRING representation of the INTEGER part of any value.
    OFF (event statement) turns off all ON event checking.
    ON ERROR (statement) sets up and activates an error event checking procedure call. Use to avoid program errors.
    ON KEY(n) (statement) sets up a keyboard key entry event procedure.
    ON STRIG(n) (statement) sets up a joystick button event procedure call.
    ON TIMER(n) (statement) sets up a timed event procedure call.
    ON...GOSUB (statement) sets up a numerical event procedure call.
    ON...GOTO (statement) sets up a numerical event procedure call.
    OPEN (file statement) opens a file name for an access mode with a specific file number.
    OPEN COM (statement) opens a serial communication port for access at a certain speed and mode.
    OPTION BASE (statement) can set the lower boundary of all arrays to 1.
    OR (logic operator) is used to compare two numerical values bitwise.
    OR (boolean) conditonal operator is used to include an alternative evaluation in an IF...THEN or Boolean statement.
    OUT (statement) writes numerical data to a specified register port.
    FOR OUTPUT AS OUTPUT (file mode) creates a new file or clears all data from an existing file to acess the file sequencially.


P (QBasic)
    PAINT (statement) fills an enclosed area of a graphics screen with a color until it encounters a specific colored border.
    PALETTE (statement) sets the Red, Green and Blue color attribute intensities using a RGB multiplier calculation.
    PALETTE USING (statement) sets the color intensity settings using a designated array.
    PCOPY (statement) swaps two designated memory page images when page swapping is enabled in the SCREEN statement.
    PEEK (function) returns a numerical value from a specified segment address in memory.
    PLAY (statement) uses a special string format that can produce musical tones and effects.
    PLAY (function) returns the number of remaining notes in the background music queue.
    PMAP (function) returns the physical or WINDOW view graphic coordinates.
    POINT (function) returns the color attribute number or 32 bit _RGB32 value.
    POKE (statement) writes a numerical value to a specified segment address in memory.
    POS (function) returns the current text column position of the text cursor.
    PRESET (statement) sets a pixel coordinate to the background color unless one is specified.
    PRINT (statement) prints text strings or numerical values to the SCREEN.
    PRINT (file statement) prints text strings or numerical values to a file.
    PRINT USING (statement) prints a template formatted string to the SCREEN.
    PRINT USING (file statement) prints a template formatted string to a file.
    PSET (statement) sets a pixel coordinate to the current color unless a color is designated.
    PUT (file I/O statement) writes data sequencially or to a designated position using a variable value.
    PUT (QB64 TCP/IP statement) sends raw data to a user's connection handle.
    PUT (graphics statement) places pixel data stored in an INTEGER array to a specified area of the SCREEN.


R (QBasic)
    FOR RANDOM AS (RANDOM) (file mode) creates a file or opens an existing file to read and write records of a set byte size.
    RANDOMIZE (statement) sets the random seed value for a specific sequence of random RND values.
    RANDOMIZE USING (QB64 statement) restarts the designated seed value's random sequence of values from the beginning.
    READ (statement) reads values from a DATA field. ACCESS READ is used with the OPEN statement.
    REDIM (statement) creates a new dynamic array or resizes one without losing data when _PRESERVE is used.
    REM (statement) or an apostrophe tells the program to ignore statements following it on the same line.
    RESET (statement) closes all files and writes the directory information to a diskette before it is removed from a disk drive.
    RESTORE (statement) resets the DATA pointer to the start of a designated field of data.
    RESUME (statement) an error handling procedure exit that can send the program to a line number or the NEXT code line.
    RETURN (statement) returns the program to the code immediately following a GOSUB call.
    RIGHT$ (function) returns a specific number of text characters from the right end of a STRING.
    RMDIR (statement) removes an empty folder from the current path or the one designated.
    RND (function) returns a random number value from 0 to .9999999.
    RSET (statement) right justifies a string value so that any end spaces are moved to the beginning.
    RTRIM$ (function) returns a string with all spaces removed from the right end.
    RUN (statement) clears and restarts the program currently in memory or executes another specified program.


S (QBasic)
    SADD (function) returns the address of a STRING variable as an offset from the current data segment.
    SCREEN (function) can return the ASCII character code or color of the text at a text designated coordinate.
    SCREEN (statement) sets the display mode and size of the program window.
    SEEK (function) returns the present byte position in an opened file.
    SEEK (statement) moves to a specified position in an opened file.
    SELECT CASE (statement) a program flow block that can handle numerous conditional evaluations.
    SGN (function) returns -1 for negative, 0 for zero, and 1 for positive numerical values.
    SHARED (statement) designates that a variable can be used by other procedures or the main procedure when in a sub-procedure.
    SHELL (statement) sends STRING commands to the command line. SHELL calls will not affect the current path.
    SHELL (function) executes an external command or calls another program. Returns codes sent by END or SYSTEM.
    SIN (function) returns the sine of a radian angle.
    SINGLE (! numerical type) 4 byte floating decimal point values up to 7 decimal places.
    SLEEP (statement) pauses the program for a designated number of seconds or until a key is pressed.
    SOUND (statement) creates a sound of a specified frequency and duration.
    SPACE$ (function) returns a designated number of spaces to a STRING.
    SPC (function) moves the text cursor a number of spaces on the SCREEN.
    SQR (function) returns the square root of a non-negative number.
    STATIC (statement) creates a SUB or FUNCTION variable that retains its value.
    $STATIC (metacommand) used at the start of a program to set all program arrays as unchangeable in size using DIM.
    STEP (keyword) move relatively from one graphic position or change the counting increment in a FOR...NEXT loop.
    STICK (function) returns the present joystick position.
    STOP (statement) stops a program when troubleshooting or stops an ON event.
    STR$ (function) returns a string value of a number with a leading space when it is positive.
    STRIG (function) returns the joystick button press values when read.
    STRIG(n) (statement)
    STRING ($ variable type) one byte text variable with ASCII code values from 0 to 255.
    STRING$ (function) returns a designated number of string characters.
    SUB (procedure block) sub-procedure that can calculate and return multiple parameter values.
    SWAP (statement) swaps two string or numerical values.
    SYSTEM (statement) ends a program immediately.


T (QBasic)
    TAB (function) moves a designated number of columns on the screen.
    TAN (function) returns the ratio of SINe to COSine or tangent value of an angle measured in radians.
    THEN (IF...THEN keyword) must be used in a one line IF...THEN program flow statement.
    TIME$ (function) returns the present time setting of the Operating System as a format hh:mm:ss STRING.
    TIMER (function) returns the number of seconds since midnight as a SINGLE value.
    TIMER (statement) events based on the designated time interval and timer number.
    TO indicates a range of numerical values or an assignment of one value to another.
    TYPE (definition) defines a variable type or file record that can include any STRING or numerical types.

U (QBasic)
    UBOUND (function) returns the upper-most index number of a designated array.
    UCASE$ (function) returns an uppercase representation of a specified STRING.
    UNLOCK (statement) unlocks a designated file or portions of it.
    UNTIL (condition) evaluates a DO...LOOP condition until it is True.


V (QBasic)
    VAL (function) returns the numerical value of a string number.
    VARPTR (function) returns the segment pointer address in memory.
    VARPTR$ (function) returns the string value of a numerical value in memory.
    VARSEG (function) returns the segment address of a value in memory.
    VIEW (graphics statement) sets up a graphic view port area of the screen.
    VIEW PRINT (statement) sets up a text viewport area of the screen.


W (QBasic)
    WAIT (statement) waits until a vertical retrace is started or a screen draw ends.
    WEND (statement) the bottom end of a WHILE...WEND loop.
    WHILE (condition) evaluates a DO...LOOP or WHILE...WEND condition until it is False.
    WHILE...WEND (statement) sets a recursive procedure loop that can only be exited using the WHILE conditional argument.
    WIDTH (statement) sets the text column and row sizes in several SCREEN modes.
    WINDOW (statement) maps a window size different from the program's window size.
    WRITE (screen I/O statement) prints variable values to the screen with commas separating each value.
    WRITE (file statement) writes data to a file with each variable value separated by commas.


X (QBasic)
    XOR (boolean) (logic operator) is used to compare two numerical values bitwise.



