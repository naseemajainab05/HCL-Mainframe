
       IDENTIFICATION DIVISION.
       PROGRAM-ID. LOAN-CALC.

       DATA DIVISION.
       WORKING-STORAGE SECTION.

       01 WS-PRINCIPAL PIC 9(7)V99.
       01 WS-BALANCE PIC 9(7)V99.
       01 WS-RATE PIC 99V99.
       01 WS-TERM PIC 999.
       01 WS-PAYMENT PIC 9(7)V99.
       01 WS-INTEREST PIC 9(7)V99.
       01 WS-AMOUNT-DUE PIC 9(7)V99.
       01 WS-MONTH PIC 999.
       01 WS-ACTUAL-PAY PIC 9(7)V99.

       01 WS-BAL-OUT PIC Z(6)9.99.
       01 WS-INT-OUT PIC Z(6)9.99.

       PROCEDURE DIVISION.

           DISPLAY "ENTER PRINCIPAL:"
           ACCEPT WS-PRINCIPAL

           DISPLAY "ENTER MONTHLY INTEREST RATE:"
           ACCEPT WS-RATE

           DISPLAY "ENTER LOAN TERM IN MONTHS:"
           ACCEPT WS-TERM

           DISPLAY "ENTER MONTHLY PAYMENT:"
           ACCEPT WS-PAYMENT

           MOVE WS-PRINCIPAL TO WS-BALANCE

           PERFORM UNTIL WS-MONTH >= WS-TERM
               OR WS-BALANCE = 0

               COMPUTE WS-INTEREST ROUNDED =
                   WS-BALANCE * WS-RATE / 100

               IF WS-PAYMENT <= WS-INTEREST
                   DISPLAY "PAYMENT TOO LOW"
                   STOP RUN
               END-IF

               COMPUTE WS-AMOUNT-DUE =
                   WS-BALANCE + WS-INTEREST

               IF WS-PAYMENT >= WS-AMOUNT-DUE
                   MOVE WS-AMOUNT-DUE TO WS-ACTUAL-PAY
                   MOVE 0 TO WS-BALANCE
               ELSE
                   MOVE WS-PAYMENT TO WS-ACTUAL-PAY
                   COMPUTE WS-BALANCE =
                       WS-AMOUNT-DUE - WS-PAYMENT
               END-IF

               ADD 1 TO WS-MONTH

               MOVE WS-BALANCE TO WS-BAL-OUT
               MOVE WS-INTEREST TO WS-INT-OUT

               DISPLAY "MONTH: " WS-MONTH
               DISPLAY "INTEREST: " WS-INT-OUT
               DISPLAY "PAYMENT: " WS-ACTUAL-PAY
               DISPLAY "BALANCE: " WS-BAL-OUT

           END-PERFORM

           IF WS-BALANCE = 0
               DISPLAY "LOAN COMPLETED"
           ELSE
               DISPLAY "LOAN NOT COMPLETED"
           END-IF

           STOP RUN.
