/*
Los coordinadores solo pueden coordinar una asignatura
y las asignaturas solo pueden tener un coordinador
cualquier coordinador puede coordinar asignaturas
a ningun coordinador se le permite coordinar 
varias asignaturas simultaneamente
cualquier asignatura puede tener coordinador
ninguna asignatura tendra varios coordiandores simultaneamente

la cardinalidad mínima para la relacion coordina es 1
la cardinalidad máxima para la relacion coordina es 1

la cardinalidad máxima de coordinador respecto para la relacion coordina es 1
la cardinalidad máxima para la relacion coordina es 1
 
*/
drop table coordinador cascade constraints;
create table coordinador(
	coord_id number (3),
	nombre varchar2(10),
	primary key (coord_id));
	
drop table asignatura;
create table asignatura(
	asignatura_id number (3),
	nombre_asig varchar2(10) not null,
	coord_id number (3),
	unique (nombre_asig),
	primary key (asignatura_id),
	foreign key(coord_id)
		references coordinador (coord_id),	
		unique (coord_id));
		
insert into coordinador values (10,'Roberto');
insert into coordinador values (20,'Raúl');
insert into coordinador values (30,'Rosita');
insert into coordinador values (40,'Rodrigo');
insert into coordinador values (50,'Rigoberto');
insert into coordinador values (60,'Rómulo');
insert into coordinador values (70,'Remigio');

insert into asignatura values (100,'BDD',10);
insert into asignatura values (200,'WEB',20);
insert into asignatura values (300,'FISICA',30);
insert into asignatura values (400,'ALGEBRA',40);
insert into asignatura values (500,'REDES',50);
insert into asignatura values (600,'SIS OPER',60);

SELECT * FROM COORDINADOR;
SELECT * FROM ASIGNATURA;

SELECT COORD_ID, NOMBRE, ASIGNATURA_ID, NOMBRE_ASIG
	FROM COORDINADOR NATURAL JOIN ASIGNATURA;
	
SELECT COORD_ID, NOMBRE, ASIGNATURA_ID, NOMBRE_ASIG
	FROM COORDINADOR NATURAL left JOIN ASIGNATURA;
	
SELECT COORD_ID, NOMBRE, ASIGNATURA_ID, NOMBRE_ASIG
	FROM COORDINADOR NATURAL right JOIN ASIGNATURA;
	
	
rem intentemos asignar coordinador dos veces	
insert into asignatura values (200,'WEB',20);

rem intentemos asignar una materia a dos coordinadores
insert into asignatura values (200,'WEB',10);

rem intentemos insertar una asignatura 
rem con nombre web aun con otro numero de asignatura
insert into asignatura values (700,'WEB',null);

rem insermos un nuevo profesor coordinador
insert into coordinador values (80,'Ricardo');
insert into coordinador values (90,'Rolando');

SELECT * FROM COORDINADOR;
SELECT * FROM ASIGNATURA;

SELECT COORD_ID, NOMBRE, ASIGNATURA_ID, NOMBRE_ASIG
	FROM COORDINADOR NATURAL JOIN ASIGNATURA;
	
SELECT COORD_ID, NOMBRE, ASIGNATURA_ID, NOMBRE_ASIG
	FROM COORDINADOR NATURAL left JOIN ASIGNATURA;
	
	