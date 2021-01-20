spool  %ORA_OUT%\2_HernandezMendezOliverManuel.txt
REM usr: ej_mastering_4/ej_mastering_4
REM ******************************************************************
REM  File:        2_HernandezMendezOliverManuel.sql
REM  Pages:       57-58
REM
REM  Alumn:       Hernendez Mendez Oliver Manuel | 2CM4
REM  Created:     January 18, 2021
REM  Modified:    -
REM  Version:     1.0
REM  Book:        Mastering-Oracle-Sql-Oreilly
REM ******************************************************************

SELECT COUNT(*), COUNT(SALE_PRICE) FROM CUST_ORDER;

SELECT COUNT(*), SUM(SALE_PRICE), AVG(SALE_PRICE)
FROM CUST_ORDER;

SELECT AVG(NVL(SALE_PRICE,0)) FROM CUST_ORDER;

spool off
