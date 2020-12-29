spool  %ORA_OUT%\3_1_1_a.txt
REM ******************************************************************
REM  File:        3_1_1_a.sql
REM  Description: (Exercise) Execute the following SQL statement. Based on the
REM               result, what is the purpose of the INITCAP function?
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
clear screen

SELECT description "Description",
  INITCAP(description) "Initcap Description"
  FROM course
WHERE description LIKE '%SQL%';


spool off
