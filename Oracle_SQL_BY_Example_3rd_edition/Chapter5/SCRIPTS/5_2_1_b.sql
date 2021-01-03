spool  %ORA_OUT%\5_2_1_b.txt
REM ******************************************************************
REM  File:        5_2_1_b.sql
REM  Description: Write a SELECT statement showing student IDs and the number
REM               of courses they are enrolled in. Show only those enrolled in
REM               more than two classes.
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

SELECT STUDENT_ID, COUNT(SECTION_ID)
FROM ENROLLMENT
GROUP BY STUDENT_ID
HAVING(COUNT(SECTION_ID) > 2);

spool off
