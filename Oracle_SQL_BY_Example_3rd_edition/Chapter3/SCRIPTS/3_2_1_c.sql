spool %ORA_OUT%\3_2_1_c.txt
REM ******************************************************************
REM  File:        3_2_1_c.sql
REM  Description: Write a SELECT statement that displays distinct numeric grades
REM               from the GRADE table and half those values expressed as a
REM               whole number in a separate column
REM
REM  Alumn:       Hernandez Mendez Oliver Manuel | 2CM4
REM  Created:     December 29, 2020
REM  Modified:    -
REM  Version:     1.0
REM  Book:        Oracle SQL by Example, Third Edition By Alice Rischert
REM ******************************************************************

set linesize 130
set pagesize 90
set colsep ' ||'

SELECT DISTINCT numeric_grade,
       ROUND(numeric_grade/2)
FROM grade;

spool off
