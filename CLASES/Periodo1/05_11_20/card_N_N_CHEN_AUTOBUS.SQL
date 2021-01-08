drop table autobus cascade constraints;
create table autobus(
	id_matricula number(5),
	traj_circ number (5),
	categoria varchar2(10),
	constraint autobus_pk  primary key (id_matricula));
	
drop table conductor cascade constraints;	
create table conductor (
	id_conductor number (5),
	nombre varchar2(10),
	experiencia varchar2(10),
	constraint conductor_pk primary key (id_conductor));
	
drop table condu_auto cascade constraints;	
create table condu_auto(
	id_conductor number (5),
	id_matricula number (5),
	trayecto varchar2(10),
	constraint candu_auto_pk     
					primary key (id_conductor,id_matricula),
	constraint condu_auto_Id_cond_fk 
					foreign key (id_conductor) references
					conductor (id_conductor),
	constraint condu_auto_Id_matri_fk 
					foreign key (id_matricula) references
					autobus (id_matricula));

insert into autobus values (1001,5003,'volvo');
insert into autobus values (1002,5020,'Mann');
insert into autobus values (1003,5330,'Chevro');
insert into autobus values (1004,5004,'Ford');
insert into autobus values (1005,5050,'VW');





insert into conductor VALUES (10,'Roberto',10);	
insert into conductor VALUES (20,'Rubén'  ,8);
insert into conductor VALUES (30,'Raúl'   ,5);
insert into conductor VALUES (40,'Rolando',7);
insert into conductor VALUES (50,'Romulo' ,11);
insert into conductor VALUES (60,'Raziel' ,12);
insert into conductor VALUES (70,'Rosita' ,4);
insert into conductor VALUES (80,'Ruth'   ,5);

insert into CONDU_AUTO VALUES (10,1002,'Chapultepec');
insert into CONDU_AUTO VALUES (20,1004,'Acapulco');
insert into CONDU_AUTO VALUES (30,1005,'Cancun');
insert into CONDU_AUTO VALUES (40,1001,'Zacatenco');
insert into CONDU_AUTO VALUES (80,1003,'Puebla');
insert into CONDU_AUTO VALUES (10,1002,'Orizaba');

select * from autobus;
select * from conductor;
select * from condu_auto;

select * from autobus a,condu_auto ca;

select a.id_matricula, ca.id_conductor,
	traj_circ,
	categoria, trayecto
	from autobus a,condu_auto ca
where a.id_matricula = ca.id_matricula; 


select ca.id_matricula, ca.id_conductor,
	experiencia, trayecto
	from conductor c,condu_auto ca
where c.id_conductor = ca.id_conductor; 


select * from autobus natural join  condu_auto;
select * from autobus natural  left join  condu_auto;
select * from autobus natural  right join  condu_auto;

select nota_ID,factura_ID,total_factura,
	   fn.descuento
from factura f natural join fact_nota fn;


select ca.id_matricula,ca.id_conductor,traj_circ,categoria,
		experiencia,nombre,trayecto
		from autobus a,conductor c,condu_auto ca
		where a.id_matricula = ca.id_matricula
		  and c.id_conductor = ca.id_conductor;