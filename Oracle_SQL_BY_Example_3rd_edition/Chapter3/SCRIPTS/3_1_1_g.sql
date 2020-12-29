spool %ORA_OUT%\3_1_1_g.txt
REM ******************************************************************
REM  File:        3_1_1_g.sql
REM  Description: Write the SQL statement to retrieve those students that have
REM               a last name with the lowercase letter 'o' occurring three or
REM               more times.
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

SELECT last_name "Last Name With ooo"
  FROM student
WHERE length(last_name) - length(replace(last_name, 'o')) > 2;

spool off
