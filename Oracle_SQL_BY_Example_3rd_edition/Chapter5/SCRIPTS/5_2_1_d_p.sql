spool  %ORA_OUT%\5_2_1_d.txt
REM ******************************************************************
REM  File:        5_2_1_d.sql
REM  Description: Write the same SELECT statement as in the previous question
REM               except for courses with exactly two sections. Hint: Think
REM               about the relationship between the COURSE and SECTION tables,
REM               specifically how many times a course can be represented in the
REM               SECTION table.
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


spool off
