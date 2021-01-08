rem uniUsr

spool C:\Users\ORA_bases\university.txt
REM ESQUEMA RELACIONAL FIG 8.7
REM CON UNA RED DE ESPECIALIZACIÓN CON MULTIPLES
REM HERENCIA PARA EL ESQUEMA DE BASES DE DATOS
REM DE UNA CASO UNIVERSIDAD
REM FUENTE: CAP 8
REM THE ENHANCED ENTITY-RELATIONSHIP
REM (EER) MODEL. PAG 255
REM FUNDAMENTALS OF DATABASE SYSTEMS
REM ELMASRI & NAVATHE 6a. Ed.


set pagesize 100
set linesize 130
set colsep '|=|'
set underline '='
SET NULL 'Sin Datos'

drop table person  cascade constraints;
create table person (
	ID_PERSON number (3) 		  not null,
	nombre varchar2(10)  		  not null,
	fecha_nac date,
	genero char(1)       		  not null,
	direcc varchar2(14)  		  not null);

drop table employee  cascade constraints;
create table employee (
	id_person number(3)           not null,
	salario number(7,2)           not null,
	tipo_emp CHAR(1)            not null,
	posision_adva number(2),
	categoria_prof number(1),
	xcen_tiempo_estud_ss number (4,2) not null,
	bandera_asist_investig char   not null,
	bandera_asist_profesor char   not null,
	proyecto varchar2(10),
	curso varchar2(10));

drop table alumnus  cascade constraints;
create table alumnus(
	id_person number(3)           not null);

REM
drop table alumnus_con_grado  cascade constraints;
create table alumnus_con_grado(
	id_person number(3)           	not null,
	year_grado number(4)          	not null,
	grado  varchar2(10)           	not null,
	area_grado varchar2(9)        	not null);

drop table student  cascade constraints;
create table student(
	id_person number(3)          		not null,
	area_concent varchar2(10)    		not null,
	bandera_grado char            		not null,
	bandera_carrera char          		not null,
	program_posgrado varchar2(10),
	carrera_licenciatura varchar2(10),
	bandera_estud_asistente char        not null);
--
REM PRIMERO DECLARAMOS LAS LLAVES PRIMARIAS Y FORANEAS
REM

alter table PERSON
	ADD CONSTRAINT PERSON_PK
		primary key (id_PERSON);

--
alter table employee
	ADD CONSTRAINT employee_PK
		primary key (id_PERSON);
alter table employee
	ADD CONSTRAINT employee_person_FK
		foreign key (id_person)
		references person(id_person)
		INITIALLy DEFERRED deferrable;
--
alter table alumnus
	ADD CONSTRAINT alumnus_PK
		primary key (id_PERSON);
alter table alumnus
	ADD CONSTRAINT alumnus_person_FK
		foreign key (id_person)
		references person(id_person)
		INITIALLy DEFERRED deferrable;
--
alter table alumnus_con_grado
	ADD CONSTRAINT alumnus_con_grado_PK
		primary key (id_PERSON);
alter table alumnus_con_grado
	ADD CONSTRAINT alumnus_con_grado_alumnus_FK
		foreign key (id_person)
		references alumnus(id_person)
		INITIALLy DEFERRED deferrable;
---
alter table student
	ADD CONSTRAINT student_PK
		primary key (id_PERSON);
alter table student
	ADD CONSTRAINT student_person_FK
		foreign key (id_person)
		references person(id_person)
		INITIALLy DEFERRED deferrable;
--
REM DECLARAMOS LAS RESTRICCIONES TIPO CKECK
alter table person
	add constraint genero_ck
		check(genero = 'M' or genero = 'F');

alter table person
	add constraint fecha_nac_ck
		check (fecha_nac > to_date('12/08/1968','DD/MM/YYYY')
		   and fecha_nac < to_date('31/12/2000','DD/MM/YYYY'));

--
alter table EMPLOYEE
	add constraint SALARIO_ck
		check(SALARIO <= 50000);

alter table EMPLOYEE
	add constraint TIPO_EMP_ck
		check(TIPO_EMP IN ('E','A','S'));

