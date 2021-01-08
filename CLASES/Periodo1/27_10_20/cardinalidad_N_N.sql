REM cardi1/cardi1;

rem ejemplo de dos entidades con cardinalidad N a N
rem en este caso se generará adicional a las dos tablas
rem una tercera de la interrelación que heredara las
rem llaves primarias de cada una de  las dos entidades
rem y consecuentemente se declaran las resticciones de llaves foraneas
rem a las entidades originales.

CONNECT cardi1/cardi1;

drop table pertenece_a;
drop table prof_assoc;
drop table engineer;
create table engineer
	(emp_id number(3)
	 ,emp_name varchar2(12),
		primary key (emp_id));

create table  prof_assoc
	(assoc_id number(3),
	assoc_department varchar(12),
	primary key (assoc_id));

create table  pertenece_a
		(emp_id number(3),
		 assoc_id number(3),
			primary key (emp_id, assoc_id),
			foreign key (emp_id) references engineer(emp_id)
			on delete cascade,
			foreign key (assoc_id) references prof_assoc(assoc_id)
			on delete cascade);

insert into engineer values( 100,'Eduardo');
insert into engineer values( 200,'Roberto');
insert into engineer values( 300,'Luis');
insert into engineer values( 400,'Rogelio');
insert into engineer values( 500,'Rafael');
insert into engineer values( 600,'RAÚL');

insert into prof_assoc values( 10,'Electronica');
insert into prof_assoc values( 20,'Fisica');
insert into prof_assoc values( 30,'Matematicas');
insert into prof_assoc values( 40,'Bases');
insert into prof_assoc values( 50,'Economia');

select * from engineer;
select * from prof_assoc;

insert into pertenece_a values (100,10);
insert into pertenece_a values (100,20);
insert into pertenece_a values (200,10);
insert into pertenece_a values (300,20);
insert into pertenece_a values (300,40);
insert into pertenece_a values (400,40);
insert into pertenece_a values (500,50);
insert into pertenece_a values (400,30);
insert into pertenece_a values (600,10);
insert into pertenece_a values (600,20);
insert into pertenece_a values (600,30);
insert into pertenece_a values (600,40);
insert into pertenece_a values (600,50);
insert into pertenece_a values (600,60);
commit;
select * from PERTENECE_A;


select *
from engineer E,prof_assoc P ,pertenece_a PA
WHERE E.EMP_ID= PA.EMP_ID AND P.ASSOC_ID = PA.ASSOC_ID;


REM PROBEMOS DESPLEGAR SOLO ALGUNOS ATRIBUTOS

select E.EMP_ID,E.emp_name,P.ASSOC_ID,P.assoc_department
from
  engineer E,
  prof_assoc P,
  pertenece_a PA
WHERE E.EMP_ID= PA.EM AND P.ASSOC_ID = PA.ASSOC_ID;

REM DESPLEGUEMOS SOLO LOS PROFESORES DEL DEPARTAMENTO DE ELECTRONICA
select *
from engineer E,prof_assoc P ,pertenece_a PA
WHERE E.EMP_ID= PA.EMP_ID
	AND P.ASSOC_ID = PA.ASSOC_ID
	AND P.assoc_id = 10;

REM DESPLEGUEMOS SOLO AL PROFESOR 600
select E.EMP_ID,E.emp_name,P.ASSOC_ID,P.assoc_department
	from engineer E,prof_assoc P ,pertenece_a PA
	WHERE E.EMP_ID= PA.EMP_ID
		AND P.ASSOC_ID = PA.ASSOC_ID
		AND E.EMP_ID = 600;
REM AHORA BORREMOS el deparmento 10
delete from prof_assoc
where assoc_id = 10;

select * from engineer;
select * from prof_assoc;
select * from pertenece_a;
