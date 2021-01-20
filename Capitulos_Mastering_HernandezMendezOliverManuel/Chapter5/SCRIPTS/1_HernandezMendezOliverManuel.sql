spool  %ORA_OUT%\1_5_HernandezMendezOliverManuel.txt
REM usr: ej_mastering_5/ej_mastering_5
REM ******************************************************************
REM  File:        1_HernandezMendezOliverManuel.sql
REM  Pages:       69-70
REM
REM  Alumn:       Hernendez Mendez Oliver Manuel | 2CM4
REM  Created:     January 18, 2021
REM  Modified:    -
REM  Version:     1.0
REM  Book:        Mastering-Oracle-Sql-Oreilly
REM ******************************************************************

SELECT lname
FROM employee
WHERE salary > (SELECT AVG(salary)
 FROM EMPLOYEE);

 SELECT sales_emp_id, COUNT(*)
 FROM cust_order
 GROUP BY sales_emp_id
 HAVING COUNT(*) = (SELECT MAX(COUNT(*))
  FROM cust_order
  GROUP BY sales_emp_id);

spool off
