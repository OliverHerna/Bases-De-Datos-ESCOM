spool  %ORA_OUT%\6_1_1_b.txt
REM ******************************************************************
REM  File:        6_1_1_b.sql
REM  Description: Select the first and last names of all enrolled students and
REM               order by last name in ascending order.
REM
REM  Alumn:       Hernandez Mendez Oliver Manuel | 2CM4
REM  Created:     December 03, 2020
REM  Modified:    -
REM  Version:     1.0
REM  Book:        Oracle SQL by Example, Third Edition By Alice Rischert
REM ******************************************************************

set linesize 130
set pagesize 90
set colsep ' || '

SELECT s.first_name, s.last_name
FROM enrollment JOIN student s
USING (student_id)
ORDER BY s.last_name asc;

spool off
