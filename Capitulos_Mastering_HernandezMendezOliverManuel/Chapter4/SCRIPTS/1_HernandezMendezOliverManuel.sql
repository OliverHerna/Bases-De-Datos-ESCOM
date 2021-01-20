spool  %ORA_OUT%\1_HernandezMendezOliverManuel.txt
PROMT ej_mastering_4
REM ******************************************************************
REM  File:        1_HernandezMendezOliverManuel.sql
REM  Pages:       56-57
REM
REM  Alumn:       Hernendez Mendez Oliver Manuel | 2CM4
REM  Created:     January 18, 2021
REM  Modified:    -
REM  Version:     1.0
REM  Book:        Mastering-Oracle-Sql-Oreilly
REM ******************************************************************

SELECT MAX(SALARY) FROM EMPLOYEE;

DESC CUST_ORDER;

SELECT ORDER_NBR, CUST_NBR, SALES_EMP_ID, SALE_PRICE,
ORDER_DT, EXPECTED_SHIP_DT
FROM CUST_ORDER;

spool off
