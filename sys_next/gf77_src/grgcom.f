C*GRGCOM -- read with prompt from user's terminal (NeXT version)
C+
      INTEGER FUNCTION GRGCOM(STRING, PROMPT, L)
      CHARACTER*(*) STRING, PROMPT
      INTEGER L
C
C Issue prompt and read a line from the user's terminal; in VMS,
C this is equivalent to LIB$GET_COMMAND.
C
C Arguments:
C  STRING : (output) receives the string read from the terminal.
C  PROMPT : (input) prompt string.
C  L      : (output) length of STRING.
C
C Returns:
C  GRGCOM : 1 if successful, 0 if an error occurs (e.g., end of file).
C--
C 1991-Jul-02 - From SUN version [AFT]
C-----------------------------------------------------------------------
      INTEGER IER
C
      GRGCOM = 0
      L = 0
      IER = 0
C      WRITE (*, '(A,$)', IOSTAT=IER) PROMPT
      WRITE (*, 121, IOSTAT=IER) PROMPT
  121 FORMAT('$',A)
      IF (IER.EQ.0) READ (*, '(A)', IOSTAT=IER) STRING
      IF (IER.EQ.0) GRGCOM = 1
      L = LEN(STRING)
   10 IF (STRING(L:L).NE.' ') GOTO 20
          L = L-1
          GOTO 10
   20 CONTINUE
      END
