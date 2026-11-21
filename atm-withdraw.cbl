
       IDENTIFICATION DIVISION.
       PROGRAM-ID. ATM-WITHDRAWAL.
       
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       
       01 BALANCE-AMOUNT    PIC 9(7)V99.
       01 WITHDRAW-AMOUNT   PIC 9(7)V99.
       01 REMAINING-BALANCE PIC 9(7)V99.
       01 ACCOUNT-STATUS    PIC X.
       01 ATM-STATUS        PIC X.
       
       PROCEDURE DIVISION.
       
           DISPLAY "ENTER ACCOUNT BALANCE:"
           ACCEPT BALANCE-AMOUNT
       
           DISPLAY "ENTER WITHDRAWAL AMOUNT:"
           ACCEPT WITHDRAW-AMOUNT
       
           DISPLAY "ENTER ACCOUNT STATUS (A/I):"
           ACCEPT ACCOUNT-STATUS
       
           DISPLAY "ENTER ATM STATUS (Y/N):"
           ACCEPT ATM-STATUS
       
           IF ACCOUNT-STATUS NOT = "A"
               DISPLAY "ERR_ACCOUNT"
       
           ELSE
               IF ATM-STATUS NOT = "Y"
                   DISPLAY "ERR_ATM"
       
               ELSE
                   IF WITHDRAW-AMOUNT <= 0
                       DISPLAY "ERR_AMOUNT"
       
                   ELSE
                       IF WITHDRAW-AMOUNT > BALANCE-AMOUNT
                           DISPLAY "ERR_BALANCE"
       
                       ELSE
                           COMPUTE REMAINING-BALANCE =
                               BALANCE-AMOUNT - WITHDRAW-AMOUNT
       
                           DISPLAY "SUCCESS"
                           DISPLAY "REMAINING BALANCE: "
                               REMAINING-BALANCE
                       END-IF
                   END-IF
               END-IF
           END-IF.
       
           STOP RUN.
       