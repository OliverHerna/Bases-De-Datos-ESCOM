spool  %ORA_OUT%\1_8_HernandezMendezOliverManuel.txt
REM usr: ej_mastering_5/ej_mastering_5
REM ******************************************************************
REM  File:        1_HernandezMendezOliverManuel.sql
REM  Pages:       160-161
REM
REM  Alumn:       Hernendez Mendez Oliver Manuel | 2CM4
REM  Created:     January 18, 2021
REM  Modified:    -
REM  Version:     1.0
REM  Book:        Mastering-Oracle-Sql-Oreilly
REM ******************************************************************

SELECT E.LNAME "Employee", M.LNAME "Manager"
FROM EMPLOYEE E, EMPLOYEE M
WHERE E.MANAGER_EMP_ID = M.EMP_ID;

SELECT COUNT(*) FROM EMPLOYEE;

SELECT E.LNAME "Employee", M.LNAME "Manager"
FROM EMPLOYEE E, EMPLOYEE M
WHERE E.MANAGER_EMP_ID = M.EMP_ID (+);

spool off
