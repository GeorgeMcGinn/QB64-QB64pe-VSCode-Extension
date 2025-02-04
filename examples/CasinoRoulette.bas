REM $TITLE: CASINO ROULETTE - Ver 1.10 - Last Update: 01/15/2025
' CASINOROULETTE.BAS    Version 1.10  01/15/2025
'***********************************************************************
'*       PROGRAM: ROULETTE.BAS                                         *
'*        AUTHOR: George McGinn                                        *
'*  DATE WRITTEN: 11/12/90                                             *
'*       VERSION: 1.10                                                 *
'*         TITLE: ROULETTE SIMULATOR - AMERICAN WHEEL VERSION          *
'*                                                                     *
'*                                                                     *
'*  REMARKS: This Program simulates the spin and number selection of   *
'*           an american style roulette wheel, as used in Atlantic     *
'*           City, Las Vegas, and all American-based casinos.          *
'*                                                                     *
'*  FUTURE ENHANCEMENTS  (For Version 2.0 & 3.0)                       *
'*  ---------------------------------------------                      *
'*   1. To allow bets and pay-offs to be recorded                      *
'*   2. Allow multiple players                                         *
'*   3. Record and save/print/list all spins                           *
'*   4. Analyze play and report based on "TRENDS"                      *
'*   5. Keep and display statistical reports, and allow player to      *
'*      look at them via pop-up windows.                               *
'*   6. To Allow the player to select his table, and to allow player   *
'*      to change tables at any given time, taking his money with him. *
'*   7. To Allow the player to select his Casino, and to allow player  *
'*      to change Casinos at any given time, taking his money with him.*
'*   8. To Allow the player to select a talbe based on different       *
'*      conditions found at a Casino, to test various betting methods. *
'*      (Normal Wheel, Tilted Wheel, Crooked Dealer)                   *
'*                                                                     *
'*                                                                     *
'*                                                                     *
'* Written by George McGinn                                            *
'* Copyright (C) 1991, 2025 - All Rights Reserved                      *
'* Version 1.00 - Updated 04/12/1991                                   *
'* Version 1.10 - Updated 01/15/2025                                   *
'*                                                                     *
'*                                                                     *
'* CHANGE LOG                                                          *
'***********************************************************************
'* 09/03/2019 - ADDED KEEPBETS LOGIC TO ALLOW PLAYER TO KEEP ALL       *
'*              PREVIOUS BETS FOR THE NEXT SPIN.                       *
'*                                                                     *
'* 09/04/2019 - SPLIT OUT THE GETBETS ROUTINES TO MAKE CHANGES         *
'*              EASIER. WILL ALSO SPLIT OUT THE PAYOUT BETS INTO       *
'*              IT'S OWN INCLUDE FILE AS WELL.                         *
'*                                                                     *
'* 10/15/2019 -MERGED ALL THE INCLUDES SO THAT THIS PROGRAM CAN BE     *
'*             PORTED TO TECHBASIC AND BESTBASIC. WILL ALSO LOOK AT    *
'*             POSSIBLY PORTING THIS TO XOJO OR CONVERTING TO PYTHON.  *
'*                                                                     *                                                                 *
'* 01/15/2025 -ADDED THE KEEP BETS LOGIC TO ALLOW THE USER TO REPEAT   *
'*             THE LAST BETS MADE, AND ALLOW USER TO ADD BETS TO IT.   *
'*             THE KEEP BETS WILL VALIDATE THE NEW BETS AGAINST THE    *
'*             BANKROLL, AND IF NOT ENOUGH MONEY, WILL CLEAR THE BETS. *
'*                                                                     *
'*             NOTE: ADD THE ABILITY TO CHANGE BET AMOUNTS IN THE NEXT *
'*                   UPDATE.                                           *
'*                                                                     *
'***********************************************************************
'*  Copyright (C) 1991, 2025 George McGinn.  All Rights Reserved.      *
'***********************************************************************

DEFDBL A-Z

'*************************************************
' DECLARE statements for all the QBSCR16 routines
'*************************************************
DECLARE FUNCTION GetBackground% (row%, col%)
DECLARE FUNCTION GetForeground% (row%, col%)
DECLARE FUNCTION GetVideoSegment! ()
DECLARE FUNCTION COLORCHK! ()
DECLARE SUB Center (st$, row%)
DECLARE SUB BuildScreen (screenArray$(), f%, B%, scrMode%)
DECLARE SUB MakeWindow (topRow!, leftCol!, botRow!, rightCol!, foreColor%, backColor%, label$)
DECLARE SUB Wipe (top%, bottom%, lft%, rght%, back%)

'*****************************************
' CONSTants required by QBSCR16 Routines
'*****************************************
CONST FALSE = 0, TRUE = NOT FALSE
CONST LEFTARROWCODE = -99
CONST RIGHTARROWCODE = -98


'*****************************************
'   DEFINE FUNCTIONS & SUBROUTINES
'*****************************************
DECLARE FUNCTION NUMERIC% (Amount$)
DECLARE SUB ClearScreen ()
DECLARE SUB DeterminePayoffs ()
DECLARE SUB DetermineColor ()
DECLARE SUB DetermineOddEven ()
DECLARE SUB DetermineHighLow ()
DECLARE SUB DetermineColumn ()
DECLARE SUB DetermineDozen ()
DECLARE SUB RecordBets ()
DECLARE SUB ReceiveBetType ()
DECLARE SUB PAUSE ()
DECLARE SUB GetInsideBets ()
DECLARE SUB GetOutsideBets ()
DECLARE SUB GetStraightUpBet ()
DECLARE SUB GetSplitBet ()
DECLARE SUB GetBucketBet ()
DECLARE SUB GetStreetBet ()
DECLARE SUB GetCornerBet ()
DECLARE SUB GetDoubleStreetBet ()
DECLARE SUB GetFiveLineBet ()
DECLARE SUB GetOutsideBets ()
DECLARE SUB GetRedBlackBet ()
DECLARE SUB GetHighLowBet ()
DECLARE SUB GetOddEvenBet ()
DECLARE SUB GetColumnBet ()
DECLARE SUB GetDozenBet ()
DECLARE SUB SpinBall ()
DECLARE SUB PayoffBets ()
DECLARE SUB PayInsideBets ()
DECLARE SUB PayOutsideBets ()
DECLARE SUB CheckBankroll ()
DECLARE SUB ClearBetTable ()
DECLARE SUB ClearPayoffArea ()
DECLARE SUB IntroScreenInit ()
DECLARE SUB MainScreenInit ()
DECLARE SUB DisplayIntroScreen ()
DECLARE SUB DisplayBetToScreen ()
DECLARE SUB ErrorDisplay ()
DECLARE SUB LoadBankroll ()
DECLARE SUB SaveBankroll () REM save BankRoll


'*****************************************
'   DEFINE GLOBAL VARIABLES
'*****************************************
COMMON SHARED Number, RedBlack, OddEven, HighLow, Column, Dozen, BankRoll
COMMON SHARED Bets, Table, PayoffAmount, BetAmount, BetTotal, BetType$, LineOut$, keepwagers$
COMMON SHARED NumberOfBets, BetNumber%, GoodBet, NumOut$, TypOut$
COMMON SHARED windowTop!, windowBottom!, windowLeft!, windowRight!, FColor%, BColor%, WLBL$
COMMON SHARED errWTop!, errWBottom!, errWLeft!, errWRight!, errWFClr%, errWBClr%
COMMON SHARED errWLBL$, errTClr%, NOERRORS, GreenBack%, BlackBack%, RedBack%
COMMON SHARED RowPointer%, ForeGroundColor%, BackGroundColor%
COMMON SHARED Amount$, FileName$, SplitOut$, HeadingColor%
COMMON SHARED IntroFColor1%, IntroFColor2%, IntroFColor3%, IntroFColor4%, IntroFColor5%
COMMON SHARED IntroBColor1$, IntroBColor2%
COMMON SHARED TableMinimum, TableMaximum, TotalInsideBets, TotalOutsideBets
CONST WheelNumbers$ = "1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36"
CONST Numbers$ = "0123456789."


'*****************************************
'   DEFINE GLOBAL CONSTANT COLORS
'*****************************************
CONST BLACK = 0
CONST BLUE = 1
CONST GREEN = 2
CONST CYAN = 3
CONST RED = 4
CONST MAGENTA = 5
CONST BROWN = 6
CONST GREY = 7
CONST BRIGHT = 8
CONST BLINKING = 16
CONST YELLOW = BRIGHT + BROWN
CONST BRIGHTWHITE = BRIGHT + GREY


'*****************************************
'   DEFINE GLOBAL ARRAYS
'*****************************************
DIM SHARED BetTable(100, 8)
DIM SHARED Wheel%(38)
DIM SHARED introArray$(1 TO 25)
DIM SHARED scrArray$(1 TO 25)
DIM SHARED errArray$(1 TO 3)
DIM SHARED NumberDisplay$(1 TO 266)


'*****************************************
'   DEFINE CONSTANT ERROR DEFINITIONS
'*****************************************
CONST NotNumeric = 100
CONST BankRollExceeded = 101
CONST InvalidColumn = 102
CONST InvalidCorner = 103
CONST InvalidDblStreet = 104
CONST InvalidDozen = 105
CONST InvalidHighLow = 106
CONST InvalidOddEven = 107
CONST InvalidRedBlack = 108
CONST InvalidSplit = 109
CONST InvalidSplitSecond = 110
CONST InvalidStraight = 111
CONST InvalidStreet = 112
CONST InUnderTableMinimum = 113
CONST OutUnderTableMinimum = 114
CONST OverTableMaximum = 115
CONST InvalidSpinAgain = 116
CONST InvalidKeepWager = 117
CONST FileNotFound = 53
CONST FileAlreadyOpened = 55
CONST DiskFull = 61
CONST DeviceIOError = 57
CONST InputPastEOF = 62
CONST DiskNotReady = 71
CONST DiskMediaError = 72
CONST DuplicateFile = 58
CONST DeviceUnavailable = 68


'
' ======================INITIALIZATION SECTION==========================
' Initialize all variables, screen displays, format Wheel and Nubmers
' ======================================================================
'
_CONSOLETITLE "Casino Roulette v1.10"

'*****************************************
'   Initialize Error Routine
'*****************************************
ON ERROR GOTO ErrorRoutine



'*****************************************
'   Initialize Variables
'*****************************************
BankRoll = 100
Bets = 0
Table = 0
TableMinimum = 5
TableMaximum = 500
NOERRORS = TRUE
keepwagers$ = "N"

'
' Initial Values for the Number Display Window
'
windowTop! = 6
windowBottom! = 16
windowLeft! = 3
windowRight! = 21
WLBL$ = "Spin Results"

'
' Initial Values for the Error Display Window
'
errWTop! = 10
errWBottom! = 16
errWLeft! = 5
errWRight! = 75
errWLBL$ = " ERROR! "

'
' Initial Values for the Colors (Based on Video Adapter)
'
IF COLORCHK! THEN 
    ForeGroundColor% = BRIGHTWHITE
    BackGroundColor% = BLUE
    GreenBack% = GREEN
    BlackBack% = BLACK
    RedBack% = RED
    HeadingColor% = YELLOW
    IntroFColor1% = RED
    IntroFColor2% = BRIGHTWHITE
    IntroFColor3% = RED
    IntroFColor4% = YELLOW
    IntroFColor5% = BRIGHTWHITE
    IntroBColor1% = BLACK
    IntroBColor2% = BRIGHT + BLUE
    FColor% = ForeGroundColor%
    BColor% = BackGroundColor%
    HeadingColor% = YELLOW
    errWFClr% = YELLOW
    errWBClr% = RED
    errTClr% = YELLOW
ELSE
    ForeGroundColor% = BRIGHTWHITE
    BackGroundColor% = BLACK
    GreenBack% = GREY
    BlackBack% = BLACK
    RedBack% = GREY
    HeadingColor% = BRIGHTWHITE
    IntroFColor1% = BRIGHTWHITE
    IntroFColor2% = GREY
    IntroFColor3% = BLACK
    IntroFColor4% = BRIGHTWHITE
    IntroFColor5% = BLACK
    IntroBColor1% = BLACK
    IntroBColor2% = GREY
    FColor% = ForeGroundColor%
    BColor% = BackGroundColor%
    errWFClr% = BRIGHTWHITE
    errWBClr% = BLACK
    errTClr% = BRIGHTWHITE
END IF

'*****************************************
'   Display Initial Main Screen
'*****************************************
IntroScreenInit

MainScreenInit

BuildScreen scrArray$(), ForeGroundColor%, BackGroundColor%, 2

DisplayIntroScreen

PAUSE

Wipe 4, 24, 1, 80, BackGroundColor%


'*****************************************
'   Initialize RANDOMIZER
'*****************************************
RANDOMIZE TIMER


'*****************************************
'   Load the numbers into the Wheel Array
'*****************************************
FOR x% = 1 TO 38
    READ Wheel%(x%)
NEXT x%


'*****************************************
'  Load Numbers Display Array
'*****************************************
OPEN "NUMBERS.DAT" FOR INPUT AS #1
FOR x% = 1 TO 266
    INPUT #1, NumberDisplay$(x%)
NEXT x%
CLOSE #1


'*****************************************
'   Process Roulette Game
'*****************************************

DO
    COLOR ForeGroundColor%, BackGroundColor%

