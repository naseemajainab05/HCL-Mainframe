
       IDENTIFICATION DIVISION.
       PROGRAM-ID. ACCOUNT-TRANSFER.

       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 SOURCE-BALANCE      PIC 9(7) VALUE ZERO.
       01 DEST-BALANCE        PIC 9(7) VALUE ZERO.
       01 TRANSFER-AMOUNT     PIC 9(7) VALUE ZERO.
       01 NEW-SOURCE          PIC 9(7) VALUE ZERO.
       01 NEW-DEST            PIC 9(7) VALUE ZERO.

       PROCEDURE DIVISION.
           ACCEPT SOURCE-BALANCE
           ACCEPT DEST-BALANCE
           ACCEPT TRANSFER-AMOUNT

           IF TRANSFER-AMOUNT > 0
              AND TRANSFER-AMOUNT <= SOURCE-BALANCE
               COMPUTE NEW-SOURCE =
                   SOURCE-BALANCE - TRANSFER-AMOUNT
               COMPUTE NEW-DEST =
                   DEST-BALANCE + TRANSFER-AMOUNT

               IF NEW-DEST <= 9999999
                   DISPLAY "Source balance: " NEW-SOURCE
                   DISPLAY "Destination balance: " NEW-DEST
               ELSE
                   DISPLAY "Error: Destination overflow"
               END-IF
           ELSE
               DISPLAY "Error: Invalid transfer amount"
           END-IF

           STOP RUN.
