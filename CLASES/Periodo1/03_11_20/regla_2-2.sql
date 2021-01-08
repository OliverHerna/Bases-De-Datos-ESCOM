/*
Si en un tipo de interrrealción binaria alguno de las entidades
participa de forma parcial entonces se procede de alguna 
de las sisguientes formas 

1.- la llave de la entidad que participa de forma total 
---  pasa como atributo de la otra entidad, el atributo sera definido
--- como llave alterna y foranea no pudiendo tomar valores nulos
--- y no se generara tabla de la interrelación.


2.- se construye una nueva tabla de la interrelación 
--- formada por los atributos llave de las dos entidades
--- Los atributos seran llaves foraneas de las tablas correspondientes
--- y seran definidos como llabes candidatas.
----
---pasar a partir de la linea 60


*/

drop table empleado;
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
	nif number(3),
		primary key (aparato),
		foreign key (nif) 
			references empleado (nif));
			
INSERT INTO EMPLEADO VALUES(10,'Roberto','Gonzalez',1,'CHOFER');
INSERT INTO EMPLEADO VALUES(20,'Ricardo','Gomez',1,'Repartidor');
INSERT INTO EMPLEADO VALUES(30,'Raúl','Gonzaga',1,'Contador');
INSERT INTO EMPLEADO VALUES(40,'Rosita','Guillen',1,'Cajero');
INSERT INTO EMPLEADO VALUES(50,'Renata','Guerra',1,'Auditor');
INSERT INTO EMPLEADO VALUES(60,'Romina','Granados',1,'Contador');

INSERT INTO ELECTRODOMESTICO VALUES(100,'Mabe','Refri 10 pies',10);
INSERT INTO ELECTRODOMESTICO VALUES(200,'Daewoo','Smart TV 30',10);
INSERT INTO ELECTRODOMESTICO VALUES(300,'Samsung','Lavadora 12',30);
INSERT INTO ELECTRODOMESTICO VALUES(400,'Whirpool','Lavadora 10',50);
INSERT INTO ELECTRODOMESTICO VALUES(500,'Hisense','Refri 15',50);
INSERT INTO ELECTRODOMESTICO VALUES(600,'LG','TV 50',20);
INSERT INTO ELECTRODOMESTICO VALUES(400,'Whirpool','Lavadora 10',70);

select * from empleado;
select * from electrodomestico;
select * from empleado natural join electrodomestico;
select * from empleado natural left join electrodomestico;

rem 
rem segunda parte 
rem 
/*
construiremos la tabla electrodomestico sin la llave foranea
que hace referencia a la tabla empleado
luego construiremos la tabla de la interrelación 
incluyendo las llaves primarias de empleado y electrodoméstico
indicando su referencia como llaves foraneas
*/
drop table Electrodomesticoprima;
create table Electrodomesticoprima as
select aparato, marca, modelo
from electrodomestico;
rem 

drop view Electrodomesticoprima2;
create view Electrodomesticoprima2 as
select aparato, marca, modelo
from electrodomestico;

INSERT INTO ELECTRODOMESTICOprima (aparato,marca,modelo)
	select aparato, marca, modelo
		from electrodomestico;	
select * from ELECTRODOMESTICOprima;

INSERT INTO ELECTRODOMESTICOprima2 (aparato,marca,modelo)
	select aparato, marca, modelo
		from electrodomestico;	
select * from ELECTRODOMESTICOprima2;
drop table Emp_Elec;
create table Emp_Elec (
	aparato NUMBER(3),
	nif number(3),
	primary key (aparato),
	foreign key (nif) references empleado (nif));
insert into 	Emp_Elec values(100,10);
insert into 	Emp_Elec values(200,10);
insert into 	Emp_Elec values(300,30);
insert into 	Emp_Elec values(400,50);
insert into 	Emp_Elec values(500,50);
insert into 	Emp_Elec values(600,20);
prompt  resultados de acuerdo a la opcion dos
select em.nif, el.aparato,nombre, apellido,nivel,ocupacion,marca,modelo 
from empleado em,electrodomesticoprima el,emp_elec
where em.nif=emp_elec.nif and el.aparato = emp_elec.aparato;

prompt  resultados de acuerdo a la opcion uno

select * from empleado natural join electrodomestico;

select * from empleado natural left join electrodomestico;
	