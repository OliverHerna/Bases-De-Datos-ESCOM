spool  %ORA_OUT%\5_1_1_b.txt
REM ******************************************************************
REM  File:        5_1_1_b.sql
REM  Description: Write a SELECT statement to determine the total number of
REM               students enrolled. Count students only once, no matter how
REM               many courses they are enrolled in.
REM
REM  Alumn:       Hernandez Mendez Oliver Manuel | 2CM4
REM  Created:     December 02, 2020
REM  Modified:    -
REM  Version:     1.0
REM  Book:        Oracle SQL by Example, Third Edition By Alice Rischert
REM ******************************************************************

set linesize 130
set pagesize 90
set colsep ' || '

SELECT COUNT(DISTINCT student_id)
FROM ENROLLMENT;

spool off
