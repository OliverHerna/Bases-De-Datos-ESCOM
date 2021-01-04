spool  %ORA_OUT%\6_1_3_a.txt
REM ******************************************************************
REM  File:        6_1_3_a.sql
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

SELECT s.student_id, i.instructor_id
FROM student s JOIN instructor i
USING(zip)
ORDER BY s.student_id, i.instructor_id;

spool off
