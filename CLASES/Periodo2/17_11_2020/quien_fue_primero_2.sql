rem En algunas veces es necesario diferir el chequeo de
rem ciertas restricciones por lo que si
rem se declaran como diferibles el DBMS Oracle
rem las verificará que se cumplan al realizar el
rem     COMMIT;
rem considere las siguientes tablas
rem estudielas con detenimiento y tome en cuenta
rem el orden y el momento en que se declararon

drop table huevo cascade constraints;
drop table gallina cascade constraints;
create table huevo(
	id_huevo number(3),
	nomb_huevo varchar2(10),
	ID_GALLINA NUMBER(3));

create table gallina(
	id_gallina number(3),
	nomb_gallina varchar2(10),
	id_huevo number (3));


insert into huevo VALUES (10,'blanco',100);
insert into huevo VALUES (20,'rojo',200);
insert into huevo VALUES (30,'amarillo',300);
insert into huevo VALUES (40,'azul',400);
insert into huevo VALUES (50,'verde',500);
insert into huevo VALUES (60,'rosa',600);

insert into gallina VALUES (100,'Americana',10);
insert into gallina VALUES (200,'china',10);
insert into gallina VALUES (300,'India',30);
insert into gallina VALUES (400,'Noruega',40);
insert into gallina VALUES (500,'Brasileña',50);
insert into gallina VALUES (600,'Turca',60);
alter table huevo
	ADD CONSTRAINT HUEVO_PK
		primary key (id_huevo);

alter table GALLINA
	ADD CONSTRAINT GALLINA_PK
		primary key (id_GALLINA);

alter table huevo
	ADD CONSTRAINT HUEVO_GALLINA_FK
		foreign key (id_gallina)
		references gallina(id_gallina)
		INITIALLy DEFERRED deferrable;

alter table GALLINA
	ADD CONSTRAINT GALLINA_HUEVO_FK
		foreign key (id_HUEVO)
		references HUEVO(id_HUEVO)
		INITIALLy DEFERRED deferrable;

		select * from huevo;
		select * from gallina;

commit;

select * from huevo;
select * from gallina;


select *
	from huevo natural join gallina;

rem insertemos nuevas tuplas

insert into huevo VALUES (70,'Violeta',700);
insert into huevo VALUES (80,'Celeste',800);
insert into huevo VALUES (90,'Negro',900);

insert into gallina VALUES (700,'Rusa',70);
insert into gallina VALUES (800,'Argentina',80);
insert into gallina VALUES (900,'Africana',90);

commit;

rem finalmente listemos las restricciones y sus columnas
rem  vinculadas a partir del Diccionario de datos
COL OWNER FORMAT A10
COL NOMBRE FORMAT A19
COL TABLE_NAME      FORMAT A15
COL TIPO            FORMAT A4
COL STATUS          FORMAT A8
COL DEFERRABLE      FORMAT A15
COL DEFERRED        FORMAT A10

select owner
	, constraint_name NOMBRE
	, constraint_type TIPO
	, table_name
	, status
	, deferrable
	, deferred
	from user_constraints
	where owner = 'SERGIONAVA'
		and table_name in ('HUEVO','GALLINA')
	ORDER BY 3,2;

COL COLUMN_NAME FORMAT A19
SELECT OWNER
	, CONSTRAINT_NAME
	, TABLE_NAME
	, COLUMN_NAME
	FROM USER_CONS_COLUMNS
	where table_name in ('HUEVO','GALLINA');
