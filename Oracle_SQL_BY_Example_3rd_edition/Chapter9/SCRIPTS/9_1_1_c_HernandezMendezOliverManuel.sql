spool  %ORA_OUT%\9_1_1_c.txt
REM ******************************************************************
REM  File:        9_1_1_c.sql
REM  Description: Rewrite the following SQL statement using an outer join.
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

SELECT course_no, description
    FROM course LEFT OUTER JOIN section
    USING (course_no)
    WHERE section_id IS NULL;


spool off
