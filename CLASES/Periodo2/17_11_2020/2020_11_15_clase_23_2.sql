rem ejercicio 2 figura 8 del artículo
rem A Logical Design Methodology for Relational
rem Database using the
rem   Extended Entiy-Relatioship Model
rem Toby J Torey & Dongking Yang & James P Fry
rem ACM computing Surveys Vol 18 No 2  June 1986
rem 
rem cada departmento debe tener un gerente 
rem un gerente puede ser jefe a lo mas 
rem en un departamento
rem
set pagesize 100
set linesize 130
set colsep ' |=| '
set underline '='
drop  table gerente cascade constraints;	
create table gerente (
	id_ger number (3),
	nomb_ger varchar2(14),
	primary key (id_ger)
	);

drop table department cascade constraints;
create table department(
	id_depart number (3) not null,
	nomb_dep varchar2(14),
	id_ger number (3),
	primary key (id_depart),
	foreign key (id_ger)
	references gerente (id_ger));
	


insert into gerente values (100,'Roberto');
insert into gerente values (200,'Rogelio');
insert into gerente values (300,'Raúl');
insert into gerente values (400,'Rolando');
insert into gerente values (500,'Rodrigo');
insert into gerente values (600,'Rosaura');
insert into gerente values (700,'Rosita');
insert into gerente values (800,'Reyna');


insert into department values (10,'Contabilidad',100);
insert into department values (20,'Almacén',300);
insert into department values (30,'Capital Humano',200);
insert into department values (40,'Construcción',400);
insert into department values (50,'Auditoria',500);
insert into department values (60,'Académico',null);

select id_ger,nomb_ger,id_depart,nomb_dep
		from gerente natural join  department;

select id_ger,nomb_ger,id_depart,nomb_dep
		from gerente natural left join  department;	
		
select id_ger,nomb_ger,id_depart,nomb_dep
		from gerente natural right join  department;	

select g.id_ger,nomb_ger,id_depart,nomb_dep
		from gerente g right outer join  department d
		on g.id_ger = d.id_ger;

select g.id_ger,nomb_ger,id_depart,nomb_dep
		from gerente g left outer join  department d
		on g.id_ger = d.id_ger;

select g.id_ger,nomb_ger,id_depart,nomb_dep
		from gerente g full outer join  department d
		on g.id_ger = d.id_ger;		
rem insertemos mas departamentos
insert into department values (70,'Redes',null);
insert into department values (80,'Electricidad',null);
insert into department values (90,'Pintura',null);
rem insertemos un departamento duplicado
insert into department values (60,'Academia Pato',null);
rem 
rem  dar de baja al empleado 400 como gerente de Construcción
update department set id_ger= null 
	where id_depart = 40;

select * from department;	
	
delete from department
	where id_depart = 50;
	
rem depleguemos gerentes y departamentos 
select g.id_ger,nomb_ger,id_depart,nomb_dep
		from gerente g full outer join  department d
		on g.id_ger = d.id_ger
		order by 3;
		
rem  dar de baja al empleado 100 Roberto  de la empresa
delete from gerente 
	where id_ger = 100;		
rem 
Rem no se puede
rem 
rem necesitamos saber de que departamento estaba 
rem asignado como gerente
rem es el depto 10
rem lo quitamos de gerente 
rem y lo damos de baja de la empresa

update department set id_ger= null 
	where id_depart = 10;
	

delete from gerente 
	where id_ger = 100;
	
rem deplegamos los departamentos y sus gerentes 
select g.id_ger,nomb_ger,id_depart,nomb_dep
		from gerente g full outer join  department d
		on g.id_ger = d.id_ger
		order by 3;
		