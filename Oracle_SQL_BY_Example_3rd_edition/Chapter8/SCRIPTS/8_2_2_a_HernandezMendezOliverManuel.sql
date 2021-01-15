spool  %ORA_OUT%\8_2_2_a.txt
REM ******************************************************************
REM  File:        8_2_2_a.sql
REM  Description: Use the INTERSECT set operator to list all zip codes that are
REM               in both the STUDENT and INSTRUCTOR tables.
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

select zip
FROM student
INTERSECT
select zip
FROM instructor;

spool off
