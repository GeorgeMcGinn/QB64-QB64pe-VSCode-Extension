FUNCTION pipecom& (cmd AS STRING, stdout AS STRING, stderr AS STRING)
    stdout = "": stderr = ""
    DECLARE CUSTOMTYPE LIBRARY
        FUNCTION popen%& (cmd AS STRING, readtype AS STRING)
        FUNCTION feof& (BYVAL stream AS _OFFSET)
        FUNCTION fgets$ (str AS STRING, BYVAL n AS LONG, BYVAL stream AS _OFFSET)
        FUNCTION pclose& (BYVAL stream AS _OFFSET)
    END DECLARE

    DECLARE LIBRARY
        FUNCTION WEXITSTATUS& (BYVAL stat_val AS LONG)
    END DECLARE

    DIM AS _OFFSET stream

    DIM buffer AS STRING * 4096
    IF _FILEEXISTS(".pipestderr") THEN
        KILL ".pipestderr"
    END IF
    SHELL _HIDE "mknod p .pipestderr"
    stream = popen(cmd + " 2>.pipestderr" + CHR$(0), "r")
    IF stream THEN
        WHILE feof(stream) = 0
            IF fgets(buffer, 4096, stream) <> "" AND feof(stream) = 0 THEN
                stdout = stdout + MID$(buffer, 1, INSTR(buffer, CHR$(0)) - 1)
            END IF
        WEND
        DIM AS LONG status, exit_code
        status = pclose(stream)
        exit_code = WEXITSTATUS(status)
        IF _FILEEXISTS(".pipestderr") THEN
            DIM AS INTEGER errfile
            errfile = FREEFILE
            OPEN ".pipestderr" FOR BINARY AS #errfile
            IF LOF(errfile) > 0 THEN
                stderr = SPACE$(LOF(errfile))
                GET #errfile, , stderr
            END IF
            CLOSE #errfile
            KILL ".pipestderr"
        END IF
        pipecom = exit_code
    ELSE
        pipecom = -1
    END IF
END FUNCTION

FUNCTION pipecom_lite$ (cmd AS STRING)
    DIM AS LONG a
    DIM AS STRING stdout, stderr
    a = pipecom(cmd, stdout, stderr)
    IF stderr <> "" THEN
        pipecom_lite = stderr
    ELSE
        pipecom_lite = stdout
    END IF
END FUNCTION