/*
regla 2_3 si en un tipode  interrrelacion binaria amabas entidades
particcipan de forma parcial, se construye una nueva tabla de la 
interrelacion cuyos atributos seran las llaves de las dos entidades 
las cuales seran definidos como llaves foraneas 
La clave principal de la tabla genearada sera la llave de una 
de las entidades y necesariamente se definira como clave alterna al 
identificador de la otra entidad.
ejercicio pag 130 
*/
----PRIMERA PARTE 
-----
-----
drop table empleado cascade constraints;
create table empleado(
	nif number(3),
	nombre varchar2(11),
	apellido varchar2(11),
	nivel number(3),
	ocupacion varchar2(10),
	primary key (nif));
	
drop table Electrodomestico;
create table Electrodomestico(
	aparato NUMBER(3),
	marca   varchar2(10),
	modelo  varchar2(17),
		primary key (aparato)
		);
drop table emp_elec;	
create table Emp_Elec (	
	nif number(3),
	aparato NUMBER(3),
	ultima_fecha date,
	primary key (aparato),
	foreign key (nif) references empleado (nif),
	foreign key (aparato) references electrodomestico (aparato)
	);

INSERT INTO EMPLEADO VALUES(10,'Roberto','Gonzalez',1,'CHOFER');
INSERT INTO EMPLEADO VALUES(20,'Ricardo','Gomez',1,'Repartidor');
INSERT INTO EMPLEADO VALUES(30,'Raúl','Gonzaga',1,'Contador');
INSERT INTO EMPLEADO VALUES(40,'Rosita','Guillen',1,'Cajero');
INSERT INTO EMPLEADO VALUES(50,'Renata','Guerra',1,'Auditor');
INSERT INTO EMPLEADO VALUES(60,'Romina','Granados',1,'Contador');

INSERT INTO ELECTRODOMESTICO VALUES(100,'Mabe','Refri 10 pies');
INSERT INTO ELECTRODOMESTICO VALUES(200,'Daewoo','Smart TV 30');
INSERT INTO ELECTRODOMESTICO VALUES(300,'Samsung','Lavadora 12');
INSERT INTO ELECTRODOMESTICO VALUES(400,'Whirpool','Lavadora 10');
INSERT INTO ELECTRODOMESTICO VALUES(500,'Hisense','Refri 15');
INSERT INTO ELECTRODOMESTICO VALUES(600,'LG','TV 50');
INSERT INTO ELECTRODOMESTICO VALUES(400,'Whirpool','Lavadora 10');

insert into 	Emp_Elec values(10,100,to_date('10/02/2020','DD/MM/YYYY'));
insert into 	Emp_Elec values(10,200,to_date('10/03/2020','DD/MM/YYYY'));
insert into 	Emp_Elec values(30,300,to_date('10/04/2020','DD/MM/YYYY'));
insert into 	Emp_Elec values(50,400,to_date('10/05/2020','DD/MM/YYYY'));
insert into 	Emp_Elec values(50,500,to_date('10/06/2020','DD/MM/YYYY'));
insert into 	Emp_Elec values(20,600,to_date('10/08/2020','DD/MM/YYYY'));

select * from empleado;
select * from electrodomestico;
select * from emp_elec;

prompt  resultados de acuerdo a la opcion dos
select em.nif, el.aparato,
		ultima_fecha,nombre, apellido,nivel,ocupacion,marca,modelo 
	from empleado     em,
	electrodomestico  el,
	emp_elec
	where   em.nif     = emp_elec.nif 
		and el.aparato = emp_elec.aparato;
		
prompt  
select em.nif, el.aparato,
		ultima_fecha,nombre, apellido,nivel,ocupacion,marca,modelo 
	from empleado     em,
	electrodomestico  el,
	emp_elec
	where   em.nif     = emp_elec.nif 
		and el.aparato = emp_elec.aparato (+);
		
prompt

select em.nif, el.aparato,
		ultima_fecha,nombre, apellido,nivel,ocupacion,marca,modelo 
	from empleado     em,
	electrodomestico  el,
	emp_elec
	where   em.nif     = emp_elec.nif (+)
		and el.aparato = emp_elec.aparato;
prompt  resultados de acuerdo a la opcion uno

select * from empleado natural join electrodomestico;

select * from empleado natural left join electrodomestico;

----SEGUNDA PARTE 
-----
-----
drop table empleado cascade constraints;
create table empleado(
	nif number(3),
	nombre varchar2(11),
	apellido varchar2(11),
	nivel number(3),
	ocupacion varchar2(10),
	primary key (nif));
	
drop table Electrodomestico cascade constraints;
create table Electrodomestico(
	aparato NUMBER(3),
	marca   varchar2(10),
	modelo  varchar2(17),
	nif     number(3),
	ultima_fecha date,
		primary key (aparato)
		);
INSERT INTO EMPLEADO VALUES(10,'Roberto','Gonzalez',1,'CHOFER');
INSERT INTO EMPLEADO VALUES(20,'Ricardo','Gomez',1,'Repartidor');
INSERT INTO EMPLEADO VALUES(30,'Raúl','Gonzaga',1,'Contador');
INSERT INTO EMPLEADO VALUES(40,'Rosita','Guillen',1,'Cajero');
INSERT INTO EMPLEADO VALUES(50,'Renata','Guerra',1,'Auditor');
INSERT INTO EMPLEADO VALUES(60,'Romina','Granados',1,'Contador');

INSERT INTO ELECTRODOMESTICO VALUES(100,'Mabe','Refri 10 pies',10,to_date('10/02/2020','DD/MM/YYYY') );
INSERT INTO ELECTRODOMESTICO VALUES(200,'Daewoo','Smart TV 30',10,to_date('10/03/2020','DD/MM/YYYY') );
INSERT INTO ELECTRODOMESTICO VALUES(300,'Samsung','Lavadora 12',30,to_date('10/04/2020','DD/MM/YYYY') );
INSERT INTO ELECTRODOMESTICO VALUES(400,'Whirpool','Lavadora 10',50,to_date('10/05/2020','DD/MM/YYYY') );
INSERT INTO ELECTRODOMESTICO VALUES(500,'Hisense','Refri 15'    ,50,to_date('10/06/2020','DD/MM/YYYY') );
INSERT INTO ELECTRODOMESTICO VALUES(600,'LG','TV 50'            ,20,to_date('10/08/2020','DD/MM/YYYY') );
INSERT INTO ELECTRODOMESTICO VALUES(400,'Whirpool','Lavadora 10',NULL,null );
	
select * from empleado natural join electrodomestico;

select * from empleado natural left join electrodomestico;
