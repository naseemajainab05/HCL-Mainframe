       IDENTIFICATION DIVISION.
       PROGRAM-ID. BATCH-STEP-DEPENDENCY.

       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 VALIDATE-RC PIC 99.
       01 POST-RC PIC 99.
       01 REPORT-RC PIC 99.

       PROCEDURE DIVISION.
           DISPLAY "ENTER VALIDATE RETURN CODE:"
           ACCEPT VALIDATE-RC

           IF VALIDATE-RC = 0 OR VALIDATE-RC = 4
               DISPLAY "VALIDATION COMPLETED"

               DISPLAY "ENTER POST RETURN CODE:"
               ACCEPT POST-RC

               IF POST-RC = 0 OR POST-RC = 4
                   DISPLAY "POST COMPLETED"

                   DISPLAY "ENTER REPORT RETURN CODE:"
                   ACCEPT REPORT-RC

                   IF REPORT-RC = 0
                       DISPLAY "REPORT COMPLETED"
                   ELSE
                       DISPLAY "REPORT FAILED"
                   END-IF
               ELSE
                   DISPLAY "POST FAILED"
                   DISPLAY "REPORT NOT EXECUTED"
               END-IF

           ELSE
               DISPLAY "VALIDATION FAILED"
               DISPLAY "POST NOT EXECUTED"
               DISPLAY "REPORT NOT EXECUTED"
           END-IF

           STOP RUN.