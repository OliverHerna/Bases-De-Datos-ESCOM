spool  %ORA_OUT%\3_8_HernandezMendezOliverManuel.txt
REM usr: ej_mastering_5/ej_mastering_5
REM ******************************************************************
REM  File:        3_HernandezMendezOliverManuel.sql
REM  Pages:       165-166
REM
REM  Alumn:       Hernendez Mendez Oliver Manuel | 2CM4
REM  Created:     January 18, 2021
REM  Modified:    -
REM  Version:     1.0
REM  Book:        Mastering-Oracle-Sql-Oreilly
REM ******************************************************************

SELECT LNAME, EMP_ID, MANAGER_EMP_ID
FROM EMPLOYEE
START WITH MANAGER_EMP_ID IS NULL
CONNECT BY PRIOR EMP_ID = MANAGER_EMP_ID;

SELECT * FROM ASSEMBLY
START WITH PARENT_ASSEMBLY_TYPE IS NULL
AND PARENT_ASSEMBLY_ID IS NULL
CONNECT BY PARENT_ASSEMBLY_TYPE = PRIOR ASSEMBLY_TYPE
AND PARENT_ASSEMBLY_ID = PRIOR ASSEMBLY_ID;

spool off
