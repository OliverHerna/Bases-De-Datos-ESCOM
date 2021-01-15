spool C:\Users\ORA_bases\pag_511_2.txt
/*
create user sergiocia identified by sergiocia
default tablespace users
temporary tablespace temp;

grant connect, resource to sergiocia;
*/

set pagesize 99
set linesize 130
set colsep '|=|'
set underline '='



desc department
desc employee

desc project

select * from employee, department
where dno = dnumber;


DROP TABLE EMP_DEPT;
CREATE TABLE EMP_DEPT AS 
select lname,ssn,bdate,
	address,dnumber,
	dname,mgr_ssn
 from employee, department
where dno = dnumber;
SELECT * FROM EMP_DEPT;

DROP TABLE EMP_PROJ;
CREATE TABLE EMP_PROJ AS
select essn,pno,hours,
	   lname,pname,plocation
	   from works_on     w,
	        project      p, 
	        employee     e
	   where pno = pnumber
	   and  essn = ssn ;
	   
SELECT * FROM EMP_PROJ;	   
REM       REVISEMOS LAS DEPENDENCIAS FUNCIONALES 
REM                 DE LA TABLA EMP_DEPT 
REM LA DEPENDENCIA FUNCIONAL 
REM EL   SSN DETERMINA EL LNAME, BDATE, ADDRESS & DNUMBER
REM 

SELECT SSN,LNAME,BDATE,ADDRESS,DNUMBER
	FROM EMP_DEPT;
	
REM VEMOS QUE EL SSN DETERMINA A TODAS LAS TUPLAS
REM        SIN REDUNDANCIA 
REM   EL SSN ES ATRIBUTO LLAVE DE LA TABLA EMP_DEPT
             	   
REM LA DEPENDENCIA FUNCIONAL 
REM 			DNUMBER DETERMINA DNAME, DMGR_SSN
REM 	   
SELECT LNAME,DNUMBER, DNAME,MGR_SSN 
	FROM EMP_DEPT;
	
REM    
SELECT  DISTINCT (DNUMBER), DNAME,MGR_SSN
	FROM EMP_DEPT;
REM
REM PODEMOS CONCLUIR QUE SE TIENE DATOS REDUNDANTES 
REM 
/*
UNA RELACION NO DEBE TENER UN ATRIBUTO FUNCIONALMENTE
   DETERMINADO POR OTRO ATRIBUTE NO LLAVE
   ESTO ES NO DEBE EXISTIR UNA DEPENDENCIA TRANSITIVA
   DE ATRIBUTOS NO LLAVE EN UNA LLAVE PRIMARIA.

	DESCOMPONGAMOS Y COSNTRUYAMOS UNA RELACIÓN
	QUE INCLUYA ATRIBUTOS NO LLAVE QUE FUNCIONALMENTE 
	DETREMINEN OTROS ATRIBUTOS NO LLAVE 

*/
-- -----------------------------------------
REM       REVISEMOS LAS DEPENDENCIAS FUNCIONALES 
REM                 DE LA TABLA EMP_PROJ 
REM LA DEPENDENCIA FUNCIONAL DF2 "FD2" FIG 15.3 NAVATHE
REM EL NUMERO DE SEGURIDAD SOCIAL DETERMINA EL NOMBRE DEL EMPLEADO

SELECT ESSN,LNAME 
	from EMP_PROJ;
	
REM VEMOS QUE SE REPITEN EN 8 DE LA 16 TUPLAS
REM   DETERMINAR LOS VALORES DISTINTOS
SELECT DISTINCT(ESSN),LNAME 
	from EMP_PROJ;
REM   DETERMINAR LOS VALORES DISTINTOS 

REM LA DEPENDENCIA FUNCIONAL DF3 "FD3" FIG 15.3 NAVATHE
REM EL NUMERO DE PROYECTO DETERMINA EL NOMBRE DEL PROYECTO PLOCATION 
SELECT pnO,pname,plocation
	from EMP_PROJ
	ORDER BY 1;
	
SELECT DISTINCT(pnO),pname,plocation
	from EMP_PROJ
	ORDER BY 1;
spool off
	