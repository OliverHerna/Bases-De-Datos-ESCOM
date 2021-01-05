spool  %ORA_OUT%\8_1_1_e.txt
REM ******************************************************************
REM  File:        8_1_1_e.sql
REM  Description: What is wrong with the following set operation, and what do
REM               you have to change to make it work correctly?
REM               SELECT instructor_id, last_name
REM                FROM instructor
REM                UNION
REM               SELECT last_name, student_id
REM                FROM student
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
/*
The mistake is that the columns dont match and this is a rule tu use UNION
To fix this we can remove the columns instructor_id and student_id because
they dont exists in both tables, if we want to show two columns we can
choose a comun column like zip
*/

/*Sol 1*/
SELECT last_name
 FROM instructor
 UNION
SELECT last_name
 FROM student
WHERE last_name LIKE '%zr' ;


spool off
