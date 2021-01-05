spool  %ORA_OUT%\7_1_1_d.txt
REM ******************************************************************
REM  File:        7_1_1_d.sql
REM  Description: Choose the most ambitious students: Display the STUDENT_ID
REM               for students enrolled in the most sections.
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

/*
SELECT MAX(COUNT(*))
FROM enrollment
GROUP BY student_id;
*/

SELECT student_id
FROM enrollment
GROUP BY student_id
HAVING COUNT(*) IN (
  SELECT MAX(COUNT(*))
  FROM enrollment
  GROUP BY student_id
);

spool off
