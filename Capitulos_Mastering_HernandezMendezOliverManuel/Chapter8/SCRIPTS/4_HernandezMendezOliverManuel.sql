spool  %ORA_OUT%\4_8_HernandezMendezOliverManuel.txt
REM usr: ej_mastering_8/ej_mastering_8
REM ******************************************************************
REM  File:        4_HernandezMendezOliverManuel.sql
REM  Pages:       167
REM
REM  Alumn:       Hernendez Mendez Oliver Manuel | 2CM4
REM  Created:     January 18, 2021
REM  Modified:    -
REM  Version:     1.0
REM  Book:        Mastering-Oracle-Sql-Oreilly
REM ******************************************************************

SELECT COUNT(DISTINCT LEVEL)
FROM EMPLOYEE
START WITH MANAGER_EMP_ID IS NULL
CONNECT BY PRIOR EMP_ID = MANAGER_EMP_ID;

SELECT LEVEL, COUNT(EMP_ID)
FROM EMPLOYEE
START WITH MANAGER_EMP_ID IS NULL
CONNECT BY PRIOR EMP_ID = MANAGER_EMP_ID
GROUP BY LEVEL;

spool off
