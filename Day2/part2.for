      PROGRAM PASSWD
      INTEGER I, J
      INTEGER FIRST, SECOND, TOTAL
      CHARACTER C
      LOGICAL L, VALID
      CHARACTER*80 LINE, RANG, PW
      TOTAL = 0
      OPEN(UNIT=1, FILE='input.dat', ACTION='READ', STATUS='OLD')
   10    READ(UNIT=1, FMT=1000, END=50) LINE
         I = INDEX(LINE, ' ')
         J = INDEX(LINE, ':')
         C = LINE(I+1:J-1)
         RANG = LINE(1:I-1)
         PW = LINE(J+2:LEN(LINE))
         CALL SPLIT(RANG, FIRST, SECOND)
         L = VALID(PW, C, FIRST, SECOND)
         IF (L.EQ..TRUE.) TOTAL = TOTAL + 1
      GOTO 10
C JUMP HERE AT EOF
   50 CONTINUE
      WRITE(*,2000) TOTAL
      STOP
 1000 FORMAT(A)
 2000 FORMAT('TOTAL VALID PASSWORDS: ', I)
      END
C CHECK IF PASSWORD IS VALID
      LOGICAL FUNCTION VALID(PASSWD, C, FIRST, SECOND)
      CHARACTER*(*) PASSWD
      CHARACTER C
      INTEGER FIRST, SECOND
      LOGICAL L, M, N
      L = .FALSE.
      M = PASSWD(FIRST:FIRST).EQ.C
      N = PASSWD(SECOND:SECOND).EQ.C
      IF (M.EQ..TRUE.) L = .TRUE.
      IF (N.EQ..TRUE.) L = .TRUE.
      IF (M.EQ..TRUE..AND.N.EQ..TRUE.) L = .FALSE.
      VALID = L
      RETURN
      END
C SPLIT THE STRING TO GET LIMITS
      SUBROUTINE SPLIT(RANG, FIRST, SECOND)
      CHARACTER*(*) RANG
      INTEGER FIRST, SECOND
      INTEGER I, N
C SPLIT STRING ON -
      I = INDEX(RANG, '-')
      N = LEN(RANG)
      READ(RANG(1:I - 1), 1000) FIRST
      READ(RANG(I + 1:N), 1000) SECOND
      RETURN
 1000 FORMAT(I)
      END
