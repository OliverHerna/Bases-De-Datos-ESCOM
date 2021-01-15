/*Conjunto de operaciones que se ejecutan cuando se lleva a cabo un evento
usr/psw trig1
Programming oracle triggers and stored procedures pdf Capitulo 6
Oracle PL/SQL CAP 9
*/

set feedback off
set pagesize 99
set linesize 130
set colsep '|=|'


set serveroutput on

drop table temp;
--SE EJECUTA CUANDO EN LA TABLA TEMPORAL SE LLEVE UNA ACCION
CREATE TABLE temp (N NUMBER);
--a after, i insert, r row
CREATE OR REPLACE TRIGGER temp_air
   AFTER INSERT ON TEMP
   FOR EACH ROW
   BEGIN
   dbms_output.put_line('         H O L A   ESCOM');
   dbms_output.put_line('executing temp_air');
   dbms_output.put_line
		('Estoy en clase Remota de ESCOM------------');
  END;
-- "." + enter
-- / o show error

--Incersiones de la TABLA
INSERT INTO temp VALUES (10);
INSERT INTO temp VALUES (20);
INSERT INTO temp VALUES (30);
INSERT INTO temp VALUES (40);
INSERT INTO temp VALUES (50);
INSERT INTO temp VALUES (60);
INSERT INTO temp VALUES (70);

--Buscamos en el diccionario de datos
desc user_triggers


col trigger_name format a13
col trigger_type format a20
col triggering_event format A10
col table_owner format A10
col status format A10

select trigger_name,trigger_type,triggering_event,
	table_owner,status
	from user_triggers;

--Desabilitar Trigger
alter trigger 	temp_air DISABLE;

alter trigger 	temp_air ENABLE;
