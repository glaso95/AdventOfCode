      PROGRAM REPORT
      IMPLICIT NONE

      INTEGER EXPENS
      DIMENSION EXPENS(400)
      INTEGER I, J

      OPEN(1, FILE='input.dat', STATUS='OLD', ACTION='READ')
      DO 10 I = 1, 200
         READ(1, *) EXPENS(I)
   10 CONTINUE
C EXPONENTIAL TIME LOOP
      DO 30 I = 1, 200
         DO 20 J = 1, 200
            IF (EXPENS(I) + EXPENS(J).EQ.2020) GOTO 40
   20    CONTINUE
   30 CONTINUE
C FOUND THE TWO CORRECT INDICES
   40 CONTINUE
      WRITE (*, 1000) EXPENS(I), EXPENS(J), EXPENS(I) * EXPENS(J)
      STOP
 1000 FORMAT (I, ' * ', I, ' = ', I)
      END
