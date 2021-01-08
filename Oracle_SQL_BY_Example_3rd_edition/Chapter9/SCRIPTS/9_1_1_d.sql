spool  %ORA_OUT%\9_1_1_d.txt
REM ******************************************************************
REM  File:        9_1_1_d.sql
REM  Description: Show all the cities, state, and zip codes for Connecticut.
REM               Display a count of how many students live in each zip code.
REM               Order the result alphabetically by city. The result should
REM               look similar to the following output. Note, the column
REM               STUDENT_COUNT displays a zero when no student lives in a
REM               particular zip code.
REM               CITY ST ZIP STUDENT_COUNT
REM               ------------------------- -- ----- -------------
REM               Ansonia CT 06401 0
REM               Bridgeport CT 06605 1
REM               ...
REM               Wilton CT 06897 0
REM               Woodbury CT 06798 1
REM               19 rows selected.
REM
REM  Alumn:       Hernandez Mendez Oliver Manuel | 2CM4 | ej_cap_7
REM  Created:     December 06, 2020
REM  Modified:    -
REM  Version:     1.0
REM  Book:        Oracle SQL by Example, Third Edition By Alice Rischert
REM ******************************************************************

set linesize 130
set pagesize 90
set colsep ' || '

SELECT z.city, z.state, z.zip, COUNT(s.zip)
FROM zipcode z LEFT JOIN student s
ON (z.zip = s.zip)
WHERE z.state = 'CT'
GROUP BY z.city, z.state, z.zip;

spool off
