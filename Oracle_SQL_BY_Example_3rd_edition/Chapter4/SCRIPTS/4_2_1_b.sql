spool  %ORA_OUT%\4_2_1_b.txt
REM ******************************************************************
REM  File:        4_2_1_b.sql
REM  Description: Compute the number of months between September 29, 1999 and
REM               August 17, 2003.
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

SELECT ROUND(MONTHS_BETWEEN(
  TO_DATE('17-AUG-2003', 'DD-MON-YYYY'),
  TO_DATE('29-SEP-1999', 'DD-MON-YYYY')
)) AS "MONTHS BETWEEN"
FROM dual;


spool off
