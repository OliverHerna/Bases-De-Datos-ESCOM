spool  %ORA_OUT%\5_5_HernandezMendezOliverManuel.txt
REM usr: ej_mastering_5/ej_mastering_5
REM ******************************************************************
REM  File:        5_HernandezMendezOliverManuel.sql
REM  Pages:       85
REM
REM  Alumn:       Hernendez Mendez Oliver Manuel | 2CM4
REM  Created:     January 18, 2021
REM  Modified:    -
REM  Version:     1.0
REM  Book:        Mastering-Oracle-Sql-Oreilly
REM ******************************************************************

SELECT na_regions.name region_name,
 SUM(co.sale_price) total_sales
 FROM cust_order co, customer c,
 (SELECT region_id, name
 FROM region
 START WITH name = 'North America'
 CONNECT BY PRIOR region_id = super_region_id) na_regions
WHERE co.cancelled_dt IS NULL
 AND co.order_dt >= TO_DATE('01-JAN-2001','DD-MON-YYYY')
 AND co.order_dt < TO_DATE('01-JAN-2002','DD-MON-YYYY')
 AND co.cust_nbr = c.cust_nbr
 AND c.region_id = na_regions.region_id
GROUP BY na_regions.name;

spool off
