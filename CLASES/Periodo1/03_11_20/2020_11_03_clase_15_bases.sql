regla 2.1 si en una interrealción binaria
las dos entidades participan en forma completa
es decir ambas entidades participan con cardinalidad
minima y maxima igual a uno.
----si  las dos entidades tienen el mismo identificador
----las dos entidades se tranforman en una sola tabla
----con la agregaciónde todos los atributos
----la clave de la tabla es el identificador de las dos
---- que es la misma llave.

----Entidad Débil por identificación, no existiran datos
----personales de los empleados ni se podran identificar
----si no existe un empleado.
---- en este caso es mas conveniente la existencia de tablas
---- independientes para cada entidad
----- nif sera llave primaria de empleado
----- nif sera llave primaria de datos empleado
------datos_empleado.nif sera llave foranea que hace
------referencia a datos_empleado.nif.

drop table empleado;
create table empleado(
	nif number(3),
	nombre varchar2(11),
	apellido varchar2(11),
	nivel number(3),
	ocupacion varchar2(10),
	primary key (nif));

drop table datos_empleado;
create table datos_empleado(
	nif number(3),
	direccion varchar2(13),
	nacimiento date,
	hobbie_princ varchar2(10),
	primary key (nif),
	foreign key (nif) references empleado (nif));

INSERT INTO EMPLEADO VALUES(10,'Roberto','Gonzalez',1,'CHOFER');
INSERT INTO EMPLEADO VALUES(20,'Ricardo','Gomez',1,'Repartidor');
INSERT INTO EMPLEADO VALUES(30,'Raúl','Gonzaga',1,'Contador');
INSERT INTO EMPLEADO VALUES(40,'Rosita','Guillen',1,'Cajero');
INSERT INTO EMPLEADO VALUES(50,'Renata','Guerra',1,'Auditor');
INSERT INTO EMPLEADO VALUES(60,'Romina','Granados',1,'Contador');


INSERT INTO datos_EMPLEADO VALUES(10,'Montevideo 10',to_date('10/02/2000','DD/MM/YYYY'),'fuTbol');
INSERT INTO datos_EMPLEADO VALUES(20,'Av toluca 25',to_date('08/06/2001','DD/MM/YYYY'),'beisbol');
INSERT INTO datos_EMPLEADO VALUES(30,'Bucareli 34',to_date('17/05/2002','DD/MM/YYYY'),'tenis');
INSERT INTO datos_EMPLEADO VALUES(40,'Rio Atoyac 28',to_date('10/07/2003','DD/MM/YYYY'),'futbol');
INSERT INTO datos_EMPLEADO VALUES(50,'Mar Muerto 85',to_date('29/07/2006','DD/MM/YYYY'),'Tenis');

select * from empleado;
select * from datos_empleado;
select * from empleado natural join datos_empleado;
select * from empleado natural left join datos_empleado;
select nif, nombre, apellido, ocupacion from empleado natural join datos_empleado;
