set linesize 130
set pagesize 90
set feddback on
set colsep ' ||'
clear screen 
drop table alumno;
create table alumno(
matricula number(5) unique,
nombre  varchar2(12) not null,
apellido varchar2(12) not null,
materia number(3) not null,
fecha_nac date);


rem declara sequence 
drop sequence matricula_sec;

CREATE SEQUENCE MATRICULA_SEC
 INCREMENT BY 1
 START WITH 10001
 NOMAXVALUE
 MINVALUE 1
 NOCYCLE
 NOCACHE;
 
 SELECT 
    MATRICULA_SEC.NEXTVAL 
FROM 
    dual;


REM CREA INDICE 
drop index alumno_nombre_Index;
CREATE INDEX alumno_nombre_Index ON alumno(nombre);
col index_name format a28
col index_type format a12
col table_name format a12
col blevel format 999
col leaf_blocks format 999
select index_name,index_type,table_name, Blevel, leaf_blocks
	from user_indexes;

 

insert into alumno (matricula,nombre, apellido, materia,fecha_nac) 
			values (MATRICULA_SEC.NEXTVAL
					, dbms_random.string('U', 1)||dbms_random.string('L', 10)
					, dbms_random.string('U', 1)||dbms_random.string('L', 10)
					,ROUND(DBMS_RANDOM.VALUE(101,150)) 
					,TO_DATE(TRUNC(DBMS_RANDOM.VALUE(2451545,2454005)),'J')
					);
					
select  matricula,nombre, apellido, materia,fecha_nac from alumno;
	

	
DECLARE
v_num_iteraciones number (5)  := 0;
BEGIN
LOOP
-- increment variable de control  by one
v_num_iteraciones := v_num_iteraciones + 1;
insert into alumno (matricula,nombre, apellido, materia,fecha_nac) 
			values (MATRICULA_SEC.NEXTVAL
					, dbms_random.string('U', 1)||dbms_random.string('L', 10)
					, dbms_random.string('U', 1)||dbms_random.string('L', 10)
					,ROUND(DBMS_RANDOM.VALUE(101,150)) 
					,TO_DATE(TRUNC(DBMS_RANDOM.VALUE(2451545,2454005)),'J')
					);
-- if number of sections added
EXIT WHEN v_num_iteraciones >= 100;
END LOOP;
-- control resumes here
END;
COMMIT;
REM 
REM OPCION DOS UN PROCEDIMIENTO ALMACENADO
REM

CREATE OR REPLACE PROCEDURE PUEBLA_TAB_ALUMNO IS
v_num_iteraciones number (5)  := 0;
BEGIN
LOOP
-- increment variable de control  by one
v_num_iteraciones := v_num_iteraciones + 1;
insert into alumno (matricula,nombre, apellido, materia,fecha_nac) 
			values (MATRICULA_SEC.NEXTVAL
					, dbms_random.string('U', 1)||dbms_random.string('L', 10)
					, dbms_random.string('U', 1)||dbms_random.string('L', 10)
					,ROUND(DBMS_RANDOM.VALUE(101,150)) 
					,TO_DATE(TRUNC(DBMS_RANDOM.VALUE(2451545,2454005)),'J')
					);
-- if number of sections added
EXIT WHEN v_num_iteraciones >= 100;
END LOOP;
-- control resumes here
END PUEBLA_TAB_ALUMNO;

REM OPCION TRES
REM PROCEDIMIENTO ALMACENADO CON PARAMETROS

REM 
REM OPCION DOS UN PROCEDIMIENTO ALMACENADO
REM
set serveroutput on 
rem 
rem importante para poder ver los desplegado en la consola
rem los printf
rem
CREATE OR REPLACE PROCEDURE PUEBLA_TAB_ALUMNO_3
(LIMITE IN NUMBER  )
 IS
v_num_iteraciones number (5)  := 0; 
BEGIN
LOOP
-- increment variable de control  by one
v_num_iteraciones := v_num_iteraciones + 1;
insert into alumno (matricula,nombre, apellido, materia,fecha_nac) 
			values (MATRICULA_SEC.NEXTVAL
					, dbms_random.string('U', 1)||dbms_random.string('L', 10)
					, dbms_random.string('U', 1)||dbms_random.string('L', 10)
					,ROUND(DBMS_RANDOM.VALUE(101,150)) 
					,TO_DATE(TRUNC(DBMS_RANDOM.VALUE(2451545,2454005)),'J')
					);
-- if number of sections added
EXIT WHEN v_num_iteraciones >= LIMITE;
END LOOP;
dbMS_OUTPUT.PUT_LINE('Se incertaron ......'||limite||'  Tuplas');
END PUEBLA_TAB_ALUMNO_3;

rem 
rem busca un alumno por matricula
rem
select matricula,nombre,apellido from alumno where matricula = 10800;
rem busca un alumno por nombre 
rem
select matricula,nombre,apellido from alumno where nombre = 'Ccqlettvkpo';
rem
rem
select matricula,nombre,apellido from alumno where apellido = 'Qvrkodxkeby';


EXPLAIN PLAN FOR
select matricula,nombre,apellido from alumno where matricula = 10800;

select plan_table_output from table(dbms_xplan.display('plan_table',null,'serial'));

EXPLAIN PLAN FOR
select matricula,nombre,apellido from alumno where nombre = 'Ccqlettvkpo';

select plan_table_output from table(dbms_xplan.display('plan_table',null,'serial'));

EXPLAIN PLAN FOR
select matricula,nombre,apellido from alumno where apellido = 'Qvrkodxkeby';

select plan_table_output from table(dbms_xplan.display('plan_table',null,'serial'));
rem despliega lops ROWID de las tuplas localizadas
rem

select rowid,matricula,nombre,apellido from alumno where matricula = 10800;
rem busca un alumno por nombre 
rem
select rowid,matricula,nombre,apellido from alumno where nombre = 'Ccqlettvkpo';
rem
rem
select rowid,matricula,nombre,apellido from alumno where apellido = 'Qvrkodxkeby';