'*** Add code to not clear the BetTable if user wants to keep same bets
    IF keepwagers$ = "N" THEN
        FOR BetNumber% = 1 TO 100
            ClearBetTable
        NEXT BetNumber%
        Table = 0
        NumberOfBets = 0
        TotalInsideBets = 0
    ELSE
        KeepPreviousBets
        BetNumber% = NumberOfBets
    END IF

    RecordBets

    IF BetType$ <> "9" THEN
        NumberOfBets = BetNumber%
        SpinBall
        DeterminePayoffs
        LOCATE 20, 3: PRINT "Hit [ENTER] to Review Bets"
        PAUSE
        Wipe 19, 21, 2, 35, BackGroundColor%
        PayoffBets
        IF NumberOfBets > 1 THEN
            LOCATE 21, 3: PRINT "[Y/N] YES is the Default"
            LOCATE 20, 3: INPUT "KEEP BETS"; keepwagers$
            IF keepwagers$ = "" THEN keepwagers$ = "Y"
            keepwagers$ = UCASE$(keepwagers$)
            Results$ = "N"
            DO
                SELECT CASE keepwagers$
                    CASE " ", "Y", "N"
                            Results$ = "Y"
                    CASE ELSE 
                            ERROR InvalidKeepWager
                            Wipe 18, 25, 2, 80, BackGroundColor%
                            LOCATE 21, 3: PRINT "[Y/N] YES is the Default"
                            IF keepwagers$ = "" THEN keepwagers$ = "N"
                            keepwagers$ = UCASE$(keepwagers$)
                END SELECT
            LOOP UNTIL Results$ = "Y"
            Wipe 19, 23, 2, 35, BackGroundColor%
        END IF
    ELSE
        choice$ = "N"
        PAUSE
    END IF
LOOP WHILE (choice$ <> "N")

ClearScreen

'*********************************************
' DATA Statements for the American Style Wheel
'*********************************************
DATA 37,2,14,35,23,4,16,33,21,6,18,31,19,8,12,29,25,10,27
DATA 38,1,13,36,24,3,15,34,22,5,17,32,20,7,11,30,26,9,28

END

ErrorRoutine:
'
' =========================== ErrorRoutine =============================
' The ErrorRoutine section handles all the error determination, display-
'     ing the proper error message, and deciding the proper course of
'     action based on the error.  If an error is not defined, then this
'     will be handled by displaying the error number, message, and then
'     exiting the program.
' ======================================================================
'

SELECT CASE ERR

    CASE NotNumeric
        errArray$(1) = "SORRY - Non-Numeric amount entered for Dollar Amount"
        errArray$(2) = "        Bet not accepted.  Press [ENTER] to continue"
        errArray$(3) = "  "

    CASE BankRollExceeded
        LineOut$ = "$" + LTRIM$(STR$(BankRoll))
        errArray$(1) = "SORRY - You do not have enough money to cover your bet."
        errArray$(2) = "        You only have " + LineOut$ + " dollars left."
        errArray$(3) = "        Bet not accepted. Press [ENTER] to continue"

    CASE InvalidColumn
        errArray$(1) = "SORRY - Invalid input for Column Number selected."
        errArray$(2) = "        Valid Columns are 1, 2, or 3 only."
        errArray$(3) = "        Bet not accepted.  Press [ENTER] to continue"

    CASE InvalidCorner
        errArray$(1) = "SORRY - Invalid number selected to start a Corner."
        errArray$(2) = "        Valid Starting points are any number in Column 1 & 2"
        errArray$(3) = "        Bet not accepted.  Press [ENTER] to continue"

    CASE InvalidDblStreet
        errArray$(1) = "SORRY - Invalid number selected to start a Double Street"
        errArray$(2) = "        Valid numbers are:  1,4,7,10,13,16,19,22,25,28 & 31"
        errArray$(3) = "        Bet not accepted.  Press [ENTER] to continue"

    CASE InvalidDozen
        errArray$(1) = "SORRY - Invalid input for Dozen Number selected."
        errArray$(2) = "        Valid Dozens are 1, 2, or 3 only."
        errArray$(3) = "        Bet not accepted.  Press [ENTER] to continue"

    CASE InvalidHighLow
        errArray$(1) = "SORRY - Invalid selection for High/Low Betting."
        errArray$(2) = "        Valid Selections:  H/h for High, L/l for Low."
        errArray$(3) = "        Bet not accepted. Press [ENTER] to continue"

    CASE InvalidOddEven
        errArray$(1) = "SORRY - Invalid selection for Odd/Even Betting."
        errArray$(2) = "        Valid Selections: O/o for Odd, E/e for Even.   "
        errArray$(3) = "        Bet not accepted.  Press [ENTER] to continue"

    CASE InvalidRedBlack
        errArray$(1) = "SORRY - Invalid selection for Red/Black Betting."
        errArray$(2) = "        Valid Selections are : R/r for Red, B/b for Black.  "
        errArray$(3) = "        Bet not accepted.  Press [ENTER] to continue"

    CASE InvalidSplit
        errArray$(1) = "SORRY - Invalid Number selected for a Split Bet."
        errArray$(2) = "        Valid Selections are : 0, 00, and 1 to 36."
        errArray$(3) = "        Bet not accepted.  Press [ENTER] to continue"

    CASE InvalidSplitSecond
        errArray$(1) = "SORRY - Invalid Second Number selected for a Split Bet."
        errArray$(2) = "        Valid Selections for " + LineOut$ + " are: " + SplitOut$ + "."
        errArray$(3) = "        Bet not accepted.  Press [ENTER] to continue"

    CASE InvalidStraight
        errArray$(1) = "SORRY - Invalid Number selected for Straight-Up Betting."
        errArray$(2) = "        Valid Selections are : 0, 00, and 1 to 36."
        errArray$(3) = "        Bet not accepted.  Press [ENTER] to continue"

    CASE InvalidStreet
        errArray$(1) = "SORRY - Invalid number selected to start a Street"
        errArray$(2) = "        Valid numbers are: 1,4,7,10,13,16,19,22,25,28,31 & 34"
        errArray$(3) = "        Bet not accepted.  Press [ENTER] to continue"

    CASE InUnderTableMinimum
        LineOut$ = "$" + LTRIM$(STR$(TableMinimum - TotalInsideBets))
        errArray$(1) = "SORRY - Amount of Inside Bets are under the Table Minimun."
        errArray$(2) = "        You must make " + LineOut$ + " additional on inside bets."
        errArray$(3) = "        Press [ENTER] to continue Inside Betting."

    CASE OutUnderTableMinimum
        LineOut$ = "$" + LTRIM$(STR$(TableMinimum))
        errArray$(1) = "SORRY - Amount of Outside Bet is under the Table Minimun."
        errArray$(2) = "        You must make a minimun of " + LineOut$ + " for each outside bet."
        errArray$(3) = "        Press [ENTER] to continue Outside Betting."

    CASE OverTableMaximum
        LineOut$ = "$" + LTRIM$(STR$(TableMaximum - Table))
        errArray$(1) = "SORRY - Total Bet exceeds the Table Maximum of $" + LTRIM$(STR$(TableMaximum)) + "."
        errArray$(2) = "        Reduce your last bet to " + LineOut$ + " to stay with Table Limits."
        errArray$(3) = "        Bet not accepted.  Press [ENTER] to continue"

    CASE InvalidSpinAgain
        errArray$(1) = "SORRY - Invalid selection for Spin Again."
        errArray$(2) = "        Valid Selections are : BLANK, N/n for No, Y/y for Yes.  "
        errArray$(3) = "        Input not accepted.  Press [ENTER] to continue"

    CASE InvalidKeepWager
        errArray$(1) = "SORRY - Invalid selection for Keep Bets."
        errArray$(2) = "        Valid Selections are : BLANK, N/n for No, Y/y for Yes.  "
        errArray$(3) = "        Input not accepted.  Press [ENTER] to continue"

    CASE FileNotFound
        LineOut$ = UCASE$(FileName$)
        NOERRORS = FALSE
        errArray$(1) = "SORRY - File " + LineOut$ + " Not found."
        errArray$(2) = "        Press [ENTER] to continue"
        errArray$(3) = " "

    CASE DiskFull
        errArray$(1) = "SORRY - Cannot Save file " + LineOut$ + " - Current disk full"
        errArray$(2) = "        Insert new disk and Re-Select SAVE option."
        errArray$(3) = "        Press [ENTER] to continue."

    CASE DuplicateFile
        errArray$(1) = "SORRY - Cannot Save file " + LineOut$ + " - File already exists."
        errArray$(2) = "        Press [ENTER] to continue."
        errArray$(3) = " "

'     CASE FileAlreadyOpened
'     CASE DeviceIOError
'     CASE InputPastEOF
'     CASE DiskNotReady
'     CASE DiskMediaError
'     CASE DeviceUnavailable
    CASE ELSE
        LineOut$ = "[" + LTRIM$(STR$(ERR)) + "]"
        errArray$(1) = "DISASTEROUS ERROR: " + LineOut$
        errArray$(2) = "        Unrecoverable error encountered. Program Terminated"
        errArray$(3) = "        Lookup error code above & send in Error Report Form."
        ErrorDisplay
        END

END SELECT

'***** If the error gets to this point, then it is not serious, and
'***** the program can continue after displaying the error window and
'***** doing some housekeeping.
'
ErrorDisplay
ClearBetTable
RESUME NEXT


SUB BuildScreen (screenArray$(), f%, B%, scrMode%)
' =========================== BuildScreen ==============================
' The BuildScreen subroutine allows you to place on the screen a pre-
'     defined array that stores a complete screen. The code allows you
'     to place the screen in a variety of ways. For expediency, this
'     routine will hold the code of only the ways in which this program
'     displays it's screens.
' ======================================================================
'
'   Parameters are as follows:
'
'     screenArray$() - The array of strings used to define a screen.
'                      there must be exactly 25 elements numbered
'                      1 to 25 and each element must be 80 characters
'                      in length (ex.: DIM ScrArray$(1 TO 25)).
'     f%             - Foreground color to use for display.
'     b%             - Background color to use for display.
'     scrMode%       - Manner that the screen is displayed onto the
'                      monitor.
' ======================================================================
'


'***********************************************************************
' The delay local variable is used here for dummy loops that create a
' very brief pauses of execution at points in the routine that need it,
' particularly in the vertical motion.  Change this value to suit the
' speed of your machine.
'***********************************************************************

    DEFSNG A-Z

    delay = 5

    COLOR f%, B%

    SELECT CASE scrMode%

        CASE 1 'Title Screen - From Top to Bottom
            FOR x = 1 TO 25
                FOR A = 1 TO delay: NEXT A
                LOCATE x, 1, 0: PRINT screenArray$(x);
            NEXT x

        CASE 2 'Main Screen - Circular Mode
            FOR x = 1 TO 25
                FOR y = 1 TO delay: NEXT y
                LOCATE x, 1, 0: PRINT MID$(screenArray$(x), 1, 16);
            NEXT x
            FOR x% = 16 TO 78 STEP 3
                FOR y% = 20 TO 25
                    LOCATE y%, x%, 0: PRINT MID$(screenArray$(y%), x%, 5);
                NEXT y%
            NEXT x%

            FOR x = 19 TO 1 STEP -1
                FOR y = 1 TO delay: NEXT y
                LOCATE x, 65, 0: PRINT MID$(screenArray$(x), 65, 16);
            NEXT x
            FOR x% = 65 TO 16 STEP -3
                FOR y% = 1 TO 6
                    LOCATE y%, x%, 0: PRINT MID$(screenArray$(y%), x%, 5);
                NEXT y%
            NEXT x%

            FOR x = 7 TO 19
                FOR y = 1 TO delay: NEXT y
                LOCATE x, 17, 0: PRINT MID$(screenArray$(x), 17, 16);
            NEXT x
            FOR x% = 32 TO 64 STEP 3
                FOR y% = 15 TO 19
                    LOCATE y%, x%, 0: PRINT MID$(screenArray$(y%), x%, 5);
                NEXT y%
            NEXT x%

            FOR x = 14 TO 6 STEP -1
                FOR y = 1 TO delay: NEXT y
                LOCATE x, 49, 0: PRINT MID$(screenArray$(x), 49, 16);
            NEXT x
            FOR x% = 48 TO 33 STEP -3
                FOR y% = 7 TO 10
                    LOCATE y%, x%, 0: PRINT MID$(screenArray$(y%), x%, 5);
                NEXT y%
            NEXT x%

            FOR x = 11 TO 14
                FOR y = 1 TO delay: NEXT y
                LOCATE x, 33, 0: PRINT MID$(screenArray$(x), 33, 16);
            NEXT x

    END SELECT


END SUB

REM $DYNAMIC
SUB Center (st$, row%)
' ============================== Center ================================
' The Center Subroutine will display a string passed to it centered on
'     the row passed to it.  Parameters are as follows:
'
'      st$ - The string to center on the screen.  String must be 80
'            characters or less.
'      row% - The row of the screen on which to center the string.
'             Must be in the range 1 through 25.
' ======================================================================
'

    DEFSNG A-Z

'***********************************************************************
' Calculate X-Coordinate (column) on which to locate the string
'***********************************************************************
    x% = INT((80 - (LEN(st$))) / 2) + 1

'***********************************************************************
' Display the text string
'***********************************************************************
    LOCATE row%, x%, 0: PRINT st$;

END SUB

REM $STATIC
SUB CheckBankroll STATIC
' ========================== CheckBankroll =============================
' The CheckBankroll subroutine checks the current bet to see if the
'     player has enough money to cover it.  If so, it deducts the amount
'     from the bankroll and sets the GoodBet$ switch to "YES". If there
'     is not enough to cover the bet, a message is displayed stating
'     how much the player has and sets the GoodBet$ switch to "NO".
' ======================================================================
'

    DEFDBL A-Z

    IF BetAmount > 0 AND BetAmount <= BankRoll THEN
        IF (Table + BetAmount) > TableMaximum THEN
            GoodBet = FALSE
            ERROR OverTableMaximum
        ELSE
            BankRoll = BankRoll - BetAmount
            GoodBet = TRUE
        END IF
    ELSE
        GoodBet = FALSE
        IF BetAmount > 0 THEN
            ERROR BankRollExceeded
        END IF
    END IF


