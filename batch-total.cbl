
       IDENTIFICATION DIVISION.
       PROGRAM-ID. BATCH-TOTAL.
       
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       
       01 N              PIC 9(3).
       01 I              PIC 9(3).
       01 AMOUNT         PIC 9(6).
       01 TOTAL-AMOUNT   PIC 9(6) VALUE 0.
       01 TEMP-TOTAL     PIC 9(7).
       01 OVERFLOW-FLAG  PIC X VALUE 'N'.
       
       PROCEDURE DIVISION.
       
           DISPLAY "ENTER NUMBER OF TRANSACTIONS:"
           ACCEPT N
       
           PERFORM VARYING I FROM 1 BY 1
               UNTIL I > N OR OVERFLOW-FLAG = 'Y'
       
               DISPLAY "ENTER TRANSACTION AMOUNT:"
               ACCEPT AMOUNT
       
               COMPUTE TEMP-TOTAL =
                   TOTAL-AMOUNT + AMOUNT
       
               IF TEMP-TOTAL > 999999
                   MOVE 'Y' TO OVERFLOW-FLAG
               ELSE
                   MOVE TEMP-TOTAL TO TOTAL-AMOUNT
               END-IF
       
           END-PERFORM
       
           IF OVERFLOW-FLAG = 'Y'
               DISPLAY "TOTAL OVERFLOW"
           ELSE
               DISPLAY "TOTAL: " TOTAL-AMOUNT
           END-IF
       
           STOP RUN.
       