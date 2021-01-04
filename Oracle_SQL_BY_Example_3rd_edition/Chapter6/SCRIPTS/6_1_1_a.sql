spool  %ORA_OUT%\6_1_1_a.txt
REM ******************************************************************
REM  File:        6_1_1_a.sql
REM  Description: For all students, display last name, city, state, and zip
                  code. Show the result ordered by zip code.
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

SELECT s.LAST_NAME,
       z.CITY, z.STATE, zip
FROM student s JOIN zipcode z
USING (zip);


spool off
