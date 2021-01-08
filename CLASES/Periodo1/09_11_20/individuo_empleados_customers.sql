rem user chapter8Nava

SET COLSEP '||'
rem generalizacion & agregacion pag 101
rem libro database modeling and design
rem
rem
un individuo puede ser empleado o cliente pero no ambos
DROP TABLE customer cascade constraints;
DROP TABLE employee cascade constraints;
DROP TABLE INDIVIDUO cascade constraints;
create table individuo(
	id_indiv number(5),
	nombre varchar2(10),
	direccion varchar2(15),
	constraint individuo_pk primary key (id_indiv));

-- DROP TABLE employee cascade constraints;
create table employee (
	id_emp number(5),
	job_titulo varchar2(10),
		constraint employee_pk primary key (id_emp),
		constraint ind_emp_fk  foreign key (id_emp)
						references individuo (id_indiv) on delete cascade);

-- DROP TABLE customer cascade constraints;
create table CUSTOMER (
	id_CUST number(5),
	cust_credito number(10,3),
		constraint customer_pk primary key (id_cust),
		constraint cust_emp_fk  foreign key (id_cust)
						references individuo (id_indiv) on delete cascade);

insert into individuo values (1000,'Raul','Xochililco 20');
insert into individuo values (2000,'Roberto','Av Potecnico 130');
insert into individuo values (3000,'Rogelio','Montevideo 21');
insert into individuo values (4000,'Ramón','Donceles 100');
insert into individuo values (5000,'Rosaura','Guatemala 25');
insert into individuo values (6000,'René','Alvarado 33');
insert into individuo values (7000,'Rosita','Allende 38');
insert into individuo values (8000,'Raquel','Brasil 39');

insert into employee values (1000,'Chofer');
insert into employee values (3000,'Contador');
insert into employee values (5000,'Auditor');
insert into employee values (7000,'Cajera');

insert into customer values (2000,100000);
insert into customer values (4000,300000);
insert into customer values (6000,150000);
insert into customer values (8000,8000);

select * from individuo;
select * from employee;
select * from customer;

rem desplegar el puestos de los empleados

select id_indiv,nombre,direccion,job_titulo
 from individuo,employee
where id_emp = id_indiv;

rem desplegar el creditos de los individuos que son customers
select id_indiv,nombre,direccion,cust_credito
 from individuo,customer
where id_cust = id_indiv;

rem borrar un individuo que es empleado
delete from individuo
	where id_indiv = 1000;

select id_indiv,nombre,direccion,job_titulo
 from individuo,employee
where id_emp = id_indiv;

rem borrar un individuo que es cliente
delete from individuo
	where id_indiv = 2000;

rem desplegar la tabla de individuos

select * from individuo;
select * from employee;
select * from customer;
