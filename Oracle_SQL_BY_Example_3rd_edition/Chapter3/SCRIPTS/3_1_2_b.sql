spool %ORA_OUT%\3_1_2_b.txt
REM ******************************************************************
REM  File:        3_1_2_b.sql
REM  Description: Using functions in the SELECT list, WHERE, and ORDER BY clauses, write the SELECT
REM               statement that returns course numbers and course descriptions from the COURSE table
REM               and looks like the following result set:
REM               Description
REM               -------------------------------------
REM               204.......Intro to SQL
REM               130.......Intro to Unix
REM               230.......Intro to Internet
REM               20........Intro to Computers
REM               25........Intro to Programming
REM               120.......Intro to Java Programming
REM               240.......Intro to the Basic Language
REM               7 rows selected.
REM
REM  Alumn:       Hernandez Mendez Oliver Manuel | 2CM4
REM  Created:     December 28, 2020
REM  Modified:    -
REM  Version:     1.0
REM  Book:        Oracle SQL by Example, Third Edition By Alice Rischert
REM ******************************************************************

set linesize 130
set pagesize 90
set colsep ' ||'

SELECT CONCAT(
       RPAD(course_no, 10, '.'),
       description) "Description"
FROM course
WHERE description LIKE 'Intro%'
ORDER BY LENGTH(description);

spool off