END SUB


SUB ClearBetTable STATIC
' ========================== ClearBetTable =============================
' The ClearBetTable subroutine clears the current bet from the table.
'     This routine is called from numerous routines, so a global type
'     processing must exist.
' ======================================================================
'

    DEFSNG A-Z
    DEFDBL A-Z

    BetTable(BetNumber%, 1) = 0
    BetTable(BetNumber%, 2) = 0
    BetTable(BetNumber%, 3) = 0
    BetTable(BetNumber%, 4) = 0
    BetTable(BetNumber%, 5) = 0
    BetTable(BetNumber%, 6) = 0
    BetTable(BetNumber%, 7) = 0
    BetTable(BetNumber%, 8) = 0


END SUB


SUB ClearPayoffArea STATIC
' ========================== ClearPayoffArea ===========================
' The ClearPayoffArea Subroutine clears the part of the screen that
'     holds the payoff information and resets the row pointer to the
'     original starting value
' ======================================================================
'

    DEFSNG A-Z
    DEFINT A-Z

    PAUSE
    RowPointer% = 10
    Wipe 9, 24, 23, 80, BackGroundColor%


END SUB


SUB ClearScreen STATIC
' =========================== ClearScreen ==============================
' The ClearScreen subroutine clears the entire screen from the bottom
'     to the top.  It will also set the colors to White lettering on a
'     Black background.
' ======================================================================
'

    DEFSNG A-Z
    DEFINT A-Z

    COLOR GREY, BLACK

'
'  Clear Screen from bottom to top.
'
    FOR x = 25 TO 1 STEP -1
        FOR A = 1 TO 5000
        NEXT A
        LOCATE x, 1, 0: PRINT STRING$(80, " ");
    NEXT x

    LOCATE 1, 1, 0


END SUB


FUNCTION COLORCHK!
' ============================ COLORCHK ================================
' The COLORCHK Function checks the value stored at the machine memory
'     location that contains the video display type.  If the value
'     is hex B4 then the display is mono.  Otherwise, it is color.  The
'     function returns a value of False (Zero) if mono, True (Non-Zero)
'     if color.
' ======================================================================
'

    DEFSNG A-Z
    DEFINT A-Z

    DEF SEG = 0
    adapter = PEEK(&H463)

    IF adapter = &HB4 THEN
        COLORCHK! = FALSE ' Mono (False/Zero)
    ELSE
        COLORCHK! = TRUE ' Color (True/Non-Zero)
    END IF

END FUNCTION


SUB DetermineColor STATIC
' ========================= DetermineColor =============================
' The DetermineColor subroutine determines the color of the number and
'     sets the color switch to "R", "B", of " ".
' ======================================================================
'

    DEFSNG A-Z
    DEFDBL A-Z

    LOCATE 10, 27

    SELECT CASE Number
        CASE 37, 38
            RedBlack = 0
            PRINT "Takes one-half of RED and BLACK Bets"
        CASE 1, 3, 5, 7, 9, 12, 14, 16, 18, 19, 21, 23, 25, 27, 30, 32, 34, 36
            RedBlack = 1
            PRINT "Pays on all RED bets"
        CASE ELSE
            RedBlack = 2
            PRINT "Pays on all BLACK bets"
    END SELECT



END SUB


SUB DetermineColumn STATIC
' ========================= DetermineColumn ============================
' The DetermineColumn subroutine determines the column of the number
'     and sets the Column switch to "0", "1", "2", or "3".
' ======================================================================
'

    DEFSNG A-Z
    DEFDBL A-Z

    LOCATE 13, 27

    SELECT CASE Number
        CASE 37, 38
            Column = 0
            PRINT "Takes all bets on any COLUMN bet"
        CASE 1, 4, 7, 10, 13, 16, 19, 22, 25, 28, 31, 34
            Column = 1
            PRINT "Pays on all 1st COLUMN bets"
        CASE 2, 5, 8, 11, 14, 17, 20, 23, 26, 29, 32, 35
            Column = 2
            PRINT "Pays on all 2nd COLUMN bets"
        CASE ELSE
            Column = 3
            PRINT "Pays on all 3rd COLUMN bets"
    END SELECT


END SUB


SUB DetermineDozen STATIC
' ========================= DetermineDozen =============================
' The DetermineDozen subroutine determines which Dozen the number is
'     and sets the Dozen switch to "0", "1", "2", or "3".
' ======================================================================
'

    DEFSNG A-Z
    DEFDBL A-Z

    LOCATE 14, 27

    SELECT CASE Number
        CASE 1 TO 12
            Dozen = 1
            PRINT "Pays on all 1st DOZEN bets"
        CASE 13 TO 24
            Dozen = 2
            PRINT "Pays on all 2nd DOZEN bets"
        CASE 25 TO 36
            Dozen = 3
            PRINT "Pays on all 3rd DOZEN bets"
        CASE 37, 38
            Dozen = 0
            PRINT "Takes all bets on any DOZEN bet"
    END SELECT


END SUB


SUB DetermineHighLow STATIC
' ======================== DetermineHighLow ============================
' The DetermineHighLow subroutine determines whether the number was
'     HIGH (19 to 36) or LOW (1 to 18) and set the HighLow Switch to
'     "H", "L", or " ".
' ======================================================================
'

    DEFSNG A-Z
    DEFDBL A-Z

    LOCATE 12, 27

    SELECT CASE Number
        CASE 1 TO 18
            HighLow = 1
            PRINT "Pays on all LOW (1 to 18) bets"
        CASE 19 TO 36
            HighLow = 2
            PRINT "Pays on all HIGH (19 to 36) bets"
        CASE 37, 38
            HighLow = 0
            PRINT "Takes one-half of all HIGH and LOW Bets"
    END SELECT


END SUB


SUB DetermineOddEven STATIC
' ======================== DetermineOddEven ============================
' The DetermineOddEven subroutine determines whether the number was
'     ODD or EVEN and sets the OddEven Switch to "O", "E", or " "
' ======================================================================
'

    DEFSNG A-Z
    DEFDBL A-Z

    LOCATE 11, 27

    SELECT CASE Number
        CASE 37, 38
            OddEven = 0
            PRINT "Takes one-half of all ODD and EVEN Bets"
        CASE 1, 3, 5, 7, 9, 11, 13, 15, 17, 19, 21, 23, 25, 27, 29, 31, 33, 35
            OddEven = 1
            PRINT "Pays on all ODD bets"
        CASE ELSE
            OddEven = 2
            PRINT "Pays on all EVEN bets"
    END SELECT


END SUB


SUB DeterminePayoffs STATIC
' ======================== DeterminePayoffs ============================
' The DeterminePayoffs subroutine calls all the various payoffs and
'     sets the payoff type switches accordingly
' ======================================================================
'

    DEFSNG A-Z
    DEFDBL A-Z

    LOCATE 8, 27: COLOR HeadingColor%, BackGroundColor%: PRINT "Payoff Results"
    LOCATE 9, 27: PRINT "---------------------------------------"

    COLOR ForeGroundColor%, BackGroundColor%

    DetermineColor
    DetermineOddEven
    DetermineHighLow
    DetermineColumn
    DetermineDozen



END SUB


SUB DisplayBetToScreen STATIC
'========================== DisplayBetToScreen =========================
' The DisplayBetToScreen Subroutine displays the bet onto the screen in
'     a formatted manner, with dollar-signs and commas in the amount
'     fields.
'=======================================================================

    DEFSNG A-Z
    DEFDBL A-Z

    LOCATE RowPointer%, 24

    PRINT USING "###. "; BetNumber%;
    PRINT USING " \         \"; NumOut$;
    PRINT USING "  \          \  "; TypOut$;
    PRINT USING "$$#,###.##  "; BetAmount;
    IF PayoffAmount > 0 THEN
        PRINT USING "$$#,###.##"; PayoffAmount
    END IF

    RowPointer% = RowPointer% + 1
    IF RowPointer% = 23 THEN ClearPayoffArea


END SUB


SUB DisplayIntroScreen STATIC
'========================== DisplayIntroScreen =========================
' The DisplayIntroScreen Subroutine displays the introductory text onto
'     the screen. The MainScreenInit must me executed before this
'     routine to put out the mast and border screen.
'=======================================================================

    DEFSNG A-Z
    DEFDBL A-Z

    LOCATE 6, 5: PRINT "Welcome to release 1.0 of AC-ROULETTE!"
    LOCATE 7, 5: PRINT "--------------------------------------"
    LOCATE 9, 5: PRINT "The goal of this game is to be a teaching aid for those who would like to"
    LOCATE 10, 5: PRINT "improve their skill at playing roulette."
    LOCATE 12, 5: PRINT "This version is a text-style game that allows the player to select any"
    LOCATE 13, 5: PRINT "bet that would normally be allowed in a casino.  This game uses the"
    LOCATE 14, 5: PRINT "American Style wheel for its play (0 and 00)."
    LOCATE 16, 5: PRINT "You will start you play off with the following:"
    LOCATE 18, 5: PRINT "      Starting BankRoll = $500.00 "
    LOCATE 19, 5: PRINT "          Table Minimums: $5 on each Outside Bet."
    LOCATE 20, 5: PRINT "                          $5 on total all Inside Bets."
    LOCATE 21, 5: PRINT "          Table Maximums: $500 for ALL BETS on the Table."
    LOCATE 23, 5: PRINT "                                                    [ENTER] to continue..."

    PAUSE

    Wipe 4, 24, 1, 80, BackGroundColor%
    LOCATE 6, 5: PRINT "This program is a full working copy of AC-Roulette Release 1.0. It is"
    LOCATE 7, 5: PRINT "distributed as shareware. Shareware gives you the opportunity to review"
    LOCATE 8, 5: PRINT "the software prior to paying for it. If you like this program after the"
    LOCATE 9, 5: PRINT "the 30 day evaluation period, you are obligated to pay for it."
    LOCATE 10, 5: PRINT "To Register this software, Send $15 to me at:"
    LOCATE 12, 5: PRINT "              George McGinn"
    LOCATE 13, 5: PRINT "              908 Roseau W"
    LOCATE 14, 5: PRINT "              Venice, FL  34285"
    LOCATE 16, 5: PRINT "If you wish to pay using ZELLE, send $15 to gjmcginn@icloud.com"
    LOCATE 18, 5: PRINT "Registration entitles you to the full documentation as explained in the"
    LOCATE 19, 5: PRINT "'BENEFITS.TXT' file in your distrubution, including the most current"
    LOCATE 20, 5: PRINT "version. Your registration allows me to continue to produce updates and"
    LOCATE 21, 5: PRINT "new programs. Please fill in the questionaire and email it back. Thank You."
    LOCATE 23, 5: PRINT "                                                   [ENTER] to continue..."


END SUB


SUB ErrorDisplay STATIC
' ============================ ErrorDisplay ===========================
' The ErrorDisplay subroutine displays a window with an error message
'     in it. This routine will pause for the user to hit any key to
'     continue. The Message will be stored in the errArray$ array.
'     a maximum of 3 lines are permitted
' ======================================================================
'

    DEFSNG A-Z
    DEFDBL A-Z

    IF ERR = InvalidSpinAgain OR ERR = InvalidKeepWager THEN
        errWTop! = 19
        errWBottom! = 23
        errWLeft! = 5
        errWRight! = 75
        errWLBL$ = " ERROR! "
        MakeWindow errWTop!, errWLeft!, errWBottom!, errWRight!, errWFClr%, errWBClr%, errWLBL$
        COLOR errTClr%, errWBClr%
        LOCATE 20, 11: PRINT errArray$(1)
        LOCATE 21, 11: PRINT errArray$(2)
        LOCATE 22, 11: PRINT errArray$(3)
        BEEP
        COLOR ForeGroundColor%, BackGroundColor%
        PAUSE
    ELSE
        errWTop! = 10
        errWBottom! = 16
        errWLeft! = 5
        errWRight! = 75
        errWLBL$ = " ERROR! "
        MakeWindow errWTop!, errWLeft!, errWBottom!, errWRight!, errWFClr%, errWBClr%, errWLBL$
        COLOR errTClr%, errWBClr%
        LOCATE 12, 11: PRINT errArray$(1)
        LOCATE 13, 11: PRINT errArray$(2)
        LOCATE 14, 11: PRINT errArray$(3)
        BEEP
        COLOR ForeGroundColor%, BackGroundColor%
        PAUSE
    END IF


END SUB


FUNCTION GetBackground% (row%, col%)
' ========================== GetBackground% ============================
' The GetBackground% Function will return the background color of the
'     character cell at the specified row and column of the screen.
' ======================================================================
'

    DEFSNG A-Z

    DEF SEG = GetVideoSegment

    attr% = PEEK(((row% - 1) * 160) + ((col% - 1) * 2) + 1)

    step1% = (attr% AND &HFF) \ 16

    IF step1% > 7 THEN        ' Foreground is blinking
        GetBackground% = step1% - 8
    ELSE                      ' Foreground is NOT blinking
        GetBackground% = step1%
    END IF

    DEF SEG

END FUNCTION



