spool  %ORA_OUT%\7_1_1_c.txt
REM ******************************************************************
REM  File:        7_1_1_c.sql
REM  Description: Select the course number and total capacity for each course.
REM               Show only the courses with a total capacity less than the
REM               average capacity of all the sections.
REM
REM  Alumn:       Hernandez Mendez Oliver Manuel | 2CM4 | ej_cap_7
REM  Created:     December 04, 2020
REM  Modified:    -
REM  Version:     1.0
REM  Book:        Oracle SQL by Example, Third Edition By Alice Rischert
REM ******************************************************************

set linesize 130
set pagesize 90
set colsep ' || '



spool off
