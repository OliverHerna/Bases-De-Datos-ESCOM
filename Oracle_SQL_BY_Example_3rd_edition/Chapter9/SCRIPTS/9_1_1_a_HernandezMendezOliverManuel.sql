spool  %ORA_OUT%\9_1_1_a.txt
REM ******************************************************************
REM  File:        9_1_1_a.sql
REM  Description: Explain why Oracle returns an error message when you execute
REM               the following SELECT statement.
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

SELECT c.course_no, s.course_no, s.section_id,
 c.description, s.start_date_time
 FROM course c, section s
 WHERE c.course_no(+) = s.course_no(+)



SELECT c.course_no, s.course_no, s.section_id,
 c.description, s.start_date_time
 FROM course c FULL OUTER JOIN section s
 ON c.course_no = s.course_no;



spool off
