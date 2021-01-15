set linesize 130
set pagesize 90
set serveroutput on
set feddback on
set colsep ' ||'
clear screen

drop table alumno;

rem CREA TABLA ALUMNO
rem En Oracle se recomienda usar varchar2, number, timestamp, date
create table alumno(
  matricula number(10) unique,
  nombre varchar2(12) not null,
  apellido varchar2(12) not null,
  materia number(3) not null,
  fecha_nac date
);

rem DECLARA SEQUENCE | AUTOINCREMENTE

drop sequence matricula_sec;

CREATE SEQUENCE matricula_sec
  INCREMENT BY 1
  START WITH 2020630000
  NOMAXVALUE
  MINVALUE 1
  NOCYCLE
  NOCACHE;

SELECT
  MATRICULA_SEC.NEXTVAL
FROM
  dual;
