       IDENTIFICATION DIVISION.
       PROGRAM-ID. TRANSACTION-TESTING.

       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 TEST-NO PIC 9.
       01 TRANS-TYPE PIC X.
       01 AMOUNT PIC 9(5).
       01 ACCOUNT-STATUS PIC X.
       01 ACTUAL-RESULT PIC X(8).
       01 EXPECTED-RESULT PIC X(8).

       PROCEDURE DIVISION.
           PERFORM VARYING TEST-NO FROM 1 BY 1
               UNTIL TEST-NO > 3

               DISPLAY "ENTER TRANSACTION TYPE:"
               ACCEPT TRANS-TYPE

               DISPLAY "ENTER AMOUNT:"
               ACCEPT AMOUNT

               DISPLAY "ENTER ACCOUNT STATUS:"
               ACCEPT ACCOUNT-STATUS

               DISPLAY "ENTER EXPECTED RESULT:"
               ACCEPT EXPECTED-RESULT

               IF (TRANS-TYPE = "D" OR
                   TRANS-TYPE = "C")
                   AND AMOUNT > 0
                   AND ACCOUNT-STATUS = "A"

                   MOVE "ACCEPTED" TO ACTUAL-RESULT
               ELSE
                   MOVE "REJECTED" TO ACTUAL-RESULT
               END-IF

               IF ACTUAL-RESULT = EXPECTED-RESULT
                   DISPLAY "PASS"
               ELSE
                   DISPLAY "FAIL"
               END-IF

           END-PERFORM

           STOP RUN.