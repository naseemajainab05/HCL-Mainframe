
identification division.
program-id. INTEREST.

environment division.

data division.
working-storage section.

01 N                   pic 9(6).
01 I                   pic 9(6).
01 INPUT-LINE          pic x(80).
01 ACCOUNT-ID          pic x(20).
01 BALANCE-AMT         pic 9(12)v99.
01 ANNUAL-RATE         pic 99v99.
01 DAILY-INTEREST      pic 9(12)v99.
01 TOTAL-INTEREST      pic 9(14)v99.

procedure division.
    accept N
    move 0 to TOTAL-INTEREST

    perform varying I from 1 by 1
        until I > N

        accept INPUT-LINE

        unstring function trim(INPUT-LINE)
            delimited by all spaces
            into ACCOUNT-ID BALANCE-AMT ANNUAL-RATE
        end-unstring

        compute DAILY-INTEREST rounded =
            BALANCE-AMT * ANNUAL-RATE / 100 / 365

        add DAILY-INTEREST to TOTAL-INTEREST

        display function trim(ACCOUNT-ID)
            " " DAILY-INTEREST

    end-perform

    display "Total: " TOTAL-INTEREST

    stop run.
