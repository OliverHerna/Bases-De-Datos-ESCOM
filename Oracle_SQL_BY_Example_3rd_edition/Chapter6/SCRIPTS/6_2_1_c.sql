spool  %ORA_OUT%\6_2_1_c.txt
REM ******************************************************************
REM  File:        6_2_1_c.sql
REM  Description: List the student IDs of enrolled students living in
REM               Connecticut.
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

SELECT student_id AS "Alumnos de Connecticut", state
FROM enrollment JOIN student
USING (student_id)
 JOIN zipcode
USING (zip)
WHERE state = 'CT';

spool off
