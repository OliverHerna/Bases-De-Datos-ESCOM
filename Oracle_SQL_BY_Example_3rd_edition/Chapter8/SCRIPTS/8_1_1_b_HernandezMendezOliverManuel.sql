spool  %ORA_OUT%\8_1_1_b.txt
REM ******************************************************************
REM  File:        8_1_1_b.sql
REM  Description:Write a set operation, using the UNION set operator,
REM              to list all the zip codes in the INSTRUCTOR and STUDENT tables
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

SELECT zip, last_name
FROM student
UNION
SELECT zip, last_name
FROM instructor
ORDER BY 2;

spool off