alter table EMPLOYEE
	add constraint POSISION_ADVA_ck
		check(POSISION_ADVA IN (1,2,3));

alter table EMPLOYEE
	add constraint CATEGORIA_PROF_ck
		check(CATEGORIA_PROF IN (1,2,3));

alter table EMPLOYEE
	add constraint bandera_asist_investig_CK
		check(bandera_asist_investig IN ('V','F'));

alter table EMPLOYEE
	add constraint bandera_asist_profesor_ck
		check(bandera_asist_profesor IN ('V','F'));
--
alter table alumnus_con_grado
	add constraint YEAR_GRADO_ck
		check(YEAR_GRADO >= 2000));

alter table alumnus_con_grado
	add constraint GRADO_ck
		check(GRADO IN ('MAESTRIA','DOCTOR'));

alter table alumnus_con_grado
	add constraint AREA_GRADO_ck
		check(AREA_GRADO IN ('Ciencias','Filoso','Admon'));
--
alter table student
	add constraint area_concent_ck
		check(area_concent IN ('Ciencias','Derecho','Filoso'));

alter table student
	add constraint bandera_grado_ck
		check(bandera_grado IN ('V','F',null));

alter table student
	add constraint bandera_carrera_ck
		check(bandera_carrera IN ('V','F',null));

alter table student
	add constraint program_posgrado_ck
		check(program_posgrado IN ('MAESTRIA','DOCTOR'));

alter table student
	add constraint carrera_licenciatura_ck
		check(carrera_licenciatura IN ('ISC','ICE','IME','ARQ'));

alter table student
	add constraint bandera_estud_asistente_ck
		check(bandera_estud_asistente IN ('V','F',null));