FUNCTION GetForeground% (row%, col%)
' ========================== GetForeground% ============================
' The GetBackground% Function will return the foreground color of the
'     character cell at the specified row and column of the screen.
' ======================================================================
'

    DEFSNG A-Z

    DEF SEG = GetVideoSegment

    attr% = PEEK(((row% - 1) * 160) + ((col% - 1) * 2) + 1)

    step1% = attr% AND &HFF

    IF step1% > 127 THEN ' Color is blinking
        GetForeground% = ((step1% - 128) MOD 16) + 16
    ELSE ' Color is NOT blinking
        GetForeground% = step1% MOD 16
    END IF

    DEF SEG

END FUNCTION



FUNCTION GetVideoSegment!
' ========================= GetVideoSegment ============================
' The GetVideoSegment function returns as a value the memory address
'     where the video display memory begins.  There are only two
'     possible return values, one for monochrome and one for color.
'     This routine is used to obtain the video segment for use with the
'     routines that work with screens or windowing.
' ======================================================================
'

    DEFSNG A-Z

    DEF SEG = 0

    adapter = PEEK(&H463)

    IF adapter = &HB4 THEN
        GetVideoSegment = &HB000 ' Mono
    ELSE
        GetVideoSegment = &HB800 ' Color
    END IF

END FUNCTION


SUB IntroScreenInit STATIC
'=========================== IntroScreenInit ===========================
' The IntroScreenInit Subroutine initializes the Screen that will be
'     displayed upon initial startup.  This is where user intro screens
'     will be built when being modified for a promotion by an outside
'     organization.
'=======================================================================
'

    DEFDBL A-Z

    CLS

    COLOR IntroFColor1%, IntroBColor1%
    Center "======================================", 4
    COLOR IntroFColor2%, IntroBColor1%
    Center "==========================================", 5
    COLOR IntroFColor1%, IntroBColor1%
    Center "==============================================", 6
    COLOR IntroFColor2%, IntroBColor1%
    Center "  ===========                            ===========  ", 7
    COLOR IntroFColor1%, IntroBColor1%
    Center "===========                                ===========", 8
    COLOR IntroFColor2%, IntroBColor1%
    Center "===========                                ===========", 9
    COLOR IntroFColor1%, IntroBColor1%
    Center "===========                                ===========", 10
    COLOR IntroFColor2%, IntroBColor1%
    Center "  ===========                            ===========  ", 11
    COLOR IntroFColor1%, IntroBColor1%
    Center "==============================================", 12
    COLOR IntroFColor2%, IntroBColor1%
    Center "==========================================", 13
    COLOR IntroFColor1%, IntroBColor1%
    Center "======================================", 14

    COLOR IntroFColor3%, IntroBColor2%
    Center "+----------------------+", 8
    Center "|                      |", 9
    Center "+----------------------+", 10

    COLOR IntroFColor5%, IntroBColor2%
    Center "AMERICAN ROULETTE", 9

    COLOR BLINKING + IntroFColor4%, IntroBColor1%
    Center "*** Unregistered Version ***", 20

    COLOR IntroFColor4%, IntroBColor1%
    Center "Copyright 1991, 2019 - George McGinn - All Rights Reserved", 23

    PAUSE

END SUB


SUB LoadBankroll STATIC
' ============================ LoadBankroll ============================
' The loadBankroll Subroutine will load a saved bankroll by a filename
'     that is supplied to the user. It will save with the extention of
'     FileName$.BNK and qill put it onto the current drive.
' ======================================================================
'
    DEFSNG A-Z
    DEFDBL A-Z

    NOERRORS = TRUE
    Wipe 4, 24, 1, 80, BackGroundColor%
    LOCATE 6, 3: INPUT "Enter File Name (Up to 8 characters):"; FileName$

    IF FileName$ = "" THEN
        EXIT SUB
    ELSE
        FileName$ = FileName$ + ".BNK"
        OPEN FileName$ FOR INPUT AS #1
        IF NOERRORS THEN
            INPUT #1, BankRoll
            CLOSE #1
            LOCATE 11, 3: PRINT "**** Loaded...  BANKROLL ="; BankRoll
            FOR x = 1 TO 2500
            NEXT x
        ELSE
            LoadBankroll
        END IF
    END IF


END SUB


SUB MainScreenInit STATIC
'============================ MainScreenInit ===========================
' The MainScreenInit Subroutine initializes the Screen that will be
'     displayed while playing the game. This screen will contain the
'     introductory message and other information.
'=======================================================================
'

    DEFDBL A-Z

    scrArray$(1) = "********************************************************************************"
    scrArray$(2) = "*                     ROULETTE - AMERICAN CASION ROULETTE                      *"
    scrArray$(3) = "*                        Copyright 1991 - George McGinn                        *"
    scrArray$(4) = "********************************************************************************"
    scrArray$(5) = "*                                                                              *"
    scrArray$(6) = "*                                                                              *"
    scrArray$(7) = "*                                                                              *"
    scrArray$(8) = "*                                                                              *"
    scrArray$(9) = "*                                                                              *"
    scrArray$(10) = "*                                                                              *"
    scrArray$(11) = "*                                                                              *"
    scrArray$(12) = "*                                                                              *"
    scrArray$(13) = "*                                                                              *"
    scrArray$(14) = "*                                                                              *"
    scrArray$(15) = "*                                                                              *"
    scrArray$(16) = "*                                                                              *"
    scrArray$(17) = "*                                                                              *"
    scrArray$(18) = "*                                                                              *"
    scrArray$(19) = "*                                                                              *"
    scrArray$(20) = "*                                                                              *"
    scrArray$(21) = "*                                                                              *"
    scrArray$(22) = "*                                                                              *"
    scrArray$(23) = "*                                                                              *"
    scrArray$(24) = "*                                                                              *"
    scrArray$(25) = "********************************************************************************"

END SUB


SUB MakeWindow (topRow!, leftCol!, botRow!, rightCol!, foreColor%, backColor%, label$)
'============================== MakeWindow =============================
' The MakeWindow Subroutine draws windows on the screen for you. The
'     kinds of windows you can make is quite varied.  There are 10
'     window types, six different frame types, windows can have shadows
'     or not, you can 'explode' them onto the screen, and even place
'     labels on them.
'=======================================================================
'
' The parameters are as follows:
'
' topRow!     - This is a numerical value containing the top-most row of
'               the window.  Allowable range is 1 through 22.
' leftCol!    - This is a numerical value containing the left-most side
'               of the window.  Allowable range is 1 to 79.
' botRow!     - This is a numerical value containing the bottom-most row
'               of the window.  Allowable range is 2 through 23.
' rightCol!   - This is a numerical value containing the right-most row
'               of the window.  Allowable range is 2 through 80.
' foreColor%  - This is the foreground color of the window.  Allowable
'               range is 0 through 15.
' backColor%  - This is the background color of the window.  Allowable
'               range is 0 through 7.
' label$       - This is a string used to label your window.  It is
'                placed along the top line of your window, framed by
'                brackets. A string of zero length ("") means don't
'                don't display any label. Allowable string length is
'                equal to (RightCol - LeftCol) - 4
'=======================================================================
'

    REM $DYNAMIC
    DEFSNG A-Z
    DIM line$(24)

    part1 = 0: part2 = 0: numLines = 0

    numLines = 0

    IF topRow < 1 THEN topRow = 1
    IF topRow > 22 THEN topRow = 22
    IF botRow < 2 THEN botRow = 2
    IF botRow > 25 THEN botRow = 25
    IF rightCol < 2 THEN rightCol = 2
    IF rightCol > 80 THEN rightCol = 80
    IF leftCol < 1 THEN leftCol = 1
    IF leftCol > 79 THEN leftCol = 79

    IF foreColor% < 0 OR foreColor% > 15 THEN foreColor% = 7
    IF backColor% < 0 OR backColor% > 7 THEN backColor% = 0

    IF LEN(label$) > ((rightCol - leftCol) - 4) THEN label$ = ""


'******************************************************
' Setup Frame Type. (Double Lined Frame)
'******************************************************

    urc$ = CHR$(187): ulc$ = CHR$(201)
    llc$ = CHR$(200): lrc$ = CHR$(188)
    ver$ = CHR$(186): hor$ = CHR$(205)
    vtl$ = CHR$(204): vtr$ = CHR$(185)
    htt$ = CHR$(203): htb$ = CHR$(202)
    crs$ = CHR$(206): blk$ = CHR$(219)
    lbl$ = CHR$(181): lbr$ = CHR$(198)

    numLines = (botRow - topRow) + 1
    REDIM line$(numLines)


'**************************************************************
' Expode Type  - Explode automatic - determine explode ratio
'**************************************************************

    explodeStep% = INT((rightCol - leftCol) / (botRow - topRow))


'***********************************************************
' Construct the window strings - Regular box, no extra lines
'***********************************************************

    line$(1) = ulc$ + STRING$((rightCol - leftCol) - 1, hor$) + urc$
    FOR x% = 2 TO numLines - 1
        line$(x%) = ver$ + SPACE$((rightCol - leftCol) - 1) + ver$
    NEXT x%
    line$(numLines) = llc$ + STRING$((rightCol - leftCol) - 1, hor$) + lrc$


'*******************************************************************
' Place the window on the screen using method based on explodeStep%
'*******************************************************************
    COLOR foreColor%, backColor%

    expX1% = INT(((rightCol - leftCol) / 2) + leftCol): expX2% = expX1%
    expY1% = INT(((botRow - topRow) / 2) + topRow): expY2% = expY1%
    WHILE (expX1% > leftCol + 1) OR (expY1% > topRow + 1)
        IF expX1% > leftCol THEN expX1% = expX1% - explodeStep%
        IF expX2% < rightCol THEN expX2% = expX2% + explodeStep%
        IF expY1% > topRow THEN expY1% = expY1% - 1
        IF expY2% < botRow THEN expY2% = expY2% + 1
        IF expX1% < leftCol THEN
            expX1% = leftCol
            expX2% = rightCol
        END IF
        IF expY1% < topRow THEN
            expY1% = topRow
            expY2% = botRow
        END IF
        LOCATE expY1%, expX1%: PRINT ulc$ + STRING$((expX2% - expX1%) - 1, hor$) + urc$;
        FOR x% = expY1% + 1 TO expY2% - 1
            LOCATE x%, expX1%: PRINT ver$ + SPACE$((expX2% - expX1%) - 1) + ver$;
        NEXT x%
        LOCATE expY2%, expX1%: PRINT llc$ + STRING$((expX2% - expX1%) - 1, hor$) + lrc$;
    WEND
    FOR x% = 1 TO numLines
        LOCATE (x% + (topRow - 1)), leftCol: PRINT line$(x%);
    NEXT x%


'****************************************
' Add a shadow if required
'****************************************

    COLOR shadowColor%, 0
    sideShadow$ = STRING$(2, 219)
    botShadow$ = STRING$((rightCol - leftCol), 219)
    FOR x% = topRow + 1 TO botRow + 1
        LOCATE x%, rightCol + 1: PRINT sideShadow$;
    NEXT x%
    LOCATE botRow + 1, leftCol + 2: PRINT botShadow$;


    COLOR foreColor%, backColor%

    IF label$ <> "" THEN
        Windowlabel$ = lbl$ + label$ + lbr$
        LOCATE topRow, leftCol + 1
        PRINT Windowlabel$;
    END IF

END SUB


FUNCTION NUMERIC% (Amount$)
' ============================= NUMERIC ================================
' The NUMERIC Function returns a value of "TRUE" if the input is a
'     valid number, else it returns a "FALSE" if it is not.
' ======================================================================
'
    DEFDBL A-Z

    NUMERIC% = TRUE
    DecimalPointFound = FALSE
    LenghtofAmount = LEN(Amount$)

    FOR I = 1 TO LenghtofAmount
        Valid = INSTR(Numbers$, MID$(Amount$, I, 1))
        SELECT CASE Valid
            CASE 11
                IF DecimalPointFound THEN
                    NUMERIC% = FALSE
                    EXIT FOR
                ELSE
                    DecimalPointFound = TRUE
                END IF
            CASE 0
                NUMERIC% = FALSE
                EXIT FOR
        END SELECT
    NEXT I


END FUNCTION


SUB PAUSE STATIC
' =============================== PAUSE ================================
'   The Pause subprogram simply creates a pause in the action until the
'       user presses a key at the keyboard
' ======================================================================

    DEFDBL A-Z

    DO
        InChar$ = INKEY$
    LOOP UNTIL InChar$ <> ""

END SUB


'***************************************************************************
'*** GET BETS ROUTINES
'***

SUB GetBucketBet STATIC
' ============================ GetBucketBet ============================
' The GetBucketBet subroutine Gets and records the player's Bucket Bet.
'     (0-2-00)  Also, checking is done to make sure that the player
'     does not exceed their BankRoll.
' ======================================================================
'

    DEFDBL A-Z
    ReturnedValue = 0

    Wipe 6, 24, 1, 80, BackGroundColor%

    LOCATE 9, 3: PRINT "Bucket Bet Selected (Payoff 11-1)"

    BetTable(BetNumber%, 1) = 13
    BetTable(BetNumber%, 2) = 37
    BetTable(BetNumber%, 3) = 2
    BetTable(BetNumber%, 4) = 38

    LOCATE 11, 3: INPUT "Enter dollar amount"; DollarAmount$
    IF NUMERIC(DollarAmount$) THEN
        BetAmount = VAL(DollarAmount$)
        CheckBankroll
        IF GoodBet THEN
            BetTable(BetNumber%, 5) = BetAmount
            Bets = Bets + BetAmount
            Table = Table + BetAmount
            TotalInsideBets = TotalInsideBets + BetAmount
            BetNumber% = BetNumber% + 1
        END IF
    ELSE
        ERROR NotNumeric
    END IF


END SUB


