spool  %ORA_OUT%\4_13_HernandezMendezOliverManuel.txt
REM usr: ej_mastering_8/ej_mastering_8
REM ******************************************************************
REM  File:        4_HernandezMendezOliverManuel.sql
REM  Pages:       294
REM
REM  Alumn:       Hernendez Mendez Oliver Manuel | 2CM4
REM  Created:     January 18, 2021
REM  Modified:    -
REM  Version:     1.0
REM  Book:        Mastering-Oracle-Sql-Oreilly
REM ******************************************************************

SELECT region_id, salesperson_id,
 SUM(tot_sales) sp_sales,
 ROUND(SUM(tot_sales) /
 SUM(SUM(tot_sales)) OVER (PARTITION BY region_id),
 2) percent_of_region
 FROM orders
 WHERE year = 2001
 GROUP BY region_id, salesperson_id
ORDER BY region_id, salesperson_id1,2;

spool off