--                                      TO_DATE('10/02/20','DD/MM/RR')
insert into person values(100,'Raúl'   , to_date('16/08/1968','DD/MM/YYYY'),'M','Florida 10'  );
insert into person values(101,'Rosa'   , to_date('12/10/1969','DD/MM/YYYY'),'F','Francia 20'  );
insert into person values(110,'Ricardo', to_date('12/04/1972','DD/MM/YYYY'),'M','Florida 12'  );
insert into person values(120,'Roberto', to_date('12/03/1966','DD/MM/YYYY'),'M','Filadelfia 1');
insert into person values(130,'Rómulo' , to_date('12/07/1962','DD/MM/YYYY'),'M','Roma 21'     );
insert into person values(140,'Rosalba', to_date('12/11/1977','DD/MM/YYYY'),'F','Berlín 9'    );
insert into person values(400,'Rita'   , to_date('12/12/1974','DD/MM/YYYY'),'F','Bulgaria 18' );
insert into person values(410,'Ricardo', to_date('12/02/1973','DD/MM/YYYY'),'M','Belgica 1119'  );
insert into person values(420,'Rolando', to_date('12/02/1973','DD/MM/YYYY'),'M','Belgica 85'  );
insert into person values(430,'Abugail', to_date('12/02/1973','DD/MM/YYYY'),'M','Belgica 09'  );
insert into person values(440,'Adela', to_date('12/02/1973','DD/MM/YYYY'),'M','Belgica 921'  );
insert into person values(700,'Adelaida', to_date('12/02/1973','DD/MM/YYYY'),'M','Belgica 961'  );
insert into person values(710,'Adoración', to_date('12/02/1973','DD/MM/YYYY'),'M','Belgica 982'  );
insert into person values(720,'Adriana', to_date('12/02/1973','DD/MM/YYYY'),'M','Belgica 8'  );
insert into person values(730,'Adriana', to_date('12/02/1973','DD/MM/YYYY'),'M','Belgica 114'  );
insert into person values(740,'Amparo', to_date('12/02/1973','DD/MM/YYYY'),'M','Belgica 111'  );
insert into person values(742,'Ana', to_date('12/02/1973','DD/MM/YYYY'),'M','Belgica 888'  );
insert into person values(745,'Angela', to_date('12/02/1973','DD/MM/YYYY'),'M','Belgica 700'  );
insert into person values(750,'Araceli', to_date('12/02/1973','DD/MM/YYYY'),'M','Belgica 99'  );
insert into person values(760,'Aurora', to_date('12/02/1973','DD/MM/YYYY'),'M','Belgica 95'  );
insert into person values(770,'Beatriz', to_date('12/02/1973','DD/MM/YYYY'),'M','Belgica 47'  );
insert into person values(780,'Belén', to_date('12/02/1973','DD/MM/YYYY'),'M','Belgica 39'  );
insert into person values(800,'Belinda', to_date('12/02/1973','DD/MM/YYYY'),'M','Belgica 40'  );
insert into person values(810,'Denise', to_date('12/02/1973','DD/MM/YYYY'),'M','Belgica 50'  );
insert into person values(820,'Carmen', to_date('12/02/1973','DD/MM/YYYY'),'M','Belgica 29'  );
insert into person values(830,'Dolores', to_date('12/02/1973','DD/MM/YYYY'),'M','Belgica 818'  );
insert into person values(840,'Elsa', to_date('12/02/1973','DD/MM/YYYY'),'M','Belgica 16'  );
insert into person values(850,'Erika', to_date('12/02/1973','DD/MM/YYYY'),'M','Belgica 12'  );
insert into person values(910,'Esperanza', to_date('12/02/1973','DD/MM/YYYY'),'M','Belgica 21'  );
insert into person values(920,'Ester', to_date('12/02/1973','DD/MM/YYYY'),'M','Belgica 115'  );
insert into person values(930,'Fatima', to_date('12/02/1973','DD/MM/YYYY'),'M','Belgica 5'  );
insert into person values(940,'Fanny', to_date('12/02/1973','DD/MM/YYYY'),'M','Belgica 8'  );
insert into person values(102,'Alan', to_date('12/02/1973','DD/MM/YYYY'),'M','av IPN 85'  );
insert into person values(103,'Alexis', to_date('12/02/1973','DD/MM/YYYY'),'M','Universidad 85'  );
insert into person values(194,'Alonso', to_date('12/02/1973','DD/MM/YYYY'),'M','Xalapa 85'  );
insert into person values(104,'Agustín', to_date('12/02/1973','DD/MM/YYYY'),'M','Pachuca 85'  );
insert into person values(920,'Antonio', to_date('12/02/1973','DD/MM/YYYY'),'M','Paris 85'  );
insert into person values(825,'Andrés', to_date('12/02/1973','DD/MM/YYYY'),'M','Mazatlán 85'  );

