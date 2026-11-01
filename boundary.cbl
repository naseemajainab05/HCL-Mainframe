
       IDENTIFICATION DIVISION.
       PROGRAM-ID. WITHDRAWAL-TEST.
       
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 WITHDRAW-AMOUNT PIC 9(7).
       01 AMOUNT-INPUT PIC X(10).
       
       PROCEDURE DIVISION.
       
           DISPLAY "ENTER WITHDRAWAL AMOUNT:"
           ACCEPT AMOUNT-INPUT
       
           IF AMOUNT-INPUT IS NUMERIC
               MOVE AMOUNT-INPUT TO WITHDRAW-AMOUNT
       
               IF WITHDRAW-AMOUNT >= 100
                  AND WITHDRAW-AMOUNT <= 50000
                   DISPLAY "ACCEPTED"
               ELSE
                   DISPLAY "REJECTED"
               END-IF
           ELSE
               DISPLAY "INVALID INPUT"
           END-IF.
       
           STOP RUN.
       