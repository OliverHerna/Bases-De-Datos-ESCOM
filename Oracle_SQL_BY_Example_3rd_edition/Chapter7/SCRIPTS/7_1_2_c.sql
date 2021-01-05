spool  %ORA_OUT%\7_1_2_c.txt
REM ******************************************************************
REM  File:        7_1_2_c.sql
REM  Description: Select the last name and first name of students not enrolled
REM               in any class.
REM
REM  Alumn:       Hernandez Mendez Oliver Manuel | 2CM4
REM  Created:     December 04, 2020
REM  Modified:    -
REM  Version:     1.0
REM  Book:        Oracle SQL by Example, Third Edition By Alice Rischert
REM ******************************************************************

set linesize 130
set pagesize 90
set colsep ' || '

SELECT last_name, first_name
FROM student
WHERE student_id NOT IN (
  SELECT student_id
  FROM enrollment
);

spool off
