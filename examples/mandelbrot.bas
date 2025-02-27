DEFSTR A-Z
DIM red(15) AS INTEGER, green(15) AS INTEGER, blue(15) AS INTEGER
DIM i AS INTEGER
SCREEN 12
FOR i = 0 TO 15: READ red(i): NEXT
FOR i = 0 TO 15: READ green(i): NEXT
FOR i = 0 TO 15: READ blue(i): NEXT
FOR i = 0 TO 15: PALETTE i, 65536 * blue(i) + 256& * green(i) + red(i): NEXT
DATA 0,63,63,63,63,63,31,0,0,31,31,31,47,63,63,63
DATA 0,0,15,31,47,63,63,63,63,31,15,0,0,0,0,0
DATA 0,0,0,0,0,0,0,0,31,63,63,63,63,63,42,21

DIM dmag AS INTEGER, dlogmag AS INTEGER
DIM a AS DOUBLE, b AS DOUBLE, mag AS DOUBLE
DIM dx AS INTEGER, dy AS INTEGER
DIM mx AS INTEGER, my AS INTEGER, mz AS INTEGER

dmag = 16
mag = 1

a = -.75
b = 0
DO
    DIM limitx AS DOUBLE, limit AS INTEGER
    DIM inc AS DOUBLE, left AS DOUBLE, top AS DOUBLE

    limitx = 1000 * (LOG(mag) + 1)
    IF limitx > 32767 THEN limitx = 32767
    limit = INT(limitx)
    inc = .004 / mag
    left = a - inc * 319
    top = b + inc * 239
    CLS

    DIM yy AS INTEGER, xx AS INTEGER
    DIM x AS DOUBLE, y AS DOUBLE, z AS INTEGER

    FOR yy = 0 TO 479
        y = top - inc * yy
        FOR xx = 0 TO 639
            x = left + inc * xx
            z = mandel(x, y, limit)
            IF z < limit THEN PSET (xx, yy), 1 + z MOD 15
            IF INKEY$ = CHR$(27) THEN SYSTEM
        NEXT
    NEXT
    mz = 0
    CALL readmouse(mx, my, mz)
    DO
        dx = 319 \ dmag
        dy = 239 \ dmag
        CALL readmouse(mx, my, mz)
        IF mz THEN EXIT DO
        CALL rectangle(mx - dx, my - dy, mx + dx, my + dy)
        DIM t AS DOUBLE
        t = TIMER
        WHILE t = TIMER
            key$ = INKEY$
            SELECT CASE key$
                CASE CHR$(27)
                    SYSTEM
                CASE CHR$(0) + CHR$(72)
                    dmag = dmag \ 2
                    IF dmag < 2 THEN dmag = 2
                CASE CHR$(0) + CHR$(80)
                    dmag = dmag * 2
                    IF dmag > 128 THEN dmag = 128
            END SELECT
        WEND
        CALL rectangle(mx - dx, my - dy, mx + dx, my + dy)
    LOOP
    a = a + inc * (mx - 319): b = b - inc * (my - 239)
    IF (mz = 1) THEN mag = dmag * mag ELSE mag = mag / dmag
    IF (mag < 1) THEN mag = 1
LOOP

FUNCTION mandel% (x AS DOUBLE, y AS DOUBLE, limit AS INTEGER)
    DIM a AS DOUBLE, b AS DOUBLE, t AS DOUBLE
    DIM n AS INTEGER
    n = 0: a = 0: b = 0
    DO
        t = a * a - b * b + x
        b = 2 * a * b + y: a = t
        n = n + 1
    LOOP UNTIL a * a + b * b > 4 OR n > limit
    mandel = n
END FUNCTION

SUB readmouse (x AS INTEGER, y AS INTEGER, z AS INTEGER)
    z = 0
    DO
        IF _MOUSEBUTTON(1) THEN z = z OR 1
        IF _MOUSEBUTTON(2) THEN z = z OR 2
        IF _MOUSEBUTTON(3) THEN z = z OR 4
    LOOP UNTIL _MOUSEINPUT = 0
    x = _MOUSEX
    y = _MOUSEY
END SUB

SUB rectangle (x1 AS INTEGER, y1 AS INTEGER, x2 AS INTEGER, y2 AS INTEGER)
    DIM i AS INTEGER, j AS INTEGER
    FOR i = x1 TO x2
        j = POINT(i, y1)
        PSET (i, y1), j XOR 15
        j = POINT(i, y2)
        PSET (i, y2), j XOR 15
    NEXT
    FOR i = y1 TO y2
        j = POINT(x1, i)
        PSET (x1, i), j XOR 15
        j = POINT(x2, i)
        PSET (x2, i), j XOR 15
    NEXT
END SUB
