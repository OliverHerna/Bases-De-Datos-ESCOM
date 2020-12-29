spool %ORA_OUT%\3_2_1_b.txt
REM ******************************************************************
REM  File:        3_2_1_b.sql
REM  Description: Write a SELECT statement that displays distinct course costs.
REM               In a separate column, show the COST increased by 75% and round
REM               the decimals to the nearest dollar.
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

SELECT DISTINCT cost "cost",
       cost + (cost * .75),
       ROUND(cost + (cost * .75)) "cost increased"
FROM course;

spool off
