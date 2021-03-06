      PROGRAM SEATING
      CHARACTER*10 LINE
      INTEGER I, J
      INTEGER PASSES, MAXSEAT, MINSEAT
      DIMENSION PASSES(1024)
      LOGICAL SEATS
      DIMENSION SEATS(1024)
      MAXSEAT = 0
      MINSEAT = 1024
      DO 10 I = 1, 1024
         SEATS(I) = .FALSE.
   10 CONTINUE 
      OPEN(UNIT=1, FILE='input.dat', ACTION='READ', STATUS='OLD')
   20    READ(UNIT=1, FMT=1000, END=50) LINE
         I = 1
         PASSES(I) = 0
         DO 30 J = 1, 7
            IF (LINE(J:J).EQ.'B') PASSES(I) = PASSES(I) + 2 ** (10 - J)
   30    CONTINUE
         DO 40 J = 7, 10
            IF (LINE(J:J).EQ.'R') PASSES(I) = PASSES(I) + 2 ** (10 - J)
   40    CONTINUE
         IF (PASSES(I).GT.MAXSEAT) MAXSEAT = PASSES(I)
         IF (PASSES(I).LT.MINSEAT) MINSEAT = PASSES(I)
         SEATS(PASSES(I)) = .TRUE.
         I = I + 1
         GOTO 20
   50 CONTINUE
      WRITE(*, 2000) MAXSEAT
      DO 60 I = MINSEAT, MAXSEAT
         IF (SEATS(I).EQ..FALSE.) GOTO 70
   60 CONTINUE
   70 WRITE(*, 3000) I
      STOP
 1000 FORMAT(A10)
 2000 FORMAT('HIGHEST SEAT ID: ', I8)
 3000 FORMAT('YOUR SEAT ID: ', I8)
      END
