spool  %ORA_OUT%\3_HernandezMendezOliverManuel.txt
REM usr: ej_mastering_4/ej_mastering_4
REM ******************************************************************
REM  File:        3_HernandezMendezOliverManuel.sql
REM  Pages:       57-58
REM
REM  Alumn:       Hernendez Mendez Oliver Manuel | 2CM4
REM  Created:     January 18, 2021
REM  Modified:    -
REM  Version:     1.0
REM  Book:        Mastering-Oracle-Sql-Oreilly
REM ******************************************************************

SELECT COUNT(CUST_NBR), COUNT(DISTINCT CUST_NBR), COUNT(ALL CUST_NBR)
FROM CUST_ORDER;

SELECT COUNT(ALL SALE_PRICE) FROM CUST_ORDER;

SELECT STDDEV_POP(ALL SALE_PRICE)
FROM CUST_ORDER;

spool off
