
       IDENTIFICATION DIVISION.
       PROGRAM-ID. BATCH-TOTAL.

       DATA DIVISION.
       WORKING-STORAGE SECTION.

       01 WS-N PIC 99.
       01 WS-I PIC 99.
       01 WS-RC PIC 99.

       01 WS-SUCCESS PIC 99 VALUE 0.
       01 WS-WARNING PIC 99 VALUE 0.
       01 WS-FAILURE PIC 99 VALUE 0.

       PROCEDURE DIVISION.

           DISPLAY "ENTER NUMBER OF STEPS:"
           ACCEPT WS-N

           PERFORM VARYING WS-I FROM 1 BY 1
               UNTIL WS-I > WS-N

               DISPLAY "ENTER RETURN CODE:"
               ACCEPT WS-RC

               EVALUATE WS-RC
                   WHEN 0
                       DISPLAY "SUCCESS"
                       ADD 1 TO WS-SUCCESS

                   WHEN 4
                       DISPLAY "WARNING"
                       ADD 1 TO WS-WARNING

                   WHEN OTHER
                       DISPLAY "FAILURE"
                       ADD 1 TO WS-FAILURE
               END-EVALUATE

           END-PERFORM

           DISPLAY "SUCCESS COUNT: " WS-SUCCESS
           DISPLAY "WARNING COUNT: " WS-WARNING
           DISPLAY "FAILURE COUNT: " WS-FAILURE

           STOP RUN.
