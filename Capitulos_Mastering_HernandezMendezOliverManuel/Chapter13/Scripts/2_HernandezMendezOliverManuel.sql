spool  %ORA_OUT%\2_13_HernandezMendezOliverManuel.txt
REM usr: ej_mastering_8/ej_mastering_8
REM ******************************************************************
REM  File:        2_HernandezMendezOliverManuel.sql
REM  Pages:       291-293
REM
REM  Alumn:       Hernendez Mendez Oliver Manuel | 2CM4
REM  Created:     January 18, 2021
REM  Modified:    -
REM  Version:     1.0
REM  Book:        Mastering-Oracle-Sql-Oreilly
REM ******************************************************************

SELECT month,
 SUM(tot_sales) monthly_sales,
 SUM(SUM(tot_sales)) OVER (ORDER BY month
   ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) total_sales
   FROM orders
   WHERE year = 2001
    AND region_id = 6
   GROUP BY month
   ORDER BY month;

   SELECT month,
    SUM(tot_sales) monthly_sales,
    SUM(SUM(tot_sales)) OVER (ORDER BY month
    ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) window_sales,
    SUM(SUM(tot_sales)) OVER ( ) reporting_sales
   FROM orders
   WHERE year = 2001
    AND region_id = 6
   GROUP BY month
   ORDER BY month;

   SELECT month,
    SUM(tot_sales) monthly_sales,
    SUM(SUM(tot_sales)) OVER ( ) yearly_sales
   FROM orders
   WHERE year = 2001
   GROUP BY month
   ORDER BY month;

spool off
