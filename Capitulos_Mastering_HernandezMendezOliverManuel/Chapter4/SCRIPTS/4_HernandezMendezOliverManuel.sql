spool  %ORA_OUT%\4_HernandezMendezOliverManuel.txt
REM usr: ej_mastering_4/ej_mastering_4
REM ******************************************************************
REM  File:        4_HernandezMendezOliverManuel.sql
REM  Pages:       59-63
REM
REM  Alumn:       Hernendez Mendez Oliver Manuel | 2CM4
REM  Created:     January 18, 2021
REM  Modified:    -
REM  Version:     1.0
REM  Book:        Mastering-Oracle-Sql-Oreilly
REM ******************************************************************

SELECT CUST_NBR, COUNT(ORDER_NBR)
FROM CUST_ORDER
GROUP BY CUST_NBR;

SELECT 'CUSTOMER', CUST_NBR, COUNT(ORDER_NBR)
FROM CUST_ORDER
GROUP BY 'CUSTOMER', CUST_NBR;

SELECT ROWNUM, CUST_NBR, COUNT(ORDER_NBR)
FROM CUST_ORDER
GROUP BY ROWNUM, CUST_NBR;

SELECT COUNT(ORDER_NBR)
FROM CUST_ORDER
GROUP BY CUST_NBR;

SELECT CUST_NBR, COUNT(ORDER_NBR)
FROM CUST_ORDER
GROUP BY CUST_NBR, ORDER_DT;

SELECT CUST_NBR, ORDER_DT, COUNT(ORDER_NBR)
FROM CUST_ORDER
GROUP BY CUST_NBR, ORDER_DT;

spool off
