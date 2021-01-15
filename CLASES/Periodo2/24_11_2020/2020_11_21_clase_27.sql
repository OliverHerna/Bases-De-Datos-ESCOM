rem carUsr
spool C:\Users\ORA_bases\university.txt
REM ESQUEMA RELACIONAL FIG 8.8 & 9.7
REM CON UNA RED DE ESPECIALIZACIÓN CON MULTIPLES
REM HERENCIA PARA EL ESQUEMA DE BASES DE DATOS
REM DE UN CASO PROPIETARIOS Y VEHICULOS REGISTRADOS
REM    OWNER & REGISTERED_VEHICLE
REM FUENTE: CAP 8
REM THE ENHANCED ENTITY-RELATIONSHIP
REM (EER) MODEL. PAG 298
rem   modelo con   LLAVES SUBROGADAS
REM FUNDAMENTALS OF DATABASE SYSTEMS
REM ELMASRI & NAVATHE 6a. Ed.


set pagesize 100
set linesize 130
set colsep '|=|'
set underline '='
SET NULL 'Sin Datos'

drop table person  cascade constraints;
create table person (
	id_person number(5) NOT NULL,
	no_licencia number(6) NOT NULL,
	nombre varchar2(10) NOT NULL,
	direcc varchar2(19),
	owner_id  number(3));

drop table banco  cascade constraints;
create table banco (
	Bnombre varchar2(10),
	Bdirecc varchar2(23),
	owner_id number (3));

drop table company  cascade constraints;
create table company(
	Cnombre varchar2(10),
	Cdirecc varchar2(15),
	owner_id number(3));

drop table owner  cascade constraints;
create table owner (
	owner_id number(3));

drop table register_vehicule  cascade constraints;
create table register_vehicule (
	id_vehiculo number(6),
	no_placa number (6));

drop table car  cascade constraints;
create table car(
	id_vehiculo number (4),
	Cestilo varchar2(6),
	Cmarca varchar2(6),
	Cmodelo varchar2 (6),
	Canio number (4));

drop table truck  cascade constraints;
create table truck (
	id_vehiculo number (4),
	marca varchar2(6),
	modelo varchar2(12),
	tonelaje number(3),
	anio number (4));

drop table propiedades  cascade constraints;
create table propiedades (
	owner_id number (5),
	id_vehiculo number(5),
	fecha_compra date,
	compra_lease varchar2(10));
rem
rem ahora declaramos las llaves primarias y las llaves foraneas
rem

alter table PERSON
	ADD CONSTRAINT PERSON_PK
		primary key (owner_id);

alter table banco
	ADD CONSTRAINT banco_PK
		primary key (Bnombre);

alter table company
	ADD CONSTRAINT company_PK
		primary key (Cnombre);


--
-------------------------------------------------------------------
-------------------------------------------------------------------
--
alter table owner
	ADD CONSTRAINT owner_PK
		primary key (owner_id);
------------------------------------------------------------
------------------------------------------------------------
--
alter table register_vehicule
	ADD CONSTRAINT register_vehicule_PK
		primary key (id_vehiculo);
--
------------------------------------------------------------
------------------------------------------------------------
--
--

alter table car
	ADD CONSTRAINT car_PK
		primary key (id_vehiculo);


alter table truck
	ADD CONSTRAINT truck_PK
		primary key (id_vehiculo);


alter table propiedades
	ADD CONSTRAINT owners_PK
		primary key (owner_id,id_vehiculo);

---------------------------------------------
---------------------------------------------





alter table PERSON
	ADD CONSTRAINT person_owner_FK
		foreign key (owner_id)
		references owner (owner_id)
		INITIALLy DEFERRED deferrable;

--


alter table banco
	ADD CONSTRAINT banco_owner_FK
		foreign key (owner_id)
		references owner (owner_id)
		INITIALLy DEFERRED deferrable;
--


alter table company
	ADD CONSTRAINT company_owner_FK
		foreign key (owner_id)
		references owner (owner_id)
		INITIALLy DEFERRED deferrable;


alter table car
	ADD CONSTRAINT car_register_vehicule_FK
		foreign key (id_vehiculo)
		references register_vehicule (id_vehiculo)
		INITIALLy DEFERRED deferrable;
--


alter table truck
	ADD CONSTRAINT truck_register_vehicule_FK
		foreign key (id_vehiculo)
		references register_vehicule (id_vehiculo)
		INITIALLy DEFERRED deferrable;

--

alter table propiedades
	ADD CONSTRAINT propiedades_owner_FK
		foreign key (owner_id)
		references owner (owner_id)
		INITIALLy DEFERRED deferrable;

alter table propiedades
	ADD CONSTRAINT propiedades_regis_vehicule_FK
		foreign key (id_vehiculo)
		references register_vehicule (id_vehiculo)
		INITIALLy DEFERRED deferrable;

select * from person;
select * from banco;
select * from company;
select * from owner;
select * from register_vehicule;
select * from car;
select * from truck;
select * from propiedades;

insert into person values (100,10001,'Raúl','Florida 10',501);
insert into person values (110,10002,'Rafael','Apodaca 1',503);
insert into person values (120,10003,'Rayan','Chetumal 40',505);
insert into person values (130,10004,'Raymundo','Colima 22',507);
insert into person values (140,10005,'Ramiro','Córdoba 11',509);
insert into person values (150,10006,'Ramón','Delicias 31',511);
insert into person values (160,10007,'Rolando','Hermosillo 18',513);
insert into person values (170,10008,'René','León 26',515);
insert into person values (180,10009,'Rosa','Miramar 75',517);

