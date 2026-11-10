
       IDENTIFICATION DIVISION.
       PROGRAM-ID. DATE-VALIDATION.

       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 DATE-INPUT          PIC X(20).
       01 DATE-LENGTH         PIC 99.
       01 YEAR-NUM            PIC 9(4).
       01 MONTH-NUM           PIC 99.
       01 DAY-NUM             PIC 99.
       01 MAX-DAY             PIC 99.
       01 REMAINDER-NUM       PIC 999.
       01 LEAP-YEAR-FLAG      PIC X VALUE 'N'.
       01 VALID-FLAG          PIC X VALUE 'N'.

       PROCEDURE DIVISION.
       MAIN-PARA.
           DISPLAY "ENTER DATE (YYYYMMDD): "
           ACCEPT DATE-INPUT

           COMPUTE DATE-LENGTH =
               FUNCTION LENGTH(FUNCTION TRIM(DATE-INPUT))

           IF DATE-LENGTH = 8
               IF DATE-INPUT(1:8) IS NUMERIC
                   MOVE DATE-INPUT(1:4) TO YEAR-NUM
                   MOVE DATE-INPUT(5:2) TO MONTH-NUM
                   MOVE DATE-INPUT(7:2) TO DAY-NUM
                   PERFORM VALIDATE-DATE
               END-IF
           END-IF

           IF VALID-FLAG = 'Y'
               DISPLAY "VALID DATE"
           ELSE
               DISPLAY "INVALID DATE"
           END-IF

           STOP RUN.

       VALIDATE-DATE.
           IF YEAR-NUM = 0
               EXIT PARAGRAPH
           END-IF

           IF MONTH-NUM < 1 OR MONTH-NUM > 12
               EXIT PARAGRAPH
           END-IF

           IF DAY-NUM < 1
               EXIT PARAGRAPH
           END-IF

           MOVE 'N' TO LEAP-YEAR-FLAG

           COMPUTE REMAINDER-NUM =
               FUNCTION MOD(YEAR-NUM, 400)

           IF REMAINDER-NUM = 0
               MOVE 'Y' TO LEAP-YEAR-FLAG
           ELSE
               COMPUTE REMAINDER-NUM =
                   FUNCTION MOD(YEAR-NUM, 100)

               IF REMAINDER-NUM = 0
                   MOVE 'N' TO LEAP-YEAR-FLAG
               ELSE
                   COMPUTE REMAINDER-NUM =
                       FUNCTION MOD(YEAR-NUM, 4)

                   IF REMAINDER-NUM = 0
                       MOVE 'Y' TO LEAP-YEAR-FLAG
                   END-IF
               END-IF
           END-IF

           EVALUATE MONTH-NUM
               WHEN 1
               WHEN 3
               WHEN 5
               WHEN 7
               WHEN 8
               WHEN 10
               WHEN 12
                   MOVE 31 TO MAX-DAY

               WHEN 4
               WHEN 6
               WHEN 9
               WHEN 11
                   MOVE 30 TO MAX-DAY

               WHEN 2
                   IF LEAP-YEAR-FLAG = 'Y'
                       MOVE 29 TO MAX-DAY
                   ELSE
                       MOVE 28 TO MAX-DAY
                   END-IF
           END-EVALUATE

           IF DAY-NUM <= MAX-DAY
               MOVE 'Y' TO VALID-FLAG
           END-IF.
