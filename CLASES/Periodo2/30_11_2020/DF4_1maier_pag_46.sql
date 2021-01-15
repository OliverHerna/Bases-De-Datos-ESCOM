SPOOL C:\Users\ssali\OneDrive\2020_11_30_BASES_clase29\maier_4_2.txt
/*
  (Maier,1983,45).....
Axioma 1: Reflexividad
          X -> X
		  
Axioma 2: Aumento 
Este axioma trata conel aumento del lado izquierdo de la dependencia funcional

*/
rem ejemplo 4.1 Considere la relación r que satusface la 
rem dependencia funcional  FD:   A -> B
REM             A -> B
rem por lo tanto;
rem				AB  -> B,
rem 			AC  -> B,
rem 				AD  -> B,
rem 				ABC -> B, 
set colsep '| = |'
set pagesize 99
set linesize 130



DROP TABLE R1;
create table R1(
A varchar2(2),
B varchar2(2),
C varchar2(2),
D varchar2(2));


insert into R1 values('al', 'b1', 'c1', 'd1');
insert into R1 values('a2', 'b2', 'c1', 'd1');
insert into R1 values('al', 'b1', 'c1', 'd2');
insert into R1 values('a4', 'b3', 'c2', 'd3');

select * from R1 order by 1;


REM  				FD A ->  B
REM  				AB -> B, AC -> B, AD -> B, ABC -> B, 
REM  				ABD ->B, ACD -> B, ABCD -> B.

select A, ' ->  ', B from R1 order by 1;
 
 REM                     usa la TABLA TEMP_DF 
 rem para las dependencias funcionales de mas de un atributo del lado izquierdo 
 rem utilizare tablas temporales.
 
 REM    OBTIENE LA DF    AB -> B
 
 drop table TEMP_DF2;
 CREATE  TABLE TEMP_DF2 
	(DF_I VARCHAR2(15),
	 DF_D VARCHAR2(15));

	 
	 
 INSERT INTO TEMP_DF2 (DF_I, DF_D)
	SELECT CONCAT(CONCAT(A,' , '), B), B FROM R1;
----------------------------------------------------------------------------------------------------------

 
----------------------------------------------------------------------------------------------------------
PROMPT      despliega la               DF  AB -> B
set colsep '|   ->   |'
SELECT * FROM TEMP_DF order by 1;
/

REM    OBTIENE LA DF    AC -> B
 
 drop table TEMP_DF3;
 CREATE  TABLE TEMP_DF3 
	(DF_I VARCHAR2(15),
	 DF_D VARCHAR2(15));
	 
 INSERT INTO TEMP_DF3 (DF_I, DF_D)
	SELECT CONCAT(CONCAT(A,' , '), C), B FROM R1;
	
PROMPT      despliega la               DF  AC -> B
set colsep '|   ->   |'
SELECT * FROM TEMP_DF3 order by 1;
/
REM    OBTIENE LA DF    AD -> B
 
 drop table TEMP_DF4;
 CREATE  TABLE TEMP_DF4 
	(DF_I VARCHAR2(15),
	 DF_D VARCHAR2(15));
	 
 INSERT INTO TEMP_DF4 (DF_I, DF_D)
	SELECT CONCAT(CONCAT(A,' , '), D), B FROM R1;
	
PROMPT      despliega la               DF  AD -> B
set colsep '|   ->   |'
SELECT * FROM TEMP_DF4 order by 1;

REM    OBTIENE LA DF    AD -> B
 drop table TEMP_DF5;
 CREATE  TABLE TEMP_DF5 
	(DF_I VARCHAR2(15),
	 DF_D VARCHAR2(15));
	 
 INSERT INTO TEMP_DF5 (DF_I, DF_D)
	SELECT CONCAT(CONCAT(A,' , '), D), B FROM R1;
	
PROMPT      despliega la               DF  AD -> B

SELECT * FROM TEMP_DF5 order by 1;

/

REM    OBTIENE LA DF    ABC -> B
 
 drop table TEMP_DF6;
 CREATE  TABLE TEMP_DF6 
	(DF_I VARCHAR2(15),
	 DF_D VARCHAR2(15));
	 
 INSERT INTO TEMP_DF6 (DF_I, DF_D)
	SELECT CONCAT (CONCAT(CONCAT(CONCAT(A,','),B),','),C), B FROM R1;
	
PROMPT      despliega la               DF  ABC -> B

SELECT * FROM TEMP_DF6  order by 1; 

REM    OBTIENE LA DF    ABD -> B
 
 drop table TEMP_DF7;
 CREATE  TABLE TEMP_DF7 
	(DF_I VARCHAR2(15),
	 DF_D VARCHAR2(15));
	 
 INSERT INTO TEMP_DF7 (DF_I, DF_D)
	SELECT CONCAT (CONCAT(CONCAT(CONCAT(A,','),B),','),D), B FROM R1;
	
PROMPT      despliega la               DF  ABD -> B

SELECT * FROM TEMP_DF7  order by 1;
/
REM    OBTIENE LA DF    ACD -> B
 
 drop table TEMP_DF8;
 CREATE  TABLE TEMP_DF8 
	(DF_I VARCHAR2(15),
	 DF_D VARCHAR2(15));
	 
 INSERT INTO TEMP_DF8 (DF_I, DF_D)
	SELECT CONCAT (CONCAT(CONCAT(CONCAT(A,','),C),','),D), B FROM R1;
	
PROMPT      despliega la               DF  ACD -> B

SELECT * FROM TEMP_DF8 order by 1;
/

REM    OBTIENE LA DF    ABCD -> B
 
 drop table TEMP_DF9;
 CREATE  TABLE TEMP_DF9 
	(DF_I VARCHAR2(15),
	 DF_D VARCHAR2(15));
	 
 INSERT INTO TEMP_DF9 (DF_I, DF_D)
	SELECT CONCAT (
	       CONCAT (
		   CONCAT ( 
		   CONCAT (
		   CONCAT ( 
		   CONCAT (A,',')
		                ,B),','),C),','),D), B 
		FROM R1;
	
PROMPT      despliega la               DF  ABCD -> B

SELECT * FROM TEMP_DF9 order by 1;
rem                                Resumen 
rem 

set colsep '| = |'
select '  ',a,b,c,b                  from R1   order by 1;
select '  ' ,A, ' ->  ', B from R1  order by 1;
set colsep '|   ->   |'
SELECT DF_I,DF_D FROM TEMP_DF2 order by 1;
SELECT DF_I,DF_D FROM TEMP_DF3 order by 1;
SELECT DF_I,DF_D FROM TEMP_DF4 order by 1;
SELECT DF_I,DF_D FROM TEMP_DF5 order by 1;
SELECT DF_I,DF_D FROM TEMP_DF6 order by 1;
SELECT DF_I,DF_D FROM TEMP_DF7 order by 1;
SELECT DF_I,DF_D FROM TEMP_DF8 order by 1;
SELECT DF_I,DF_D FROM TEMP_DF9 order by 1;
SELECT DF_I,DF_D FROM TEMP_DF9 order by 1;
spool off
