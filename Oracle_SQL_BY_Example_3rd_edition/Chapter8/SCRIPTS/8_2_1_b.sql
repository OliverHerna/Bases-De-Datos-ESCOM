spool  %ORA_OUT%\8_2_1_b.txt
REM ******************************************************************
REM  File:        8_2_1_b.sql
REM  Description:Use the MINUS set operator to create a list of courses and
REM              sections with no students enrolled. Add a column to the result
REM              set with the title Status and display the text No Enrollments
REM              in each row. Order the results by the COURSE_NO and SECTION_NO
REM              columns.
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

SELECT course_no, section_id, 'No Enrrolments' AS "status"
FROM section
MINUS
SELECT course_no, section_id, 'No Enrrolments' AS "status"
FROM section s
WHERE EXISTS(
  SELECT section_id
  FROM enrollment e
  WHERE e.section_id = s.section_id
)
ORDER BY 1, 2;
spool off
