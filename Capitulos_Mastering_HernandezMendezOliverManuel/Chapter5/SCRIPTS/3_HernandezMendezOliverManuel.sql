spool  %ORA_OUT%\3_5_HernandezMendezOliverManuel.txt
REM usr: ej_mastering_5/ej_mastering_5
REM ******************************************************************
REM  File:        3_HernandezMendezOliverManuel.sql
REM  Pages:       78-80
REM
REM  Alumn:       Hernendez Mendez Oliver Manuel | 2CM4
REM  Created:     January 18, 2021
REM  Modified:    -
REM  Version:     1.0
REM  Book:        Mastering-Oracle-Sql-Oreilly
REM ******************************************************************

SELECT d.dept_id, d.name, emp_cnt.tot
FROM department d,
 (SELECT dept_id, COUNT(*) tot
 FROM employee
 GROUP BY dept_id) emp_cnt
WHERE d.dept_id = emp_cnt.dept_id;

spool off
