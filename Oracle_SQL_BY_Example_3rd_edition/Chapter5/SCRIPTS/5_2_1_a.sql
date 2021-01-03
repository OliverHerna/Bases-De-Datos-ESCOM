spool  %ORA_OUT%\5_2_1_a.txt
REM ******************************************************************
REM  File:        5_2_1_a.sql
REM  Description: Show a list of prerequisites and count how many times each
REM               appears in the COURSE table. Order the result by the
REM               PREREQUISITE column.
REM
REM  Alumn:       Hernandez Mendez Oliver Manuel | 2CM4
REM  Created:     December 02, 2020
REM  Modified:    -
REM  Version:     1.0
REM  Book:        Oracle SQL by Example, Third Edition By Alice Rischert
REM ******************************************************************

set linesize 130
set pagesize 90
set colsep ' || '

SELECT prerequisite, COUNT(*)
FROM COURSE
GROUP BY prerequisite
ORDER BY prerequisite;

spool off