SUB GetColumnBet STATIC
' =========================== GetColumnBet =============================
' The GetColumnBet subroutine gets and records the player's Column Bet.
'     Also, checking is done to make sure the player does not exceed
'     their BankRoll.
' ======================================================================
'

    DEFSNG A-Z
    DEFDBL A-Z

    Wipe 6, 24, 1, 80, BackGroundColor%

    LOCATE 9, 3: PRINT "Columns Selected (Payoff 2-1)"
    LOCATE 11, 3: INPUT "Enter Column Number"; Selection$

    BetTable(BetNumber%, 1) = 25

    SELECT CASE Selection$

        CASE "1", "2", "3"
            LOCATE 13, 3: INPUT "Enter dollar amount"; DollarAmount$
            IF NUMERIC(DollarAmount$) THEN
                BetAmount = VAL(DollarAmount$)
                IF BetAmount < TableMinimum THEN
                    ERROR OutUnderTableMinimum
                    ClearBetTable
                    GetOutsideBets
                ELSE
                    CheckBankroll
                    IF GoodBet THEN
                        BetTable(BetNumber%, 2) = VAL(Selection$)
                        BetTable(BetNumber%, 3) = BetAmount
                        Bets = Bets + BetTable(BetNumber%, 3)
                        Table = Table + BetTable(BetNumber%, 3)
                        BetNumber% = BetNumber% + 1
                    END IF
                END IF
            ELSE
                ERROR NotNumeric
            END IF

        CASE ELSE
            ERROR InvalidColumn

    END SELECT


END SUB


SUB GetCornerBet STATIC
' ============================ GetCornerBet ============================
' The GetCornerBet subroutine Gets and records the player's Corner Bet.
'     Also, checking is done to make sure that the player does not
'     exceed their BankRoll.
' ======================================================================
'

    DEFSNG A-Z
    DEFDBL A-Z

    Wipe 6, 24, 1, 80, BackGroundColor%

    LOCATE 9, 3: PRINT "Corner Bet Selected (Payoff 8-1)"
    LOCATE 11, 3: INPUT "Enter 1st number of Corner"; Selection$

    BetTable(BetNumber%, 1) = 15

    SELECT CASE Selection$

        CASE "3", "6", "9", "12", "15", "18", "21", "24", "27", "30", "33", "36"
            ERROR InvalidCorner

        CASE ELSE
            BetTable(BetNumber%, 2) = VAL(Selection$)
            BetTable(BetNumber%, 3) = BetTable(BetNumber%, 2) + 1
            BetTable(BetNumber%, 4) = BetTable(BetNumber%, 2) + 3
            BetTable(BetNumber%, 5) = BetTable(BetNumber%, 2) + 4
            LOCATE 13, 3: INPUT "Enter dollar amount"; DollarAmount$
            IF NUMERIC(DollarAmount$) THEN
                BetAmount = VAL(DollarAmount$)
                CheckBankroll
                IF GoodBet THEN
                    BetTable(BetNumber%, 6) = BetAmount
                    Bets = Bets + BetTable(BetNumber%, 6)
                    Table = Table + BetTable(BetNumber%, 6)
                    BetNumber% = BetNumber% + 1
                    TotalInsideBets = TotalInsideBets + BetAmount
                END IF
            ELSE
                ERROR NotNumeric
            END IF

    END SELECT


END SUB


SUB GetDoubleStreetBet STATIC
' ========================== GetDoubleStreetBet ========================
' The GetDoubleStreetBet subroutine Gets and records the player's
'     Double Street Bet. Also, checking is done to make sure that the
'     player does not exceed their BankRoll.
' ======================================================================
'

    DEFSNG A-Z
    DEFDBL A-Z

    Wipe 6, 24, 1, 80, BackGroundColor%

    LOCATE 9, 3: PRINT "Double Street Bet Selected (Payoff 6-1)"
    LOCATE 11, 3: INPUT "Enter 1st number of Street"; Selection$

    BetTable(BetNumber%, 1) = 16

    SELECT CASE Selection$

        CASE "1", "4", "7", "10", "13", "16", "19", "22", "25", "28", "31"
            BetTable(BetNumber%, 2) = VAL(Selection$)
            BetTable(BetNumber%, 3) = BetTable(BetNumber%, 2) + 1
            BetTable(BetNumber%, 4) = BetTable(BetNumber%, 2) + 2
            BetTable(BetNumber%, 5) = BetTable(BetNumber%, 2) + 3
            BetTable(BetNumber%, 6) = BetTable(BetNumber%, 2) + 4
            BetTable(BetNumber%, 7) = BetTable(BetNumber%, 2) + 5
            LOCATE 13, 3: INPUT "Enter dollar amount"; DollarAmount$
            IF NUMERIC(DollarAmount$) THEN
                BetAmount = VAL(DollarAmount$)
                CheckBankroll
                IF GoodBet THEN
                    BetTable(BetNumber%, 8) = BetAmount
                    Bets = Bets + BetTable(BetNumber%, 8)
                    Table = Table + BetTable(BetNumber%, 8)
                    BetNumber% = BetNumber% + 1
                    TotalInsideBets = TotalInsideBets + BetAmount
                END IF
            ELSE
                ERROR NotNumeric
            END IF

        CASE ELSE
            ERROR InvalidDblStreet

    END SELECT


END SUB


SUB GetDozenBet STATIC
' ============================= GetDozenBet ============================
' The GetDozenBet subroutine gets and records the player's Dozen Bet.
'     Also, checking is done to make sure the player does not exceed
'     their BankRoll.
' ======================================================================
'

    DEFSNG A-Z
    DEFDBL A-Z

    Wipe 6, 24, 1, 80, BackGroundColor%

    LOCATE 9, 3: PRINT "Dozens Selected (Payoff 2-1)"
    LOCATE 11, 3: INPUT "Enter Dozen Number"; Selection$

    BetTable(BetNumber%, 1) = 24

    SELECT CASE Selection$

        CASE "1", "2", "3"
            LOCATE 13, 3: INPUT "Enter dollar amount"; DollarAmount$
            IF NUMERIC(DollarAmount$) THEN
                BetAmount = VAL(DollarAmount$)
                IF BetAmount < TableMinimum THEN
                    ERROR OutUnderTableMinimum
                    ClearBetTable
                    GetOutsideBets
                ELSE
                    CheckBankroll
                    IF GoodBet THEN
                        BetTable(BetNumber%, 2) = VAL(Selection$)
                        BetTable(BetNumber%, 3) = BetAmount
                        Bets = Bets + BetTable(BetNumber%, 3)
                        Table = Table + BetTable(BetNumber%, 3)
                        BetNumber% = BetNumber% + 1
                    END IF
                END IF
            ELSE
                ERROR NotNumeric
            END IF

        CASE ELSE
            ERROR InvalidDozen

    END SELECT


END SUB


SUB GetFiveLineBet STATIC
' =========================== GetFiveLineBet ===========================
' The GetFiveLineBet subroutine Gets and records the player's Five Line
'     Bet.  Also, checking is done to make sure that the player does
'     not exceed their BankRoll.
' ======================================================================
'

    DEFSNG A-Z
    DEFDBL A-Z

    Wipe 6, 24, 1, 80, BackGroundColor%

    LOCATE 9, 3: PRINT "5-Line Bet Selected (Payoff 6-1)"

    BetTable(BetNumber%, 1) = 17
    BetTable(BetNumber%, 2) = 37
    BetTable(BetNumber%, 3) = 38
    BetTable(BetNumber%, 4) = 1
    BetTable(BetNumber%, 5) = 2
    BetTable(BetNumber%, 6) = 3

    LOCATE 11, 3: INPUT "Enter dollar amount"; DollarAmount$
    IF NUMERIC(DollarAmount$) THEN
        BetAmount = VAL(DollarAmount$)
        CheckBankroll
        IF GoodBet THEN
            BetTable(BetNumber%, 7) = BetAmount
            Bets = Bets + BetTable(BetNumber%, 7)
            Table = Table + BetTable(BetNumber%, 7)
            BetNumber% = BetNumber% + 1
            TotalInsideBets = TotalInsideBets + BetAmount
        END IF
    ELSE
        ERROR NotNumeric
    END IF


END SUB


SUB GetHighLowBet STATIC
' =========================== GetHighLowBet ============================
' The GetHighLowBet subroutine gets and records the player's High or
'     Low Bet. Also, checking is done to make sure the player does not
'     exceed their BankRoll.
' ======================================================================
'

    DEFDBL A-Z

    Wipe 6, 24, 1, 80, BackGroundColor%

    LOCATE 9, 3: PRINT "High/Low Selected (Payoff 1-1)"
    LOCATE 11, 3: INPUT "Enter [H]igh or [L]ow"; Selection$
    Selection$ = UCASE$(Selection$)

    BetTable(BetNumber%, 1) = 22

    SELECT CASE Selection$

        CASE "H", "L"
            IF Selection$ = "H" THEN
                BetTable(BetNumber%, 2) = 2
            ELSE
                BetTable(BetNumber%, 2) = 1
            END IF
            LOCATE 13, 3: INPUT "Enter dollar amount"; DollarAmount$
            IF NUMERIC(DollarAmount$) THEN
                BetAmount = VAL(DollarAmount$)
                IF BetAmount < TableMinimum THEN
                    ERROR OutUnderTableMinimum
                    ClearBetTable
                    GetOutsideBets
                ELSE
                    CheckBankroll
                    IF GoodBet THEN
                        BetTable(BetNumber%, 3) = BetAmount
                        Bets = Bets + BetTable(BetNumber%, 3)
                        Table = Table + BetTable(BetNumber%, 3)
                        BetNumber% = BetNumber% + 1
                    END IF
                END IF
            ELSE
                ERROR NotNumeric
            END IF

        CASE ELSE
            ERROR InvalidHighLow

    END SELECT


END SUB


SUB GetInsideBets STATIC
' =========================== GetInsideBets ============================
' The GetInsideBets subroutine Gets and records all the player's inside
'     bets. Inside bets are StraightUp bets, Split bets, Corners (or
'     a Quad bet), Street and Double Street bets, the Bucket Bet
'     (0-2-00 bet), and the 5-Line Bet (0-00-1-2-3).
' ======================================================================
'

    DEFSNG A-Z
    DEFDBL A-Z

    BetLoop$ = "Y"

    DO
        Wipe 4, 24, 1, 80, BackGroundColor%
        LOCATE 6, 3: PRINT "**** BANKROLL ="; USING "$$,###,###.##"; BankRoll
        LOCATE 6, 43: PRINT "**** CURRENT BETS = "; USING "$$#,###.##"; Table
        LOCATE 8, 3: PRINT "INSIDE BETS - Select Bet Type:"
        LOCATE 9, 3: PRINT "   1) Straight Up     (Pays 35 to 1)"
        LOCATE 10, 3: PRINT "   2) Split           (Pays 17 to 1)"
        LOCATE 11, 3: PRINT "   3) Bucket          (Pays 11 to 1)"
        LOCATE 12, 3: PRINT "   4) Street          (Pays 11 to 1)"
        LOCATE 13, 3: PRINT "   5) Corner (Quad)   (Pays 8 to 1)"
        LOCATE 14, 3: PRINT "   6) Double Street   (Pays 5 to 1)"
        LOCATE 15, 3: PRINT "   7) 5-Line          (Pays 6 to 1)"
        LOCATE 17, 3: PRINT "  [ENTER] - No More Bets"
        LOCATE 19, 3: INPUT "Choose Type of Bet"; BetType$

        SELECT CASE BetType$
            CASE "1"
                GetStraightUpBet
            CASE "2"
                GetSplitBet
            CASE "3"
                GetBucketBet
            CASE "4"
                GetStreetBet
            CASE "5"
                GetCornerBet
            CASE "6"
                GetDoubleStreetBet
            CASE "7"
                GetFiveLineBet
            CASE ELSE
                IF TotalInsideBets > 0 AND TotalInsideBets < TableMinimum THEN
                    ERROR InUnderTableMinimum
                    GetInsideBets
                ELSE
                    BetLoop$ = "N"
                END IF
        END SELECT

    LOOP UNTIL (BetLoop$ = "N" OR BetNumber% > 100)


END SUB


SUB GetOddEvenBet STATIC
' =========================== GetOddEvenBet ============================
' The GetOddEvenBet subroutine gets and records the player's Odd or
'     Even Bet. Also, checking is done to make sure the player does not
'     exceed their BankRoll.
' ======================================================================
'

    DEFSNG A-Z
    DEFDBL A-Z

    BetTable(BetNumber%, 1) = 23

    Wipe 6, 24, 1, 80, BackGroundColor%

    LOCATE 9, 3: PRINT "Odd/Even Selected (Payoff 1-1)"
    LOCATE 11, 3: INPUT "Enter [O]dd or [E]ven"; Selection$
    Selection$ = UCASE$(Selection$)

    SELECT CASE Selection$

        CASE "O", "E"
            IF Selection$ = "O" THEN
                BetTable(BetNumber%, 2) = 1
            ELSE
                BetTable(BetNumber%, 2) = 2
            END IF
            LOCATE 13, 3: INPUT "Enter dollar amount"; DollarAmount$
            IF NUMERIC(DollarAmount$) THEN
                BetAmount = VAL(DollarAmount$)
                IF BetAmount < TableMinimum THEN
                    ERROR OutUnderTableMinimum
                    ClearBetTable
                    GetOutsideBets
                ELSE
                    CheckBankroll
                    IF GoodBet THEN
                        BetTable(BetNumber%, 3) = BetAmount
                        Bets = Bets + BetTable(BetNumber%, 3)
                        Table = Table + BetTable(BetNumber%, 3)
                        BetNumber% = BetNumber% + 1
                    END IF
                END IF
            ELSE
                ERROR NotNumeric
            END IF

        CASE ELSE
            ERROR InvalidOddEven

    END SELECT


