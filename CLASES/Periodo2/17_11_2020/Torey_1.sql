set pagesize 99
set linesize 100
set colsep ' |=|'
/*
cada aprendiz tiene un solo tutor "sponsor"
y cada sponsor tiene un aprendiz
*/
drop table apprentice;
drop table sponsor;	
create table sponsor(
	sponsor_emp_id number (3) not null,
	nombre_sponsor varchar2(10),
	constraint sponsor_emp_id_pk 
			primary key (sponsor_emp_id));

drop table apprentice;
create table apprentice(
	emp_id number(3),
	nom_apprendiz varchar (10),
	sponsor_emp_id number (3) unique,
	constraint emp_id_pk 
			primary key (emp_id),
	CONSTRAINT appren_sponsor_fk
			FOREIGN KEY (sponsor_emp_id) 
			REFERENCES sponsor (sponsor_emp_id));

insert into sponsor values (100,'Andrés');	
insert into sponsor values (200,'Arturo');
insert into sponsor values (300,'Alonso');
insert into sponsor values (400,'Alberto');
insert into sponsor values (500,'Alex');
insert into sponsor values (600,'Aaron');

insert into apprentice values (10,'Raúl',100);	
insert into apprentice values (20,'Roberto',200);
insert into apprentice values (30,'Rolando',300);
insert into apprentice values (40,'Rafael',500);
insert into apprentice values (50,'Rigoberto',400);



select emp_id, nom_apprendiz, sponsor_emp_id, nombre_sponsor
			from apprentice natural join sponsor;
			
insert into apprentice values (60,'Rigoberto',400);

rem insertar otra tupla que 
insert into apprentice values (10,'Rigoberto',400);
insert into apprentice values (10,'Rigoberto',600);