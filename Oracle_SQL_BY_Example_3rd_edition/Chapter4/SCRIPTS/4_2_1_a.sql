spool  %ORA_OUT%\4_2_1_a.txt
REM ******************************************************************
REM  File:        4_2_1_a.sql
REM  Description: Determine the number of days between February 13, 1964 and
REM               the last day of the same month and year.
REM
REM  Alumn:       Hernandez Mendez Oliver Manuel | 2CM4
REM  Created:     December 01, 2020
REM  Modified:    -
REM  Version:     1.0
REM  Book:        Oracle SQL by Example, Third Edition By Alice Rischert
REM ******************************************************************

set linesize 130
set pagesize 90
set colsep ' ||'
clear screen

ALTER SESSION SET NLS_DATE_LANGUAGE = 'ENGLISH';

SELECT TO_DATE('13-FEB-1964', 'DD-MON-YYYY') "Date",
       LAST_DAY(TO_DATE('13-FEB-1964', 'DD-MON-YYYY')) "Final",
       LAST_DAY(TO_DATE('13-FEB-1964', 'DD-MON-YYYY'))-TO_DATE('13-FEB-1964', 'DD-MON-YYYY')
       "Days between"
FROM dual;


spool off