END SUB


SUB GetOutsideBets STATIC
' =========================== GetOutsideBets ===========================
' The GetOutsideBets subroutine gets and records the player's Outside
'     Bets.  These bets are on RED/BLACK, HIGH(19-36)/LOW(1-18),
'     ODD/EVEN, DOZENS and COLUMNS.
' ======================================================================
'

    DEFSNG A-Z
    DEFDBL A-Z

    BetLoop$ = "Y"

    DO
        Wipe 4, 24, 1, 80, BackGroundColor%
        LOCATE 6, 3: PRINT "**** BANKROLL ="; USING "$$,###,###.##"; BankRoll
        LOCATE 6, 43: PRINT "**** CURRENT BETS = "; USING "$$#,###.##"; Table
        LOCATE 8, 3: PRINT "OUTSIDE BETS - Select Bet Type:"
        LOCATE 9, 3: PRINT "   1) Red/Black       (Pays 1 to 1)"
        LOCATE 10, 3: PRINT "   2) High/Low        (Pays 1 to 1)"
        LOCATE 11, 3: PRINT "   3) Odd/Even        (Pays 1 to 1)"
        LOCATE 12, 3: PRINT "   4) Dozens          (Pays 2 to 1)"
        LOCATE 13, 3: PRINT "   5) Columns         (Pays 2 to 1)"
        LOCATE 15, 3: PRINT "  [ENTER] - No More Bets"
        LOCATE 17, 3: INPUT "Choose Type of Bet"; BetType$

        SELECT CASE BetType$
            CASE "1"
                GetRedBlackBet
            CASE "2"
                GetHighLowBet
            CASE "3"
                GetOddEvenBet
            CASE "4"
                GetDozenBet
            CASE "5"
                GetColumnBet
            CASE ELSE
                BetLoop$ = "N"
        END SELECT

    LOOP UNTIL (BetLoop$ = "N" OR BetNumber% > 100)


END SUB


SUB GetRedBlackBet STATIC
' ========================== GetRedBlackBet ============================
' The GetRedBlackBet subroutine gets and records the player's Red or
'     Black Bet. Also, checking is done to make sure the player does not
'     exceed their BankRoll.
' ======================================================================
'

    DEFSNG A-Z
    DEFDBL A-Z

    Wipe 6, 24, 1, 80, BackGroundColor%

    LOCATE 9, 3: PRINT "Red/Black Selected (Payoff 1-1)"
    LOCATE 11, 3: INPUT "Enter [R]ed or [B]lack"; Selection$
    Selection$ = UCASE$(Selection$)

    BetTable(BetNumber%, 1) = 21

    SELECT CASE Selection$

        CASE "R", "B"
            IF Selection$ = "R" THEN
                BetTable(BetNumber%, 2) = 1
            ELSE
                BetTable(BetNumber%, 2) = 2
            END IF
            LOCATE 13, 3: INPUT "Enter dollar amount"; DollarAmount$
            IF NUMERIC(DollarAmount$) THEN
                BetAmount = VAL(DollarAmount$)
                IF BetAmount < TableMinimum THEN
                    ERROR OutUnderTableMinimum
                    ClearBetTable
                    GetOutsideBets
                ELSE
                    CheckBankroll
                    IF GoodBet THEN
                        BetTable(BetNumber%, 3) = BetAmount
                        Bets = Bets + BetTable(BetNumber%, 3)
                        Table = Table + BetTable(BetNumber%, 3)
                        BetNumber% = BetNumber% + 1
                    END IF
                END IF
            ELSE
                ERROR NotNumeric
            END IF

        CASE ELSE
            ERROR InvalidRedBlack

    END SELECT


END SUB


SUB GetSplitBet STATIC
' ============================= GetSplitBet ============================
' The GetSplitBet subroutine Gets and records the player's Split Bet.
'     Also, checking is done to make sure that the player does not
'     exceed their BankRoll.
' ======================================================================
'

    DEFSNG A-Z
    DEFDBL A-Z

    Wipe 6, 24, 1, 80, BackGroundColor%

    LOCATE 9, 3: PRINT "Split Bet Selected (Payoff 17-1)"
    LOCATE 11, 3: INPUT "Enter 1st number desired"; Selection$

    BetTable(BetNumber%, 1) = 12

    SELECT CASE Selection$
        CASE "0"
            BetTable(BetNumber%, 2) = 37
        CASE "00"
            BetTable(BetNumber%, 2) = 38
        CASE ELSE
            NumericCheck = INSTR(WheelNumbers$, Selection$)
            IF NumericCheck > 0 THEN
                BetTable(BetNumber%, 2) = VAL(Selection$)
                SplitSecond1 = BetTable(BetNumber%, 2) + 1
                SplitSecond2 = BetTable(BetNumber%, 2) + 3
                SplitSecond3 = BetTable(BetNumber%, 2) - 1
                SplitSecond4 = BetTable(BetNumber%, 2) - 3
            ELSE
                ERROR InvalidSplit
                EXIT SUB
            END IF
    END SELECT

    LOCATE 12, 3: INPUT "Enter 2nd number desired"; Selection$

    SELECT CASE Selection$
        CASE "0"
            IF BetTable(BetNumber%, 2) = 38 THEN
                BetTable(BetNumber%, 3) = 37
            ELSE
                LineOut$ = "0"
                SplitOut$ = "00"
                ERROR InvalidSplitSecond
                EXIT SUB
            END IF
        CASE "00"
            IF BetTable(BetNumber%, 2) = 37 THEN
                BetTable(BetNumber%, 3) = 38
            ELSE
                LineOut$ = "00"
                SplitOut$ = "0"
                ERROR InvalidSplitSecond
                EXIT SUB
            END IF
        CASE ELSE
            NumericCheck = INSTR(WheelNumbers$, Selection$)
            IF NumericCheck > 0 THEN
                BetTable(BetNumber%, 3) = VAL(Selection$)
                SELECT CASE BetTable(BetNumber%, 2)
                    CASE 37
                        IF BetTable(BetNumber%, 3) <> 38 THEN
                            LineOut$ = "0"
                            SplitOut$ = "00"
                            ERROR InvalidSplitSecond
                            EXIT SUB
                        END IF
                    CASE 38
                        IF BetTable(BetNumber%, 3) <> 37 THEN
                            LineOut$ = "00"
                            SplitOut$ = "0"
                            ERROR InvalidSplitSecond
                            EXIT SUB
                        END IF
                    CASE 1
                        IF BetTable(BetNumber%, 3) <> SplitSecond1 AND BetTable(BetNumber%, 3) <> SplitSecond2 THEN
                            LineOut$ = LTRIM$(STR$(BetTable(BetNumber%, 2)))
                            SplitOut$ = LTRIM$(STR$(SplitSecond1))
                            SplitOut$ = SplitOut$ + " or " + LTRIM$(STR$(SplitSecond2))
                            ERROR InvalidSplitSecond
                            EXIT SUB
                        END IF
                    CASE 2
                        IF BetTable(BetNumber%, 3) <> SplitSecond1 AND BetTable(BetNumber%, 3) <> SplitSecond2 AND BetTable(BetNumber%, 3) <> SplitSecond3 THEN
                            LineOut$ = LTRIM$(STR$(BetTable(BetNumber%, 2)))
                            SplitOut$ = LTRIM$(STR$(SplitSecond3))
                            SplitOut$ = SplitOut$ + ", " + LTRIM$(STR$(SplitSecond1))
                            SplitOut$ = SplitOut$ + " or " + LTRIM$(STR$(SplitSecond2))
                            ERROR InvalidSplitSecond
                            EXIT SUB
                        END IF
                    CASE 3
                        IF BetTable(BetNumber%, 3) <> SplitSecond2 AND BetTable(BetNumber%, 3) <> SplitSecond3 THEN
                            LineOut$ = LTRIM$(STR$(BetTable(BetNumber%, 2)))
                            SplitOut$ = LTRIM$(STR$(SplitSecond3))
                            SplitOut$ = SplitOut$ + " or " + LTRIM$(STR$(SplitSecond2))
                            ERROR InvalidSplitSecond
                            EXIT SUB
                        END IF
                    CASE 4, 7, 10, 13, 16, 19, 22, 25, 28, 31, 34
                        IF BetTable(BetNumber%, 3) <> SplitSecond1 AND BetTable(BetNumber%, 3) <> SplitSecond2 AND BetTable(BetNumber%, 3) <> SplitSecond4 THEN
                            LineOut$ = LTRIM$(STR$(BetTable(BetNumber%, 2)))
                            SplitOut$ = LTRIM$(STR$(SplitSecond4))
                            SplitOut$ = SplitOut$ + ", " + LTRIM$(STR$(SplitSecond1))
                            SplitOut$ = SplitOut$ + " or " + LTRIM$(STR$(SplitSecond2))
                            ERROR InvalidSplitSecond
                            EXIT SUB
                        END IF
                    CASE 6, 9, 12, 15, 18, 21, 24, 27, 30, 33, 36
                        IF BetTable(BetNumber%, 3) <> SplitSecond2 AND BetTable(BetNumber%, 3) <> SplitSecond3 AND BetTable(BetNumber%, 3) <> SplitSecond4 THEN
                            LineOut$ = LTRIM$(STR$(BetTable(BetNumber%, 2)))
                            SplitOut$ = LTRIM$(STR$(SplitSecond4))
                            SplitOut$ = SplitOut$ + ", " + LTRIM$(STR$(SplitSecond3))
                            SplitOut$ = SplitOut$ + " or " + LTRIM$(STR$(SplitSecond2))
                            ERROR InvalidSplitSecond
                            EXIT SUB
                        END IF
                    CASE ELSE
                        IF BetTable(BetNumber%, 3) <> SplitSecond1 AND BetTable(BetNumber%, 3) <> SplitSecond2 AND BetTable(BetNumber%, 3) <> SplitSecond3 AND BetTable(BetNumber%, 3) <> SplitSecond4 THEN
                            LineOut$ = LTRIM$(STR$(BetTable(BetNumber%, 2)))
                            SplitOut$ = LTRIM$(STR$(SplitSecond4))
                            SplitOut$ = SplitOut$ + ", " + LTRIM$(STR$(SplitSecond3))
                            SplitOut$ = SplitOut$ + ", " + LTRIM$(STR$(SplitSecond2))
                            SplitOut$ = SplitOut$ + " or " + LTRIM$(STR$(SplitSecond1))
                            ERROR InvalidSplitSecond
                            EXIT SUB
                        END IF
                END SELECT
            ELSE
                ERROR InvalidSplit
                EXIT SUB
            END IF
    END SELECT

    LOCATE 14, 3: INPUT "Enter dollar amount"; DollarAmount$
    IF NUMERIC(DollarAmount$) THEN
        BetAmount = VAL(DollarAmount$)
        CheckBankroll
        IF GoodBet THEN
            BetTable(BetNumber%, 4) = BetAmount
            Bets = Bets + BetTable(BetNumber%, 4)
            Table = Table + BetTable(BetNumber%, 4)
            BetNumber% = BetNumber% + 1
            TotalInsideBets = TotalInsideBets + BetAmount
        END IF
    ELSE
        ERROR NotNumeric
    END IF


END SUB


SUB GetStraightUpBet STATIC
' ========================== GetStraightUpBet ==========================
' The GetStraightUpBet subroutine Gets and records the player's Straight
'     Up Bet.  Also, checking is done to make sure that the player does
'     not exceed their BankRoll.
' ======================================================================
'

    DEFSNG A-Z
    DEFDBL A-Z

    Wipe 6, 24, 1, 80, BackGroundColor%

    LOCATE 9, 3: PRINT "Straight Up Bet Selected (Payoff 35-1)"
    LOCATE 11, 3: INPUT "Enter number desired"; Selection$

    BetTable(BetNumber%, 1) = 11

    SELECT CASE Selection$

        CASE "0", "00"
            IF Selection$ = "0" THEN
                BetTable(BetNumber%, 2) = 37
            ELSE
                BetTable(BetNumber%, 2) = 38
            END IF
            LOCATE 13, 3: INPUT "Enter dollar amount"; DollarAmount$
            IF NUMERIC(DollarAmount$) THEN
                BetAmount = VAL(DollarAmount$)
                CheckBankroll
                IF GoodBet THEN
                    BetTable(BetNumber%, 3) = BetAmount
                    Bets = Bets + BetTable(BetNumber%, 3)
                    Table = Table + BetTable(BetNumber%, 3)
                    BetNumber% = BetNumber% + 1
                    TotalInsideBets = TotalInsideBets + BetAmount
                END IF
            ELSE
                ERROR NotNumeric
            END IF

        CASE ELSE
            NumericCheck = INSTR(WheelNumbers$, Selection$)
            IF NumericCheck > 0 THEN
                BetTable(BetNumber%, 2) = VAL(Selection$)
                LOCATE 13, 3: INPUT "Enter dollar amount"; DollarAmount$
                IF NUMERIC(DollarAmount$) THEN
                    BetAmount = VAL(DollarAmount$)
                    CheckBankroll
                    IF GoodBet THEN
                        BetTable(BetNumber%, 3) = BetAmount
                        Bets = Bets + BetTable(BetNumber%, 3)
                        Table = Table + BetTable(BetNumber%, 3)
                        BetNumber% = BetNumber% + 1
                        TotalInsideBets = TotalInsideBets + BetAmount
                    END IF
                ELSE
                    ERROR NotNumeric
                END IF
            ELSE
                ERROR InvalidStraight
            END IF

    END SELECT


