spool  %ORA_OUT%\7_1_3_b.txt
REM ******************************************************************
REM  File:        7_1_3_b.sql
REM  Description: Select the sections and their capacity where the capacity
REM               equals the number of students enrolled.
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

SELECT section_id, capacity
FROM section
WHERE (section_id, capacity) IN
(SELECT section_id, COUNT(*)
  FROM enrollment
  GROUP BY section_id);

spool off
