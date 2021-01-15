set linesize 130
set pagesize 90
set feddback on
set colsep ' ||'
clear screen 

REM SCRIPTS DE CAP 6 DE MANUAL DE ORACLE 
REM E49106_12 SQL TUNNING_GUIDE 
DESC V$SQL_PLAN



REM DESC PLAN_TABLE
DESC PLAN_TABLE
DESC V$SQL_PLAN_STATISTICS
DESC V$SQL_PLAN_STATISTICS_ALL

EXPLAIN PLAN FOR
SELECT last_name FROM employees;

select plan_table_output from table(dbms_xplan.display('plan_table',null,'serial'));

EXPLAIN PLAN FOR
sELECT lname
FROM project, employee,works_on
	where bdate > '31/12/1957' and pnumber=pno and PName= 'ProductX' and ssn=essn;
	
select plan_table_output from table(dbms_xplan.display('plan_table',null,'serial'));

EXPLAIN PLAN
SET STATEMENT_ID = 'Query1' FOR
SELECT lname FROM employee;

select plan_table_output from table(dbms_xplan.display('plan_table',null,'serial'));

EXPLAIN PLAN
SET STATEMENT_ID = 'Query2' FOR
sELECT lname
FROM project, employee,works_on
	where bdate > '31/12/1957' and pnumber=pno and PName= 'ProductX' and ssn=essn;
	
select plan_table_output from table(dbms_xplan.display('plan_table','Query1','serial'));
select plan_table_output from table(dbms_xplan.display('plan_table','Query1','SERIAL'));
select plan_table_output from table(dbms_xplan.display('plan_table','Query1','TYPICAL'));
select plan_table_output from table(dbms_xplan.display('plan_table','Query1','ALL'));
select plan_table_output from table(dbms_xplan.display('plan_table','Query1','BASIC'));

select plan_table_output from table(dbms_xplan.display('plan_table','Query2','SERIAL'));
select plan_table_output from table(dbms_xplan.display('plan_table','Query2','TYPICAL'));
select plan_table_output from table(dbms_xplan.display('plan_table','Query2','ALL'));
select plan_table_output from table(dbms_xplan.display('plan_table','Query2','BASIC'));


select plan_table_output from table(dbms_xplan.display('plan_table',null,'serial'));
select plan_table_output from table(dbms_xplan.display('plan_table',null,'serial'));