END SUB


SUB GetStreetBet STATIC
' ============================ GetStreetBet ============================
' The GetStreetBet subroutine Gets and records the player's Street Bet.
'     Also, checking is done to make sure that the player does not
'     exceed their BankRoll.
' ======================================================================
'

    DEFSNG A-Z
    DEFDBL A-Z

    BetTable(BetNumber%, 1) = 14

    Wipe 6, 24, 1, 80, BackGroundColor%

    LOCATE 9, 3: PRINT "Street Bet Selected (Payoff 11-1)"
    LOCATE 11, 3: INPUT "Enter 1st number of Street"; BetTable(BetNumber%, 2)

    SELECT CASE BetTable(BetNumber%, 2)

        CASE 1, 4, 7, 10, 13, 16, 19, 22, 25, 28, 31, 34
            BetTable(BetNumber%, 3) = BetTable(BetNumber%, 2) + 1
            BetTable(BetNumber%, 4) = BetTable(BetNumber%, 2) + 2
            LOCATE 13, 3: INPUT "Enter dollar amount"; DollarAmount$
            IF NUMERIC(DollarAmount$) THEN
                BetAmount = VAL(DollarAmount$)
                CheckBankroll
                IF GoodBet THEN
                    BetTable(BetNumber%, 5) = BetAmount
                    Bets = Bets + BetTable(BetNumber%, 5)
                    Table = Table + BetTable(BetNumber%, 5)
                    BetNumber% = BetNumber% + 1
                    TotalInsideBets = TotalInsideBets + BetAmount
                END IF
            ELSE
                ERROR NotNumeric
            END IF

        CASE ELSE
            ERROR InvalidStreet

    END SELECT


END SUB


'***
'*** END GET BETS ROUTINES
'****************************************************************************




'****************************************************************************
'*** PAY BETS ROUTINES
'***

SUB PayInsideBets STATIC
' ========================== PayInsideBets =============================
' The PayInsideBets subroutine checks to see what kind of inside bet it
'     is and checks the numbers accordingly.  If it finds a winner, the
'     routine will calculate the Payoff and will add it to the Payoff
'     amount variable.
' ======================================================================
'

    DEFSNG A-Z
    DEFDBL A-Z

    PayoffAmount = 0

    SELECT CASE BetTable(BetNumber%, 1)

        CASE 11
            BetAmount = BetTable(BetNumber%, 3)
            SELECT CASE BetTable(BetNumber%, 2)
                CASE 37
                    NumOut$ = "0"
                CASE 38
                    NumOut$ = "00"
                CASE ELSE
                    NumOut$ = LTRIM$(STR$(BetTable(BetNumber%, 2)))
            END SELECT
            TypOut$ = "Straight-Up"
            IF Number = BetTable(BetNumber%, 2) THEN
                PayoffAmount = BetTable(BetNumber%, 3) * 35
                BankRoll = BankRoll + PayoffAmount + BetTable(BetNumber%, 3)
            END IF
            DisplayBetToScreen

        CASE 12
            BetAmount = BetTable(BetNumber%, 4)
            TypOut$ = "Split"
            IF BetTable(BetNumber%, 2) = 37 OR BetTable(BetNumber%, 2) = 38 THEN
                NumOut$ = "0-00"
            ELSE
                LineOut$ = LTRIM$(STR$(BetTable(BetNumber%, 2))) + "-"
                NumOut$ = LineOut$ + LTRIM$(STR$(BetTable(BetNumber%, 3)))
            END IF
            FOR Indx = 2 TO 3
                IF Number = BetTable(BetNumber%, Indx) THEN
                    PayoffAmount = BetTable(BetNumber%, 4) * 17
                    BankRoll = BankRoll + PayoffAmount + BetTable(BetNumber%, 4)
                    Indx = 3
                END IF
            NEXT Indx
            DisplayBetToScreen

        CASE 13
            BetAmount = BetTable(BetNumber%, 5)
            TypOut$ = "Bucket"
            NumOut$ = "0-2-00"
            FOR Indx = 2 TO 4
                IF Number = BetTable(BetNumber%, Indx) THEN
                    PayoffAmount = BetTable(BetNumber%, 5) * 11
                    BankRoll = BankRoll + PayoffAmount + BetTable(BetNumber%, 5)
                    Indx = 4
                END IF
            NEXT Indx
            DisplayBetToScreen

        CASE 14
            BetAmount = BetTable(BetNumber%, 5)
            TypOut$ = "Street"
            NumOut$ = LTRIM$(STR$(BetTable(BetNumber%, 2))) + "-" + LTRIM$(STR$(BetTable(BetNumber%, 4)))
            FOR Indx = 2 TO 4
                IF Number = BetTable(BetNumber%, Indx) THEN
                    PayoffAmount = BetTable(BetNumber%, 5) * 11
                    BankRoll = BankRoll + PayoffAmount + BetTable(BetNumber%, 5)
                    Indx = 4
                END IF
            NEXT Indx
            DisplayBetToScreen

        CASE 15
            BetAmount = BetTable(BetNumber%, 6)
            TypOut$ = "Corner"
            LineOut$ = LTRIM$(STR$(BetTable(BetNumber%, 2))) + "-"
            LineOut$ = LineOut$ + LTRIM$(STR$(BetTable(BetNumber%, 3))) + "-"
            LineOut$ = LineOut$ + LTRIM$(STR$(BetTable(BetNumber%, 4))) + "-"
            NumOut$ = LineOut$ + LTRIM$(STR$(BetTable(BetNumber%, 5)))
            FOR Indx = 2 TO 5
                IF Number = BetTable(BetNumber%, Indx) THEN
                    PayoffAmount = BetTable(BetNumber%, 6) * 8
                    BankRoll = BankRoll + PayoffAmount + BetTable(BetNumber%, 6)
                    Indx = 5
                END IF
            NEXT Indx
            DisplayBetToScreen

        CASE 16
            BetAmount = BetTable(BetNumber%, 8)
            TypOut$ = "DoubleStreet"
            NumOut$ = LTRIM$(STR$(BetTable(BetNumber%, 2))) + "-" + LTRIM$(STR$(BetTable(BetNumber%, 7)))
            FOR Indx = 2 TO 7
                IF Number = BetTable(BetNumber%, Indx) THEN
                    PayoffAmount = BetTable(BetNumber%, 8) * 5
                    BankRoll = BankRoll + PayoffAmount + BetTable(BetNumber%, 8)
                    Indx = 7
                END IF
            NEXT Indx
            DisplayBetToScreen

        CASE 17
            BetAmount = BetTable(BetNumber%, 7)
            TypOut$ = "Five Line"
            NumOut$ = "0-00-1-2-3"
            FOR Indx = 2 TO 6
                IF Number = BetTable(BetNumber%, Indx) THEN
                    PayoffAmount = BetTable(BetNumber%, 7) * 6
                    BankRoll = BankRoll + PayoffAmount + BetTable(BetNumber%, 7)
                    Indx = 6
                END IF
            NEXT Indx
            DisplayBetToScreen

    END SELECT


END SUB


SUB PayOutsideBets STATIC
' ========================== PayOutsideBets ============================
' The PayOutsideBets subroutine checks to see what kind of outside bet
'     it is and checks the numbers accordingly.  If it finds a winner,
'     the routine will calculate the Payoff and will add it to the
'     Payoff amount variable.
' ======================================================================
'

    DEFSNG A-Z
    DEFDBL A-Z

    Indx = 2
    PayoffAmount = 0

    SELECT CASE BetTable(BetNumber%, 1)

        CASE 21
            BetAmount = BetTable(BetNumber%, 3)
            TypOut$ = "Red/Black"
            IF BetTable(BetNumber%, 2) = 1 THEN
                NumOut$ = "Red"
            ELSE
                NumOut$ = "Black"
            END IF
            IF RedBlack = BetTable(BetNumber%, 2) THEN
                PayoffAmount = BetTable(BetNumber%, 3) * 1
                BankRoll = BankRoll + PayoffAmount + BetTable(BetNumber%, 3)
            ELSE
                IF RedBlack = 0 THEN
                    PayoffAmount = BetTable(BetNumber%, 3) * .5
                    BankRoll = BankRoll + PayoffAmount
                END IF
            END IF
            DisplayBetToScreen

        CASE 22
            BetAmount = BetTable(BetNumber%, 3)
            TypOut$ = "High/Low"
            IF BetTable(BetNumber%, 2) = 1 THEN
                NumOut$ = "Low"
            ELSE
                NumOut$ = "High"
            END IF
            IF HighLow = BetTable(BetNumber%, 2) THEN
                PayoffAmount = BetTable(BetNumber%, 3) * 1
                BankRoll = BankRoll + PayoffAmount + BetTable(BetNumber%, 3)
            ELSE
                IF HighLow = 0 THEN
                    PayoffAmount = BetTable(BetNumber%, 3) * .5
                    BankRoll = BankRoll + PayoffAmount
                END IF
            END IF
            DisplayBetToScreen

        CASE 23
            BetAmount = BetTable(BetNumber%, 3)
            TypOut$ = "Odd/Even"
            IF BetTable(BetNumber%, 2) = 1 THEN
                NumOut$ = "Odd"
            ELSE
                NumOut$ = "Even"
            END IF
            IF OddEven = BetTable(BetNumber%, 2) THEN
                PayoffAmount = BetTable(BetNumber%, 3) * 1
                BankRoll = BankRoll + PayoffAmount + BetTable(BetNumber%, 3)
            ELSE
                IF OddEven = 0 THEN
                    PayoffAmount = BetTable(BetNumber%, 3) * .5
                    LOCATE RowPointer%, 27
                    BankRoll = BankRoll + PayoffAmount
                END IF
            END IF
            DisplayBetToScreen

        CASE 24
            BetAmount = BetTable(BetNumber%, 3)
            TypOut$ = "Dozens"
            NumOut$ = "Dozen #" + LTRIM$(STR$(BetTable(BetNumber%, 2)))
            IF Dozen = BetTable(BetNumber%, 2) THEN
                PayoffAmount = BetTable(BetNumber%, 3) * 2
                BankRoll = BankRoll + PayoffAmount + BetTable(BetNumber%, 3)
            END IF
            DisplayBetToScreen

        CASE 25
            BetAmount = BetTable(BetNumber%, 3)
            TypOut$ = "Columns"
            NumOut$ = "Column #" + LTRIM$(STR$(BetTable(BetNumber%, 2)))
            IF Column = BetTable(BetNumber%, 2) THEN
                PayoffAmount = BetTable(BetNumber%, 3) * 2
                BankRoll = BankRoll + PayoffAmount + BetTable(BetNumber%, 3)
            END IF
            DisplayBetToScreen

    END SELECT


END SUB


SUB PayoffBets STATIC
' =========================== PayoffBets ===============================
' The PayoffBets subroutine loops through the BetTable array that holds
'     all the player's bets and determines whether to check the outside
'     and or inside bets and branches to the proper subroutine.
' ======================================================================
'

    DEFSNG A-Z
    DEFDBL A-Z

    BetNumber% = 1
    RowPointer% = 10

    Wipe 7, 24, 24, 80, BackGroundColor%

    COLOR HeadingColor%, BackGroundColor%

    LOCATE 8, 25: PRINT "BET    NUMBERS      BET TYPE     BET AMT      PAYOFF  "
    LOCATE 9, 25: PRINT "---  -----------  ------------  ----------  ----------"

    COLOR ForeGroundColor%, BackGroundColor%

    DO

        SELECT CASE BetTable(BetNumber%, 1)
            CASE 11 TO 19
                PayInsideBets
            CASE 21 TO 29
                PayOutsideBets
        END SELECT

        BetNumber% = BetNumber% + 1

    LOOP UNTIL BetNumber% > NumberOfBets


END SUB



'***
'*** END GET BETS ROUTINES
'****************************************************************************





SUB ReceiveBetType STATIC
' =========================== ReceiveBetType ===========================
' The ReceiveBetType subroutine displays all the bet types avialable
'     and asks the player for a response.
' ======================================================================
'

    DEFSNG A-Z
    DEFDBL A-Z

    Wipe 4, 24, 1, 80, BackGroundColor%

    LOCATE 6, 3: PRINT "TYPES OF BETS AVAILABLE:"
    LOCATE 8, 3: PRINT "**** SESSION MONEY ="; USING "$$,###,###.##"; BankRoll
    LOCATE 8, 43: PRINT "**** CURRENT TABLE BETS = "; USING "$$#,###.##"; Table
    LOCATE 11, 3: PRINT "   1) Inside Bets (Straight, Split, Streets, Corners)"
    LOCATE 12, 3: PRINT "   2) Outside Bets (Red/Black, Odd/Even, High/Low, Dozens, Columns)"
    LOCATE 13, 3: PRINT "   3) Load Bankroll From Disk"
    LOCATE 14, 3: PRINT "   4) Save Bankroll to Disk"
    LOCATE 16, 3: PRINT "   9) *** EXIT GAME ***"
    LOCATE 18, 3: PRINT "  [ENTER]  - No More Bets - Spin Ball"
    LOCATE 20, 3: INPUT "Choose Type of Bet"; BetType$


END SUB


