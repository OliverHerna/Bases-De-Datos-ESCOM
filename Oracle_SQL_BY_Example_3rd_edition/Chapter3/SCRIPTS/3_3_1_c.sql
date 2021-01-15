spool %ORA_OUT%\3_3_1_c.txt
REM ******************************************************************
REM  File:        3_3_1_c.sql
REM  Description: Write the query to accomplish the following output using the NVL2 function in the
REM               column 'Get this result'.
REM               ID NAME PHONE Get this result
REM               ------------------ ------------ -----------------
REM               112 Thomas Thomas 201-555-5555 Phone# exists.
REM               111 Peggy Noviello No phone# exists.
REM               2 rows selected.
REM  Alumn:       Hernandez Mendez Oliver Manuel | 2CM4
REM  Created:     December 29, 2020
REM  Modified:    -
REM  Version:     1.0
REM  Book:        Oracle SQL by Example, Third Edition By Alice Rischert
REM ******************************************************************
/*Pendiente*/
set linesize 130
set pagesize 90
set colsep ' ||'

SELECT student_id id, first_name||' '|| last_name name,
       phone,
       NVL2(phone, 'Phone# exists.', 'No phone# exists.')
       "Get this result"
FROM student
WHERE student_id IN (111, 112) ;

spool off
