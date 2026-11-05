       IDENTIFICATION DIVISION.
       PROGRAM-ID. TRANSACTION-MUTATION-TEST.

       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 TRANS-TYPE PIC X.
       01 AMOUNT PIC 9(6).
       01 BALANCE PIC 9(6).

       PROCEDURE DIVISION.
           DISPLAY "ENTER TRANSACTION TYPE (C/D):"
           ACCEPT TRANS-TYPE

           DISPLAY "ENTER AMOUNT:"
           ACCEPT AMOUNT

           DISPLAY "ENTER BALANCE:"
           ACCEPT BALANCE

           EVALUATE TRANS-TYPE
               WHEN "C"
                   ADD AMOUNT TO BALANCE
                   DISPLAY "CREDIT SUCCESS"

               WHEN "D"
                   IF AMOUNT <= BALANCE
                       SUBTRACT AMOUNT FROM BALANCE
                       DISPLAY "DEBIT SUCCESS"
                   ELSE
                       DISPLAY "INSUFFICIENT BALANCE"
                   END-IF

               WHEN OTHER
                   DISPLAY "INVALID TRANSACTION TYPE"
           END-EVALUATE

           DISPLAY "FINAL BALANCE: " BALANCE

           STOP RUN.