SUB RecordBets STATIC
' =========================== RecordBets ===============================
' The RecordBets subroutine allows the player to input upto 100 bets
'     and edits them to make sure the player does not play more than
'     his/her bankroll.  A final screen is displayed to show all bets
'     made. *** Future enhancement will allow the player to change
'     their bets before commiting them. ***
' ======================================================================
'

    DEFSNG A-Z
    DEFDBL A-Z
    'BetNumber% = 1

    BetLoop$ = "Y"

    IF keepwagers$ = "Y" THEN
        BetNumber% = NumberOfBets
    ELSE
        BetNumber% = 1
    END IF

    DO

        ReceiveBetType

        SELECT CASE BetType$
            CASE "1"
                GetInsideBets
            CASE "2"
                GetOutsideBets
            CASE "3"
                LoadBankroll
            CASE "4"
                SaveBankroll
            CASE "9"
                BetLoop$ = "N"
            CASE ELSE
                BetLoop$ = "N"
                LOCATE 23, 30: PRINT "No More Bets Selected - Press [ENTER] for Spin"
                PAUSE
        END SELECT

    LOOP UNTIL (BetLoop$ = "N" OR BetNumber% > 100)

    NumberOfBets = BetNumber%

'  ReviewBets


END SUB


SUB SaveBankroll STATIC
' ============================ SaveBankroll ============================
' The SaveBankroll Subroutine will Save a player's current Bankroll to
'     disk using a supplied filename. It will save with the extention of
'     FileName$.BNK and will put it onto the current drive.
' ======================================================================
'
    DEFSNG A-Z
    DEFDBL A-Z
    NOERRORS = TRUE

    Wipe 4, 24, 1, 80, BackGroundColor%
    LOCATE 6, 3: PRINT "**** BANKROLL ="; BankRoll
    LOCATE 8, 3: INPUT "Enter File Name (Up to 8 characters):"; FileName$

    IF FileName$ = "" THEN
        EXIT SUB
    ELSE
        FileName$ = FileName$ + ".BNK"
        OPEN FileName$ FOR OUTPUT AS #1
        WRITE #1, BankRoll
        CLOSE #1
    END IF


END SUB


SUB SpinBall STATIC
' ============================ SpinBall ================================
' The SpinBall subroutine starts the ball spinning around the roulette
'     wheel, guides it path until it falls into a numbered slot.  This
'     number is then returned into the variable "Number" for processing.
' ======================================================================
'

    DEFSNG A-Z
    DEFDBL A-Z

    IF Bets = 0 THEN
        Bets = 1
    END IF

    RANDOMIZE TIMER

    SlotNumber% = INT(RND * 38) + 1
    Number = Wheel%(SlotNumber%)
    Pointer = (Number * 7) - 6

    Wipe 4, 24, 1, 80, BackGroundColor%

    y = Pointer + 6
    l = 8

    SELECT CASE Number
        CASE 37
            BColor% = GreenBack%
            MakeWindow windowTop!, windowLeft!, windowBottom!, windowRight!, FColor%, BColor%, WLBL$
            FOR x = Pointer TO y
                LOCATE l, 4: PRINT NumberDisplay$(x)
                l = l + 1
            NEXT x
        CASE 38
            BColor% = GreenBack%
            MakeWindow windowTop!, windowLeft!, windowBottom!, windowRight!, FColor%, BColor%, WLBL$
            FOR x = Pointer TO y
                LOCATE l, 4: PRINT NumberDisplay$(x)
                l = l + 1
            NEXT x
        CASE 1, 3, 5, 7, 9, 12, 14, 16, 18, 19, 21, 23, 25, 27, 30, 32, 34, 36
            BColor% = RedBack%
            MakeWindow windowTop!, windowLeft!, windowBottom!, windowRight!, FColor%, BColor%, WLBL$
            FOR x = Pointer TO y
                LOCATE l, 4: PRINT NumberDisplay$(x)
                l = l + 1
            NEXT x
        CASE ELSE
            BColor% = BlackBack%
            MakeWindow windowTop!, windowLeft!, windowBottom!, windowRight!, FColor%, BColor%, WLBL$
            FOR x = Pointer TO y
                LOCATE l, 4: PRINT NumberDisplay$(x)
                l = l + 1
            NEXT x
    END SELECT

    COLOR ForeGroundColor%, BackGroundColor%

END SUB


SUB Wipe (top%, bottom%, lft%, rght%, back%)
' ============================ SpinBall ================================
' The Wipe Subroutine clears off a selected portion of the screen. Note
'     that the area cleared is always inside the boc defined by the
'     parameters passed to it.  This is to prevent you from wiping out
'     a window or screen border.
' ======================================================================
'
'   The passed parameters are:
'
'     top%    - The top-most row to clear.  Allowable range is 1 to 25.
'     bottom% - The bottom-most row to clear.  Allowable range is 1 to
'               25.
'      lft%   - The left-most column to clear.  Allowable range is 1 to
'               80.
'      rght%  - The right-most column to clear.  Allowable range is 1 to
'               80.
'      back%  - The background color to clear with.  Allowable range is
'               0 to 7.
' ======================================================================
'

    DEFSNG A-Z

    COLOR , back%

    FOR x% = top% + 1 TO bottom% - 1
        LOCATE x%, lft% + 1, 0
        PRINT SPACE$(rght% - lft% - 1);
    NEXT x%

END SUB


SUB KeepPreviousBets STATIC
' ========================== PayInsideBets =============================
' The KeepPreviousBets subroutine validates the previous bets to the
'     bankroll, and if enough funds exists, keeps all the bets in the
'     BetTable and returns to allow more bets to be added or spin.
' ======================================================================
'

    DEFSNG A-Z
    DEFDBL A-Z

    PayoffAmount = 0
    BetTotal = 0
    TotalInsideBets = 0
    BetNumber% = 1
    RowPointer% = 10

    Wipe 7, 24, 24, 80, BackGroundColor%

    COLOR HeadingColor%, BackGroundColor%
    LOCATE 6, 25: PRINT "****   CURRENT BANKROLL: "; USING "$$,###,###.##"; BankRoll

    LOCATE 8, 25: PRINT "BET    NUMBERS      BET TYPE     BET AMT  "
    LOCATE 9, 25: PRINT "---  -----------  ------------  ----------"

    COLOR ForeGroundColor%, BackGroundColor%

    DO
        SELECT CASE BetTable(BetNumber%, 1)

               CASE 11 '*** Inside Bet - Single Number/Straight Up
                    BetAmount = BetTable(BetNumber%, 3)
                    TypOut$ = "Straight-Up"
                    SELECT CASE BetTable(BetNumber%, 2)
                           CASE 37
                                NumOut$ = "0"
                           CASE 38
                                NumOut$ = "00"
                           CASE ELSE
                                NumOut$ = LTRIM$(STR$(BetTable(BetNumber%, 2)))
                    END SELECT
                    DisplayPreviousBetToScreen
                    BetTotal = BetTotal + BetAmount
                    TotalInsideBets = TotalInsideBets + BetAmount

               CASE 12 '*** Inside Bet - Split
                    BetAmount = BetTable(BetNumber%, 4)
                    TypOut$ = "Split"
                    IF BetTable(BetNumber%, 2) = 37 OR BetTable(BetNumber%, 2) = 38 THEN
                        NumOut$ = "0-00"
                    ELSE
                        LineOut$ = LTRIM$(STR$(BetTable(BetNumber%, 2))) + "-"
                        NumOut$ = LineOut$ + LTRIM$(STR$(BetTable(BetNumber%, 3)))
                    END IF
                    DisplayPreviousBetToScreen
                    BetTotal = BetTotal + BetAmount
                    TotalInsideBets = TotalInsideBets + BetAmount

               CASE 13 '*** Bucket Bet (0-2-00 Only)
                    BetAmount = BetTable(BetNumber%, 5)
                    TypOut$ = "Bucket"
                    NumOut$ = "0-2-00"
                    DisplayPreviousBetToScreen
                    BetTotal = BetTotal + BetAmount
                    TotalInsideBets = TotalInsideBets + BetAmount

               CASE 14 '*** Street Bet (3 numbers same row)
                    BetAmount = BetTable(BetNumber%, 5)
                    TypOut$ = "Street"
                    NumOut$ = LTRIM$(STR$(BetTable(BetNumber%, 2))) + "-" + LTRIM$(STR$(BetTable(BetNumber%, 4)))
                    DisplayPreviousBetToScreen
                    BetTotal = BetTotal + BetAmount
                    TotalInsideBets = TotalInsideBets + BetAmount

               CASE 15 '*** Corner Bet
                    BetAmount = BetTable(BetNumber%, 6)
                    TypOut$ = "Corner"
                    LineOut$ = LTRIM$(STR$(BetTable(BetNumber%, 2))) + "-"
                    LineOut$ = LineOut$ + LTRIM$(STR$(BetTable(BetNumber%, 3))) + "-"
                    LineOut$ = LineOut$ + LTRIM$(STR$(BetTable(BetNumber%, 4))) + "-"
                    NumOut$ = LineOut$ + LTRIM$(STR$(BetTable(BetNumber%, 5)))
                    DisplayPreviousBetToScreen
                    BetTotal = BetTotal + BetAmount
                    TotalInsideBets = TotalInsideBets + BetAmount

               CASE 16 '*** Double Street Bet
                    BetAmount = BetTable(BetNumber%, 8)
                    TypOut$ = "DoubleStreet"
                    NumOut$ = LTRIM$(STR$(BetTable(BetNumber%, 2))) + "-" + LTRIM$(STR$(BetTable(BetNumber%, 7)))
                    DisplayPreviousBetToScreen
                    BetTotal = BetTotal + BetAmount
                    TotalInsideBets = TotalInsideBets + BetAmount

               CASE 17 '*** Five Line Bet (0-00-1-2-3 Only)
                    BetAmount = BetTable(BetNumber%, 7)
                    TypOut$ = "Five Line"
                    NumOut$ = "0-00-1-2-3"
                    DisplayPreviousBetToScreen
                    BetTotal = BetTotal + BetAmount
                    TotalInsideBets = TotalInsideBets + BetAmount

               CASE 21 '*** Red/Black Bet
                    BetAmount = BetTable(BetNumber%, 3)
                    TypOut$ = "Red/Black"
                    IF BetTable(BetNumber%, 2) = 1 THEN
                        NumOut$ = "Red"
                    ELSE
                        NumOut$ = "Black"
                    END IF
                    DisplayPreviousBetToScreen
                    BetTotal = BetTotal + BetAmount

               CASE 22 '*** High/Low Bet
                    BetAmount = BetTable(BetNumber%, 3)
                    TypOut$ = "High/Low"
                    IF BetTable(BetNumber%, 2) = 1 THEN
                        NumOut$ = "Low"
                    ELSE
                        NumOut$ = "High"
                    END IF
                    DisplayPreviousBetToScreen
                    BetTotal = BetTotal + BetAmount

               CASE 23 '*** Odd/Even Bet
                    BetAmount = BetTable(BetNumber%, 3)
                    TypOut$ = "Odd/Even"
                    IF BetTable(BetNumber%, 2) = 1 THEN
                        NumOut$ = "Odd"
                    ELSE
                        NumOut$ = "Even"
                    END IF
                    DisplayPreviousBetToScreen
                    BetTotal = BetTotal + BetAmount

               CASE 24 '*** Dozens Bet
                    BetAmount = BetTable(BetNumber%, 3)
                    TypOut$ = "Dozens"
                    NumOut$ = "Dozen #" + LTRIM$(STR$(BetTable(BetNumber%, 2)))
                    DisplayPreviousBetToScreen
                    BetTotal = BetTotal + BetAmount

               CASE 25 '*** Columns Bet
                    BetAmount = BetTable(BetNumber%, 3)
                    TypOut$ = "Columns"
                    NumOut$ = "Column #" + LTRIM$(STR$(BetTable(BetNumber%, 2)))
                    DisplayPreviousBetToScreen
                    BetTotal = BetTotal + BetAmount
        END SELECT

        BetNumber% = BetNumber% + 1

    LOOP UNTIL BetNumber% = NumberOfBets

'*** Verify TotalBets not greater than bankroll
    IF BetTotal > 0 AND BetTotal <= BankRoll THEN
        BankRoll = BankRoll - BetTotal
        Table = BetTotal
        BetAmount = BetTotal
    ELSE
        IF BetTotal > 0 THEN
            ERROR BankRollExceeded
            keepwagers$ = "N"
            FOR BetNumber% = 1 TO 100
                ClearBetTable
            NEXT BetNumber%
        Table = 0
        NumberOfBets = 0
        TotalInsideBets = 0
        END IF
        COLOR ForeGroundColor%, BackGroundColor%
        LOCATE 23, 50: PRINT "Press [ENTER] to continue"
        PAUSE
        EXIT SUB
    END IF

    COLOR HeadingColor%, BackGroundColor%
    RowPointer% = RowPointer% + 1
    LOCATE RowPointer%, 25: PRINT "**** REMAINING BANKROLL: "; USING "$$,###,###.##"; BankRoll

    COLOR ForeGroundColor%, BackGroundColor%
    RowPointer% = RowPointer% + 1
    LOCATE 23, 50: PRINT "Press [ENTER] to continue"

    PAUSE


END SUB


SUB DisplayPreviousBetToScreen STATIC
'========================== DisplayPreviousBetToScreen =========================
' The DisplayPreviousBetToScreen Subroutine displays the previous bet onto the
'     screen in a formatted manner, with dollar-signs and commas in the amount
'     fields.
'===============================================================================

    DEFSNG A-Z
    DEFDBL A-Z

    LOCATE RowPointer%, 24

    PRINT USING "###. "; BetNumber%;
    PRINT USING " \         \"; NumOut$;
    PRINT USING "  \          \  "; TypOut$;
    PRINT USING "$$#,###.##  "; BetAmount;

    RowPointer% = RowPointer% + 1
    IF RowPointer% = 23 THEN ClearPayoffArea


END SUB
