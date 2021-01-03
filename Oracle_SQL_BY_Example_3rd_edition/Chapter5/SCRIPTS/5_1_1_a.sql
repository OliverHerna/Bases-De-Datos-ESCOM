spool  %ORA_OUT%\5_1_1_a.txt
REM ******************************************************************
REM  File:        5_1_1_a.sql
REM  Description: Write a SELECT statement to determine how many courses do
REM               not have a prerequisite.
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


SELECT COUNT(*) "COURSES WITHOUT PREREQUISITE"
FROM COURSE
WHERE PREREQUISITE IS null;

spool off
