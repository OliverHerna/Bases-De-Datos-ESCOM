spool  %ORA_OUT%\9_1_2_a.txt
REM ******************************************************************
REM  File:        9_1_2_a.sql
REM  Description: Display the course number, description, cost, class location,
REM               and instructors last name for all the courses. Also include
REM               courses where no sections or instructors have been
REM               assigned.
REM
REM  Alumn:       Hernandez Mendez Oliver Manuel | 2CM4 | ej_cap_9
REM  Created:     December 06, 2020
REM  Modified:    -
REM  Version:     1.0
REM  Book:        Oracle SQL by Example, Third Edition By Alice Rischert
REM ******************************************************************

set linesize 130
set pagesize 90
set colsep ' || '

SELECT course_no cou, description, cost,
      location, last_name
    FROM course LEFT OUTER JOIN section
    USING (course_no)
      LEFT OUTER JOIN instructor
    USING (instructor_id)
    ORDER BY course_no;

spool off