insert into banco VALUES ('BANAMEX','Isabel la Católica 15',601);
insert into banco VALUES ('SANTANDER','Isabel la Católica 15',602);
insert into banco VALUES ('BANORTE','Isabel la Católica 15',603);
insert into banco VALUES ('MIBANCO','Isabel la Católica 15',604);
insert into banco VALUES ('INBURSA','Isabel la Católica 15',605);
insert into banco VALUES ('BBVA','Isabel la Católica 15',606);
insert into banco VALUES ('HSBC','Isabel la Católica 15',607);
insert into banco VALUES ('CIBANCO','Isabel la Católica 15',608);
insert into banco VALUES ('VALUE','Isabel la Católica 15',609);

insert into COMPANY VALUES ('FEMSA','Presidentes 15',701);
insert into COMPANY VALUES ('PEPSICO','Sevilla 15',702);
insert into COMPANY VALUES ('Sabritas','Odesa 15',703);
insert into COMPANY VALUES ('Del monte','Monrovia 15',704);
insert into COMPANY VALUES ('Jumex','Canarias 15',705);
insert into COMPANY VALUES ('Nestle','República 15',706);
insert into COMPANY VALUES ('Bonafont','Balboa 15',707);
insert into COMPANY VALUES ('LG','Bélgica 15',708);

insert into owner values (501);
insert into owner values (503);
insert into owner values (505);
insert into owner values (507);
insert into owner values (509);
insert into owner values (511);
insert into owner values (513);
insert into owner values (515);
insert into owner values (517);
insert into owner values (601);
insert into owner values (602);
insert into owner values (603);
insert into owner values (604);
insert into owner values (605);
insert into owner values (606);
insert into owner values (607);
insert into owner values (608);
insert into owner values (609);
insert into owner values (607);
insert into owner values (701);
insert into owner values (702);
insert into owner values (703);
insert into owner values (704);
insert into owner values (705);
insert into owner values (706);
insert into owner values (707);
insert into owner values (708);

insert into register_vehicule values(5001,200001);
insert INTO register_vehicule values(5002,200002);
insert into register_vehicule values(5003,200003);
insert into register_vehicule values(5004,200004);
insert into register_vehicule values(5005,200005);
insert into register_vehicule values(5006,200006);
insert into register_vehicule values(5007,200007);
insert into register_vehicule values(5008,200008);
insert into register_vehicule values(5009,200009);
insert into register_vehicule values(5010,200010);
insert into register_vehicule values(5011,200011);
insert into register_vehicule values(5012,200012);

insert into car values (5001,'Sedan','Ford','Bronco',2018);
insert into car values (5002,'Sedan','KIA','Rio',2019);
insert into car values (5003,'Sedan','GM','AVE0',2020);
insert into car values (5004,'Sedan','VW','Polo',2021);

insert into truck values (5005,'Torton','Volvo',10,2020);
insert into truck values (5006,'PickUp','Volvo',1,2019);
insert into truck values (5007,'Torton','Volvo',20,2018);
insert into truck values (5008,'Caja','Volvo',25,2020);
insert into truck values (5009,'Caja','Volvo',25,2020);
insert into truck values (5010,'Caja','Volvo',25,2020);


insert into propiedades values(601,5001,to_date('31/12/2018','DD/MM/YYYY'),'Arren Fin');
insert into propiedades values(602,5005,to_date('31/12/2019','DD/MM/YYYY'),'Arren Fin');
insert into propiedades values(603,5008,to_date('31/01/2020','DD/MM/YYYY'),'Arren Fin');
insert into propiedades values(604,5003,to_date('31/03/2000','DD/MM/YYYY'),'Arren Fin');

insert into propiedades values(501,5002,to_date('31/12/2007','DD/MM/YYYY'),'Arren Fin');
insert into propiedades values(503,5004,to_date('31/12/2010','DD/MM/YYYY'),'Compra');
insert into propiedades values(505,5006,to_date('31/12/2009','DD/MM/YYYY'),'Arren Fin');
insert into propiedades values(507,5007,to_date('31/12/2019','DD/MM/YYYY'),'Compra');

insert into propiedades values(702,5009,to_date('31/12/2020','DD/MM/YYYY'),'Compra');
insert into propiedades values(703,5010,to_date('31/12/2018','DD/MM/YYYY'),'Compra');

select nombre,NO_LICENCIA,Cmarca
from person,car
where id_vehiculo = 5001;

select CNOMBRE,CDIRECC,ID_VEHICULO,OWNER_ID
FROM COMPANY,CAR
where id_vehiculo = 5001
	AND OWNER_ID = 701;
REM DESPLIEGA LOS VEHICULOS REGISYRADOS QUE SEAN CARROS

SELECT * FROM 	register_vehicule RV ,CAR C
WHERE RV.id_vehiculo = C.id_vehiculo;

REM DESPLIEGA LOS VEHICULOS REGISYRADOS QUE SEAN TRUCKS

SELECT * FROM 	register_vehicule RV ,TRUCK T
WHERE RV.id_vehiculo = T.id_vehiculo;

REM DESPLIEGA LOS NOMBRES DE PERSONAS  QUE POSEAN CARRO

SELECT ID_PERSON,NO_LICENCIA,NOMBRE,CMARCA, FECHA_COMPRA,NO_PLACA
FROM 	register_vehicule RV ,CAR C, PERSON P, PROPIEDADES PR,OWNER O
WHERE     RV.id_vehiculo = C.id_vehiculo
      AND RV.ID_VEHICULO  = PR.ID_VEHICULO
	  AND PR.OWNER_ID =O.OWNER_ID
	  AND O.OWNER_ID =P.OWNER_ID;
	  ;
