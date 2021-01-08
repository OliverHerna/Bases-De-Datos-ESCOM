REM portInge

rem Having filtra grupos

/*
ejercicio
un ingeniero utiliza un portafolio para un
proyecto dado,
Diferentes ingenieros usan diferentes portafolios
"casebooks" para el mismo proyecto.
Ningun ingeniero usara el mismo portafolio
para diferentes proyectos pero diferentes
ingenieros pueden usar el mismo portafolio
para diferentes proyectos
*/

rem ejercicio 4 figura 8 del artículo
rem A Logical Design Methodology for Relational
rem Database using the
rem   Extended Entiy-Relatioship Model
rem Toby J Torey & Dongking Yang & James P Fry
rem ACM computing Surveys Vol 18 No 2  June 1986
rem
rem cada departmento debe tener un laptop
rem un laptop puede ser jefe a lo mas
rem en un departamento

set pagesize 100
set linesize 130
set colsep ' |=| '
set underline '='
drop table engineer  cascade constraints;
create table engineer(
	id_engi number (3) not null,
	nomb_engi varchar2(9),
	primary key (id_engi));

drop table project  cascade constraints;
create table project(
	id_proj number (3) not null,
	nomb_proj varchar2(7),
	primary key (id_proj));

drop table portafolio  cascade constraints;
create table portafolio (
	id_porta number (5) not null,
	nomb_porta varchar2(9),
	primary key (id_porta));

drop table usa_portafolio  cascade constraints;
create table usa_portafolio(
	id_engi number (3)  not null,
	id_proj number (5)  not null,
	id_porta number (5) not null,
	primary key (id_engi,id_proj,id_porta),
	foreign key (id_engi)
	  references engineer (id_engi),
	foreign key (id_proj)
	  references project (id_proj),
	foreign key (id_porta)
	  references portafolio (id_porta));


insert into engineer values (10,'Roberto');
insert into engineer values (20,'Raúl');
insert into engineer values (30,'Rolando');
insert into engineer values (40,'Rosita');
insert into engineer values (50,'Rosaura');
insert into engineer values (60,'Rita');
insert into engineer values (70,'Romina');
insert into engineer values (80,'Rosalba');
insert into engineer values (90,'Ruth');

insert into project values (100,'Alfa');
insert into project values (200,'Beta');
insert into project values (300,'Gama');
insert into project values (400,'Delta');
insert into project values (500,'Epsilon');
insert into project values (600,'Phi');

insert into portafolio values (5100,'Pfolio 1');
insert into portafolio values (5200,'Pfolio 2');
insert into portafolio values (5300,'Pfolio 3');
insert into portafolio values (5400,'Pfolio 4');
insert into portafolio values (5500,'Pfolio 5');
insert into portafolio values (5600,'Pfolio 6');
insert into portafolio values (5700,'Pfolio 7');
insert into portafolio values (5800,'Pfolio 8');
insert into portafolio values (5900,'Pfolio 9');

insert into usa_portafolio values (10,100,5100);
insert into usa_portafolio values (10,200,5300);
insert into usa_portafolio values (40,400,5400);
insert into usa_portafolio values (80,200,5507);
insert into usa_portafolio values (90,100,5900);
insert into usa_portafolio values (90,500,5100);


select * from engineer;
select * from project;
select * from portafolio;
select * from usa_portafolio;


rem despliega las tablas ingeniero & proyecto
select e.id_engi,e.nomb_engi,
		p.id_proj, p.nomb_proj
	from engineer e, project p, usa_portafolio up
		where (e.id_engi =	up.id_engi) and
		(p.id_proj =    up.id_proj);
rem
rem crea vista_inge_proj_porta
rem
drop  view vista_inge_proj;
create view vista_inge_proj as
select e.id_engi,e.nomb_engi,
		p.id_proj, p.nomb_proj
	from engineer e, project p, usa_portafolio up
		where (e.id_engi =	up.id_engi) and
		(p.id_proj =    up.id_proj);


select * from vista_inge_proj;
rem
rem crear una vista_inge_proj_porta
rem
drop  view vista_inge_proj_porta;
create view vista_inge_proj_porta as
select e.id_engi,e.nomb_engi,
		p.id_proj, p.nomb_proj,
		porta.id_porta,porta.nomb_porta
	from engineer e, project p, portafolio porta,
		usa_portafolio up
		where (e.id_engi =	up.id_engi)     and
			  (p.id_proj =    up.id_proj)   and
			  (porta.id_porta = up.id_porta)
		;

select * from vista_inge_proj_porta;

rem combinar la vista_inge_proj con la
rem   tabla portafolio
rem
drop view vista_inge_proj;
create view vista_inge_proj as
select e.id_engi,e.nomb_engi,
		p.id_proj, p.nomb_proj,up.id_porta
	from engineer e, project p, usa_portafolio  up
		where (e.id_engi     =  up.id_engi) and
			  (p.id_proj      = up.id_proj);
select * from vista_inge_proj;

rem desplegar los portafolios asignados a ingenieros y proyectos

select vip.id_engi,vip.nomb_engi,
		vip.id_proj, vip.nomb_proj,p.id_porta,p.nomb_porta
		from vista_inge_proj vip, portafolio p
		where
			vip.id_porta = p.id_porta;
rem desplegar los portafolios asignados a ingenieros y proyectos
rem
select vip.id_engi,vip.nomb_engi,
		vip.id_proj, vip.nomb_proj,p.id_porta,p.nomb_porta
		from vista_inge_proj vip left outer join  portafolio p
		on
			vip.id_porta = p.id_porta;
rem      desplegar tambien los portafolios que no han sido asignados
rem
select vip.id_engi,vip.nomb_engi,
		vip.id_proj, vip.nomb_proj,p.id_porta,p.nomb_porta
		from vista_inge_proj vip right  outer join  portafolio p
		on
			vip.id_porta = p.id_porta;
rem  al no e´specificar la clausula WHERE se genera un producto cartesiano
select e.id_engi,e.nomb_engi,
		p.id_proj, p.nomb_proj
		portafolio
		from engineer e, project p, portafolio porta;
rem despliega los portafolios asignados a los proyectos
rem
select e.id_engi,e.nomb_engi,
		p.id_proj, p.nomb_proj,
		porta.id_porta,porta.nomb_porta
	from engineer e, project p, portafolio porta,
		usa_portafolio up
		where ((e.id_engi =	up.id_engi) and
			(p.id_proj =    up.id_proj))  and
			(porta.id_porta = up.id_porta)
		;

select * from usa_portafolio;


rem
rem
rem
rem
rem  desplegar los ingenieros que tengan asignado proyecto
rem
select e.id_engi,e.nomb_engi, up.id_porta
	FROM engineer e, usa_portafolio up
	where e.id_engi = up.id_engi;
rem
rem desplegar los ingenieros que tengan asignado proyecto
rem tembien que no tengan asignado un portafolio
rem
select e.id_engi,e.nomb_engi, up.id_porta
		FROM engineer e left outer join usa_portafolio up
		on  e.id_engi = up.id_engi;
