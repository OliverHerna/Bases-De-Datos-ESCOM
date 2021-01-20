spool  %ORA_OUT%\4_5_HernandezMendezOliverManuel.txt
REM usr: ej_mastering_5/ej_mastering_5
REM ******************************************************************
REM  File:        4_HernandezMendezOliverManuel.sql
REM  Pages:       81
REM
REM  Alumn:       Hernendez Mendez Oliver Manuel | 2CM4
REM  Created:     January 18, 2021
REM  Modified:    -
REM  Version:     1.0
REM  Book:        Mastering-Oracle-Sql-Oreilly
REM ******************************************************************

SELECT sizes.name order_size, SUM(co.sale_price) tot_dollars
FROM cust_order co,
 (SELECT 'SMALL' name, 0 lower_bound, 999 upper_bound from dual
 UNION ALL
 SELECT 'MEDIUM' name, 1000 lower_bound, 24999 upper_bound from dual
 UNION ALL
 SELECT 'LARGE' name, 25000 lower_bound, 9999999 upper_bound from dual
 ) sizes
WHERE co.cancelled_dt IS NULL
 AND co.order_dt >= TO_DATE('01-JAN-2001','DD-MON-YYYY')
 AND co.order_dt < TO_DATE('01-JAN-2002','DD-MON-YYYY')
 AND co.sale_price BETWEEN sizes.lower_bound AND sizes.upper_bound
GROUP BY sizes.name;

spool off
