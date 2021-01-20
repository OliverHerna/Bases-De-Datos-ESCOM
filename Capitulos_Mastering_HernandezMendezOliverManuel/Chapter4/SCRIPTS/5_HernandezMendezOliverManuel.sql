spool  %ORA_OUT%\5_HernandezMendezOliverManuel.txt
REM usr: ej_mastering_4/ej_mastering_4
REM ******************************************************************
REM  File:        5_HernandezMendezOliverManuel.sql
REM  Pages:       63-63
REM
REM  Alumn:       Hernendez Mendez Oliver Manuel | 2CM4
REM  Created:     January 18, 2021
REM  Modified:    -
REM  Version:     1.0
REM  Book:        Mastering-Oracle-Sql-Oreilly
REM ******************************************************************

SELECT SALE_PRICE, COUNT(ORDER_NBR)
FROM CUST_ORDER
GROUP BY SALE_PRICE;

SELECT SALE_PRICE, COUNT(ORDER_NBR)
FROM CUST_ORDER
GROUP BY SALE_PRICE
ORDER BY SALE_PRICE DESC;

spool off
