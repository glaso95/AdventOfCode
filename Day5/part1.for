      PROGRAM SEATING
      CHARACTER*10 LINE
      INTEGER I, J
      INTEGER PASSES, MAXSEAT
      DIMENSION PASSES(1024)
      MAXSEAT = 0
      OPEN(UNIT=1, FILE='input.dat', ACTION='READ', STATUS='OLD')
   10    READ(UNIT=1, FMT=1000, END=40) LINE
         I = 1
         PASSES(I) = 0
         DO 20 J = 1, 7
            IF (LINE(J:J).EQ.'B') PASSES(I) = PASSES(I) + 2 ** (10 - J)
   20    CONTINUE
         DO 30 J = 7, 10
            IF (LINE(J:J).EQ.'R') PASSES(I) = PASSES(I) + 2 ** (10 - J)
   30    CONTINUE
         IF (PASSES(I).GT.MAXSEAT) MAXSEAT = PASSES(I)
         I = I + 1
         GOTO 10
   40 CONTINUE
      WRITE(*, 2000) MAXSEAT
      STOP
 1000 FORMAT(A10)
 2000 FORMAT('HIGHEST SEAT ID: ', I8)
      END