----------------------------(id--salar,tpo,pos,rango,%,b_R,b_T,proy,curso
----------------------------empdo adva cat-proftiempo Resercn Tutor
insert into employee values(100,10000,'S',1,Null,0,'F','F',null,null);
insert into employee values(100,12000,'S',2,Null,0,'F','F',null,null);
insert into employee values(120,13000,'S',3,Null,0,'F','F',null,null);
insert into employee values(130,13000,'S',3,Null,0,'F','F',null,null);
insert into employee values(140,13000,'S',3,Null,0,'F','F',null,null);

insert into employee values(400,11000,'F',Null,1,0,'F','F',null,null);
insert into employee values(410,15000,'F',Null,2,0,'F','F',null,null);
insert into employee values(420,17000,'F',Null,3,0,'F','F',null,null);
insert into employee values(430,17000,'F',Null,3,0,'F','F',null,null);
insert into employee values(440,17000,'F',Null,3,0,'F','F',null,null);

insert into employee values(700,20000,'A',Null,Null,.2,'V','F','PR Alfa' ,null);
insert into employee values(710,20000,'A',Null,Null,.2,'V','F','PR Beta' ,null);
insert into employee values(720,20000,'A',Null,Null,.2,'V','F','PR Alfa' ,null);
insert into employee values(730,20000,'A',Null,Null,.2,'V','F','PR Beta' ,null);
insert into employee values(740,20000,'A',Null,Null,.2,'V','F','PR Alfa' ,null);
insert into employee values(742,20000,'A',Null,Null,.2,'V','F','PR Delta',null);
insert into employee values(745,19000,'A',Null,Null,.4,'V','F','PR Alfa' ,null);

insert into employee values(750,20000,'A',Null,Null,.2,'F','V',null,'Bases');
insert into employee values(760,20000,'A',Null,Null,.2,'F','V',null,'Redes');
insert into employee values(770,20000,'A',Null,Null,.2,'F','V',null,'Bases');
insert into employee values(780,20000,'A',Null,Null,.2,'F','V',null,'Prog');

insert into employee values(800,19000,'A',Null,Null,.4,'V','F','PR Alfa',null);
insert into employee values(810,19000,'A',Null,Null,.4,'V','F','PR Beta',null);
insert into employee values(820,19000,'A',Null,Null,.4,'V','F','PR Gama',null);
insert into employee values(830,19000,'A',Null,Null,.4,'V','F',null,'Bases');
insert into employee values(840,19000,'A',Null,Null,.4,'V','F',null,'Bases');
insert into employee values(850,19000,'A',Null,Null,.4,'V','F',null,'Bases');

insert into employee values(910,19000,'A',Null,Null,.4,'V','F',null,'Redes');
insert into employee values(920,19000,'A',Null,Null,.4,'V','F',null,'Prog');
insert into employee values(930,19000,'A',Null,Null,.4,'V','F',null,'Redes');
insert into employee values(940,19000,'A',Null,Null,.4,'V','F',null,'Prog');

insert into alumnus values (800);
insert into alumnus values (910);
insert into alumnus values (920);
insert into alumnus values (930);

insert into alumnus_con_grado values (800,2010,'Maestria','Ciencias'  );
insert into alumnus_con_grado values (810,2012,'Maestria','Admon'     );
insert into alumnus_con_grado values (820,2013,'Doctor'  ,'Ciencias'  );
insert into alumnus_con_grado values (840,2014,'Doctor'  ,'Filoso'    );

insert into student values (800,'Ciencias','V','F','Maestria',null ,'V');
insert into student values (810,'Ciencias','V','F','Maestria',null ,'V');
insert into student values (820,'Derecho' ,'V','F','Maestria',null ,'V');
insert into student values (830,'Ciencias','V','F','Doctor'  ,null ,'V');
insert into student values (840,'Filoso'  ,'V','F','Doctor'  ,null ,'V');
insert into student values (850,'Ciencias','V','F','Doctor'  ,null ,'V');

insert into student values (910,'Ciencias','F','V',null      ,'ISC','V');
insert into student values (920,'Ciencias','F','V',null      ,'ICE','V');
insert into student values (930,'Ciencias','F','V',null      ,'IME','V');
insert into student values (940,'Ciencias','F','V',null      ,'ARQ','V');

select * from person;
select * from employee;
select * from alumnus;
select * from student;
select * from alumnus_con_grado;


alter table person
	add constraint genero_ck check(genero = 'M' or genero = 'F');

REM
---------------------------------------------
REM
REM CONSULTAS
REM
COL SALARIO FORMAT $999,999.00
COL XCEN FORMAT  90.9
COL POSI FORMAT A15
select id_person,salario,
		TIPO_EMP,
		NVL(TO_CHAR(POSISION_ADVA),'no hay valor') POSI,
		NVL(TO_CHAR(CATEGORIA_PROF),'Sin Categoria') POSI,
		XCEN_TIEMPO_ESTUD_SS XCEN
FROM EMPLOYEE;


SELECT id_person "Alumnos"
from alumnus;

COL BAND_GRA FORMAT A10
COL BAND_EST FORMAT A10
select id_person ESTUDIANTE,
	area_concent AREA,
	bandera_grado BAND_GRA,
	program_posgrado POSGRADO,
	carrera_licenciatura LIC,
	bandera_estud_asistente BAND_EST
from student;

SELECT id_person ALUMNO,
	YEAR_GRADO GENERACION,
	GRADO,
	AREA_GRADO
FROM alumnus_con_grado;



spool off
