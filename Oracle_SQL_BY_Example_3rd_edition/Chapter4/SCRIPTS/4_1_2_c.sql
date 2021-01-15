spool  %ORA_OUT%\4_1_2_c.txt
REM ******************************************************************
REM  File:        4_1_2_c.sql
REM  Description: Determine the day of the week for December 31, 1899.
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

SELECT TO_CHAR(TO_DATE('31-DEC-1899 ', 'DD-MON-YYYY'), 'Day') AS "31-DEC-1899"
  FROM dual;

spool off


grant create any view to ej_cap_4;
