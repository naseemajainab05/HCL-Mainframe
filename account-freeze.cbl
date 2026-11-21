
       IDENTIFICATION DIVISION.
       PROGRAM-ID. ACCOUNT-FREEZE.
      
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       
       01 ACCOUNT-STATUS PIC X.
       01 KYC-FLAG       PIC X.
       01 FRAUD-HOLD     PIC X.
       
       PROCEDURE DIVISION.
       
           DISPLAY "ENTER ACCOUNT STATUS (A/I):"
           ACCEPT ACCOUNT-STATUS
       
           DISPLAY "ENTER KYC FLAG (Y/N):"
           ACCEPT KYC-FLAG
       
           DISPLAY "ENTER FRAUD HOLD (Y/N):"
           ACCEPT FRAUD-HOLD
       
           IF ACCOUNT-STATUS = "A"
              AND KYC-FLAG = "Y"
              AND FRAUD-HOLD = "N"
       
               DISPLAY "ALLOW"
       
           ELSE
               DISPLAY "BLOCK"
       
           END-IF.
       
           STOP RUN.
       