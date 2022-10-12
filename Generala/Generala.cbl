IDENTIFICATION DIVISION.
PROGRAM-ID. GENERALA.

DATA DIVISION.
       WORKING-STORAGE SECTION.
       *> cada dado puede tener un valor de 1 - 6
           01 DICES.
               05 DICE-1 PIC 9 VALUE 1.
               05 DICE-2 PIC 9 VALUE 1.
               05 DICE-3 PIC 9 VALUE 1.
               05 DICE-4 PIC 9 VALUE 1.
               05 DICE-5 PIC 9 VALUE 1.
           
           01 REPETITION PIC 9.

PROCEDURE DIVISION.
       ws
       PERFORM UNTIL COUNT = 10
           DISPLAY "holiwis".
       END-PERFORM.

STOP RUN.
