
       IDENTIFICATION DIVISION.
       PROGRAM-ID. EMPDB2.

       DATA DIVISION.
       WORKING-STORAGE SECTION.

       EXEC SQL INCLUDE SQLCA END-EXEC.

       EXEC SQL BEGIN DECLARE SECTION END-EXEC.

       01 WS-EMP-ID       PIC S9(9) COMP-5.

       01 WS-EMP-NAME.
          49 WS-NAME-LEN  PIC S9(4) COMP-5.
          49 WS-NAME-TEXT PIC X(30).

       01 WS-DEPT.
          49 WS-DEPT-LEN  PIC S9(4) COMP-5.
          49 WS-DEPT-TEXT PIC X(20).

       01 WS-SALARY       PIC S9(7)V99 COMP-3.

       01 WS-ANNUAL       PIC S9(9)V99 COMP-3.

       EXEC SQL END DECLARE SECTION END-EXEC.

       01 WS-EOF          PIC X VALUE 'N'.

       01 WS-DISPLAY-ID   PIC 9(9).

       01 WS-DISPLAY-SALARY
                          PIC ZZZ,ZZ9.99.

       01 WS-DISPLAY-ANNUAL
                          PIC Z,ZZZ,ZZ9.99.

       PROCEDURE DIVISION.

       MAIN-PARA.

           DISPLAY '=============================='
           DISPLAY ' EMPLOYEE MANAGEMENT SYSTEM '
           DISPLAY '=============================='

           EXEC SQL
              DECLARE EMP-CURSOR CURSOR FOR
              SELECT EMP_ID,
                     EMP_NAME,
                     DEPARTMENT,
                     SALARY
              FROM EMPLOYEE
              ORDER BY EMP_ID
           END-EXEC

           EXEC SQL
              OPEN EMP-CURSOR
           END-EXEC

           IF SQLCODE NOT = 0
              DISPLAY 'OPEN ERROR: ' SQLCODE
              STOP RUN
           END-IF

           PERFORM UNTIL WS-EOF = 'Y'

              EXEC SQL
                 FETCH EMP-CURSOR
                 INTO :WS-EMP-ID,
                      :WS-EMP-NAME,
                      :WS-DEPT,
                      :WS-SALARY
              END-EXEC

              EVALUATE SQLCODE

                 WHEN 0

                    COMPUTE WS-ANNUAL =
                       WS-SALARY * 12

                    MOVE WS-EMP-ID
                      TO WS-DISPLAY-ID

                    MOVE WS-SALARY
                      TO WS-DISPLAY-SALARY

                    MOVE WS-ANNUAL
                      TO WS-DISPLAY-ANNUAL

                    DISPLAY '------------------------------'
                    DISPLAY 'EMPLOYEE ID: ' WS-DISPLAY-ID
                    DISPLAY 'EMPLOYEE NAME: '
                       WS-NAME-TEXT(1:WS-NAME-LEN)
                    DISPLAY 'DEPARTMENT: '
                       WS-DEPT-TEXT(1:WS-DEPT-LEN)
                    DISPLAY 'MONTHLY SALARY: '
                       WS-DISPLAY-SALARY
                    DISPLAY 'ANNUAL SALARY: '
                       WS-DISPLAY-ANNUAL

                 WHEN 100

                    MOVE 'Y' TO WS-EOF
                    DISPLAY 'NO MORE EMPLOYEES'

                 WHEN OTHER

                    DISPLAY 'FETCH ERROR: ' SQLCODE
                    MOVE 'Y' TO WS-EOF

              END-EVALUATE

           END-PERFORM

           EXEC SQL
              CLOSE EMP-CURSOR
           END-EXEC

           IF SQLCODE NOT = 0
              DISPLAY 'CLOSE ERROR: ' SQLCODE
           END-IF

           DISPLAY '=============================='
           DISPLAY 'PROCESS COMPLETED'
           DISPLAY '=============================='

           STOP RUN.
