spool  %ORA_OUT%\8_2_2_b.txt
REM ******************************************************************
REM  File:        8_2_2_b.sql
REM  Description: Use the INTERSECT set operator to list student IDs for
REM               students who are enrolled.
REM
REM  Alumn:       Hernandez Mendez Oliver Manuel | 2CM4 | ej_cap_7
REM  Created:     December 05, 2020
REM  Modified:    -
REM  Version:     1.0
REM  Book:        Oracle SQL by Example, Third Edition By Alice Rischert
REM ******************************************************************

set linesize 130
set pagesize 90
set colsep ' || '

SELECT student_id
FROM enrollment
INTERSECT
SELECT student_id
FROM student;

spool off
