
       IDENTIFICATION DIVISION.
       PROGRAM-ID. BATCH-COUNT.

       DATA DIVISION.
       WORKING-STORAGE SECTION.

       01 WS-EXPECTED PIC 999.
       01 WS-ACTUAL PIC 999.
       01 WS-DIFFERENCE PIC 999.

       PROCEDURE DIVISION.

           DISPLAY "ENTER EXPECTED COUNT:"
           ACCEPT WS-EXPECTED

           DISPLAY "ENTER ACTUAL COUNT:"
           ACCEPT WS-ACTUAL

           IF WS-EXPECTED = WS-ACTUAL

               DISPLAY "MATCH"

           ELSE

               DISPLAY "MISMATCH"

               IF WS-EXPECTED > WS-ACTUAL
                   COMPUTE WS-DIFFERENCE =
                       WS-EXPECTED - WS-ACTUAL
               ELSE
                   COMPUTE WS-DIFFERENCE =
                       WS-ACTUAL - WS-EXPECTED
               END-IF

               DISPLAY "DIFFERENCE: "
                       WS-DIFFERENCE

           END-IF

           STOP RUN.
