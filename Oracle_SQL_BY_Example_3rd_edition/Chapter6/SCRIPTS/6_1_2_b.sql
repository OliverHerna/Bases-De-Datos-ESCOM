spool  %ORA_OUT%\6_1_2_b.txt
REM ******************************************************************
REM  File:        6_1_2_b.sql
REM  Description: Select the student ID, course number, enrollment date, and
REM               section ID for students who enrolled in course number 20 on
REM               January 30, 2003
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

SELECT e.student_id, s.course_no, e.enroll_date,
       section_id
FROM enrollment e JOIN section s
USING (section_id)
WHERE s.course_no = 20
AND e.enroll_date >= TO_DATE('30-JAN-2003', 'DD-MON-YYYY')
AND e.enroll_date < TO_DATE('31-JAN-2003', 'DD-MON-YYYY');
spool off
