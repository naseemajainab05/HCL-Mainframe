       
       
       IDENTIFICATION DIVISION.
       PROGRAM-ID. TRANSACTION-VALIDATION.
       
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       
       01 TRANSACTION-TYPE PIC X.
       01 AMOUNT-INPUT     PIC X(15).
       01 AMOUNT-VALUE    PIC 9(9)V99.
       
       PROCEDURE DIVISION.
       
           DISPLAY "ENTER TRANSACTION TYPE (C/D):"
           ACCEPT TRANSACTION-TYPE
       
           DISPLAY "ENTER AMOUNT:"
           ACCEPT AMOUNT-INPUT
       
           IF TRANSACTION-TYPE NOT = "C"
              AND TRANSACTION-TYPE NOT = "D"
       
               DISPLAY "ERR_TYPE"
       
           ELSE
               IF FUNCTION TEST-NUMVAL(AMOUNT-INPUT) NOT = 0
       
                   DISPLAY "ERR_AMOUNT"
       
               ELSE
                   COMPUTE AMOUNT-VALUE =
                       FUNCTION NUMVAL(AMOUNT-INPUT)
       
                   IF AMOUNT-VALUE <= 0
                       DISPLAY "ERR_VALUE"
                   ELSE
                       DISPLAY "ACCEPTED"
                   END-IF
               END-IF
           END-IF.
       
           STOP RUN.
       