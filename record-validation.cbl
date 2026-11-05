
       IDENTIFICATION DIVISION.
       PROGRAM-ID. RECORD-VALIDATION.

       DATA DIVISION.
       WORKING-STORAGE SECTION.

       01 WS-RECORD PIC X(20).

       01 WS-ACCOUNT-ID PIC X(10).
       01 WS-AMOUNT PIC X(6).
       01 WS-TYPE PIC X(2).
       01 WS-STATUS PIC X(2).

       PROCEDURE DIVISION.

           DISPLAY "ENTER 20 CHARACTER RECORD:"
           ACCEPT WS-RECORD

           MOVE WS-RECORD(1:10)
               TO WS-ACCOUNT-ID

           MOVE WS-RECORD(11:6)
               TO WS-AMOUNT

           MOVE WS-RECORD(17:2)
               TO WS-TYPE

           MOVE WS-RECORD(19:2)
               TO WS-STATUS

           IF WS-AMOUNT IS NUMERIC

               DISPLAY "VALID RECORD"

               DISPLAY "ACCOUNT ID: "
                       WS-ACCOUNT-ID

               DISPLAY "AMOUNT: "
                       WS-AMOUNT

               DISPLAY "TYPE: "
                       WS-TYPE

               DISPLAY "STATUS: "
                       WS-STATUS

           ELSE

               DISPLAY "INVALID AMOUNT"

           END-IF

           STOP RUN.
