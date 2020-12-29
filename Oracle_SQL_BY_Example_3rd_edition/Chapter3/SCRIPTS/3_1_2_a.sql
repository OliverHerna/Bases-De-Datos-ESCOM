spool %ORA_OUT%\3_1_2_a.txt
REM ******************************************************************
REM  File:        3_1_2_a.sql
REM  Description: Write a SELECT statement that returns each instructor S
REM               last name, followed by a comma and a space, followed by
REM               the instructor s first name, all in a single column in the
result set.
REM
REM  Alumn:       Hernandez Mendez Oliver Manuel | 2CM4
REM  Created:     December 28, 2020
REM  Modified:    -
REM  Version:     1.0
REM  Book:        Oracle SQL by Example, Third Edition By Alice Rischert
REM ******************************************************************

set linesize 130
set pagesize 90
set colsep ' ||'


spool off
