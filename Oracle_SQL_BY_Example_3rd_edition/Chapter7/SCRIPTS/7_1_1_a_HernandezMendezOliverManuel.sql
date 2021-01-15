spool  %ORA_OUT%\7_1_1_a.txt
REM ******************************************************************
REM  File:        7_1_1_c.sql
REM  Description: Write a SQL statement that displays the first and last names
REM               of students who registered first.
REM
REM  Alumn:       Hernandez Mendez Oliver Manuel | 2CM4 | ej_cap_7
REM  Created:     December 04, 2020
REM  Modified:    -
REM  Version:     1.0
REM  Book:        Oracle SQL by Example, Third Edition By Alice Rischert
REM ******************************************************************

set linesize 130
set pagesize 90
set colsep ' || '


SELECT first_name, last_name
  FROM student
  WHERE registration_date =
    (SELECT MIN(registration_date)
      FROM student);

spool off
