IDENTIFICATION DIVISION.
PROGRAM-ID. CAESAR-ENCRYPTION.
        
ENVIRONMENT DIVISION.

DATA DIVISION.        
    WORKING-STORAGE SECTION.
    01 WS-INPUT     PIC X(99) VALUE SPACE.
    01 WS-ENCRYPTED PIC X(99) VALUE 0.
    01 WS-NUMSHIFT  PIC 9(2)  VALUE 0.
	01 WS-I         PIC 9(3)  VALUE 0.
	01 WS-C         PIC x(1)  VALUE ' '.	

PROCEDURE DIVISION.
       MAIN-PARA.
           PERFORM INPUT-PARA.
           STOP RUN.
       
       INPUT-PARA.
           DISPLAY "Enter a string: "   NO ADVANCING.
           ACCEPT WS-INPUT.
           DISPLAY "Enter an integer: " NO ADVANCING.
	       ACCEPT WS-NUMSHIFT.
           MOVE FUNCTION UPPER-CASE(WS-INPUT) TO WS-INPUT.                                 *> Lo hace mayuscula
           IF WS-NUMSHIFT >= 26 MOVE FUNCTION MOD(WS-NUMSHIFT, 26) TO WS-NUMSHIFT END-IF.  *> Si esta fuera de rango (26) lo reduce utilizando la funcion mod (modulo %) con dividendo 26

       ENCRYPT-PARA.
	         PERFORM VARYING WS-I FROM 1 BY 1 UNTIL WS-I > FUNCTION LENGTH(WS-INPUT)
	             IF WS-INPUT(WS-I:1) IS NOT EQUAL TO SPACE
	      	       MOVE WS-INPUT (WS-I:1) TO WS-C
	      	       IF (FUNCTION ORD(WS-C) + WS-NUMSHIFT) <= FUNCTION ORD("Z")
	      	     	   MOVE FUNCTION CHAR(FUNCTION ORD(WS-C) + WS-NUMSHIFT) TO WS-INPUT (WS-I:1)
	      	       ELSE
	      	     	   MOVE FUNCTION CHAR(FUNCTION ORD("A") + ((FUNCTION ORD(WS-C) + WS-NUMSHIFT) - 1) - FUNCTION ORD("Z")) TO WS-INPUT (WS-I:1)
	      	       END-IF
	      	   END-IF
	         END-PERFORM
	         DISPLAY WS-INPUT
       
       DISPLAY-PARA.
           DISPLAY WS-INPUT ' -> ' WS-ENCRYPTED.
			
	caesar-encrypt.
	
