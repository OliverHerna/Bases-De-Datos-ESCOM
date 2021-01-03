spool  %ORA_OUT%\5_2_1_c.txt
REM ******************************************************************
REM  File:        5_2_1_c.sql
REM  Description: Write a SELECT statement that displays the average room
REM               capacity for each course. Display the average expressed to the
REM               nearest whole number in another column. Use column aliases for
REM               each column selected.
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

SELECT COURSE_NO AS "COURSE",
       ROUND(AVG(CAPACITY)) AS "CAPACIDAD (%)"
FROM SECTION
GROUP BY COURSE_NO;
spool off
