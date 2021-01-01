spool  %ORA_OUT%\4_1_1_a.txt
REM ******************************************************************
REM  File:        4_1_1_a.sql
REM  Description: ) Display the course number, section ID, and starting date and
REM                 time for sections that were taught on May 4, 2003.
REM
REM  Alumn:       Hernandez Mendez Oliver Manuel | 2CM4
REM  Created:     December 01, 2020
REM  Modified:    -
REM  Version:     1.0
REM  Book:        Oracle SQL by Example, Third Edition By Alice Rischert
REM ******************************************************************

set linesize 130
set pagesize 90
set colsep ' ||'
clear screen

ALTER SESSION SET NLS_DATE_LANGUAGE = 'ENGLISH';

SELECT course_no, section_id, start_date_time
FROM section
WHERE start_date_time >= TO_DATE('04-MAY-2003 00:00:00', 'DD-MON-YYYY HH24:MI:SS')
AND start_date_time < TO_DATE('05-MAY-2003 00:00:00', 'DD-MON-YYYY HH24:MI:SS');

spool off
