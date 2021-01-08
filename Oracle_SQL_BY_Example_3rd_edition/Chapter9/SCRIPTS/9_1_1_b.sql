spool  %ORA_OUT%\9_1_1_b.txt
REM ******************************************************************
REM  File:        9_1_1_b.sql
REM  Description: Show the description of all courses with the prerequisite
REM               course number 350. Include the location where the sections
REM               meet in the result. Return course rows even if no
REM               corresponding row in the SECTION table is found.
REM
REM  Alumn:       Hernandez Mendez Oliver Manuel | 2CM4 | ej_cap_7
REM  Created:     December 06, 2020
REM  Modified:    -
REM  Version:     1.0
REM  Book:        Oracle SQL by Example, Third Edition By Alice Rischert
REM ******************************************************************

set linesize 130
set pagesize 90
set colsep ' || '

SELECT c.description AS "Description", s.location AS "Location"
FROM course c LEFT JOIN section s
USING (course_no)
WHERE prerequisite = 350;


spool off
