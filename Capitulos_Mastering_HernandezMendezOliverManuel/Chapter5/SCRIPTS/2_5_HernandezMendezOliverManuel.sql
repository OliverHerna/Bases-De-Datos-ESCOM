spool  %ORA_OUT%\2_5_HernandezMendezOliverManuel.txt
REM usr: ej_mastering_5/ej_mastering_5
REM ******************************************************************
REM  File:        2_HernandezMendezOliverManuel.sql
REM  Pages:       69-70
REM
REM  Alumn:       Hernendez Mendez Oliver Manuel | 2CM4
REM  Created:     January 18, 2021
REM  Modified:    -
REM  Version:     1.0
REM  Book:        Mastering-Oracle-Sql-Oreilly
REM ******************************************************************

SELECT fname, lname
FROM employee
WHERE dept_id = 3 AND salary >= ALL
 (SELECT salary
 FROM employee
 WHERE dept_id = 3);

 SELECT fname, lname
 FROM employee
 WHERE manager_emp_id IS NOT NULL
  AND salary > ANY
  (SELECT salary
  FROM employee
  WHERE manager_emp_id IS NULL);

spool off
