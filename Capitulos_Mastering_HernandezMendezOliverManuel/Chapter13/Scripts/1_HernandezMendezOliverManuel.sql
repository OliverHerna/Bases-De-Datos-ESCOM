spool  %ORA_OUT%\1_13_HernandezMendezOliverManuel.txt
REM usr: ej_mastering_8/ej_mastering_8
REM ******************************************************************
REM  File:        1_HernandezMendezOliverManuel.sql
REM  Pages:       290-291
REM
REM  Alumn:       Hernendez Mendez Oliver Manuel | 2CM4
REM  Created:     January 18, 2021
REM  Modified:    -
REM  Version:     1.0
REM  Book:        Mastering-Oracle-Sql-Oreilly
REM ******************************************************************

SELECT month, SUM(tot_sales) monthly_sales,
 LAG(SUM(tot_sales), 1) OVER (ORDER BY month) prev_month_sales
FROM orders
WHERE year = 2001
 AND region_id = 6
GROUP BY month
ORDER BY month;

SELECT months.month month, months.monthly_sales monthly_sales,
 ROUND((months.monthly_sales — NVL(months.prev_month_sales,
 months.monthly_sales)) /
 NVL(months.prev_month_sales, months.monthly_sales),
 3) * 100 percent_change
FROM
 (SELECT month, SUM(tot_sales) monthly_sales,
 LAG(SUM(tot_sales), 1) OVER (ORDER BY month) prev_month_sales
 FROM orders
 WHERE year = 2001
 AND region_id = 6
 GROUP BY month) months
ORDER BY month;

spool off
