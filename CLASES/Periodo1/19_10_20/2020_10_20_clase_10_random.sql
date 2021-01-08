rem fuente manual de oracle de packages & functions 
rem PL/SQL PACKAGE REFERENCE ORACLE 
REM

SELECT DBMS_RANDOM.random FROM dual;
SELECT ROUND(DBMS_RANDOM.VALUE(2000,2003)) num FROM dual;

SELECT TO_CHAR(TO_DATE('01/01/2000','mm/dd/yyyy'),'J') FROM DUAL;
SELECT TO_CHAR(TO_DATE('12/31/2003','mm/dd/yyyy'),'J') FROM DUAL;


SELECT TO_DATE(TRUNC(DBMS_RANDOM.VALUE(2451545,2454005)),'J') FROM DUAL;
alter session set nls_date_format ='dd-fmmonth-yyyy';
ALTER SESSION SET NLS_DATE_FORMAT = 'DD-fMONTH-YYYY';
SELECT TO_DATE(
			   TRUNC(
					 DBMS_RANDOM.VALUE(2451545,2454005)
			        )
					,'J') FROM DUAL;

rem fuente manual de oracle de packages & functions 
rem PL/SQL PACKAGE REFERENCE ORACLE 
REM
PROMPT DESPLIEGA EJEMPLOS DE LA FUNCION STRING
SELECT dbms_random.string('A', 10) str FROM dual;
SELECT dbms_random.string('a', 10) str FROM dual;
SELECT dbms_random.string('u', 10) str FROM dual;
SELECT dbms_random.string('U', 10) str FROM dual;
SELECT dbms_random.string('l', 10) str FROM dual;
SELECT dbms_random.string('L', 10) str FROM dual;
SELECT dbms_random.string('x', 10) str FROM dual;
SELECT dbms_random.string('X', 10) str FROM dual;
SELECT dbms_random.string('p', 10) str FROM dual;
SELECT dbms_random.string('P', 10) str FROM dual;

SELECT dbms_random.string('U', 1)||dbms_random.string('L', 10) str FROM dual;