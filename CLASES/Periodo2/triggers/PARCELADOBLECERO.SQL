/*
usr/psw trig1
Figura   10.11  página 556    libro  Elmasri & Navthe 5th Edition
dependencias funcionales
a.-
	FD1: Id_propiedad             ->  {Nom_municipio,Num_Lote,Area,precio,Porc_impuesto}
	FD2: {Nom_municipio,Num_Lote} ->  Id_propiedad,Area,precio,Porc_impuesto
	FD3: Nom_municipio            ->  Porc_impuesto
	FD4: Area                     ->  precio

	Llave primaria        Id_propiedad
	LLave candidata       {Nom_municipio,Num_Lote}
----------------------------------------------------
b.-
	Descomponiendo en segunda forma normal 2NF la relación parcelas en parcleas1 & parcelas2

	parcelas1 con FD1 & FD2 & FD4
	parcelas2 con FD3

c.-
	Descomposición de parcelas1 en tercera forma normal 3FN en parcelas1A & parcelas1B
	parcelas1A con   FD1:  &   FD2:         &   parcelas1B  con FD4:

d.- Resumen de la Normalización Progresiva de la relación Parcelas:

		1FN     --------      Parcelas
		2FN     -------       parcelas1  & parcelas2
		3FN     -------       parcelas1A  & parcelas1B  & parcleas2

*/
set colsep ' |=| '
set linesize 150
set pagesize 99


/*(a) 1NF*/
drop table Parcelas;
create table Parcelas(
	Id_propiedad number(5),
	Nom_municipio varchar2(20),
	Num_Lote      varchar2(10),
	Area          number(6),
	precio    number(9,2),
	Porc_impuesto number (6,4));
insert into Parcelas values(100,'Nezahualcoyotl','Lote 1',200, 700000,.10);
insert into Parcelas values(200,'Coyotepec','Lote 2',100,30000,.07);
insert into Parcelas values(300,'Cuautitlan','Lote 3',230,180000,.14);
insert into Parcelas values(444,'Nezahualcoyotl','Lote 44',150,600000,.10);
insert into Parcelas values(555,'Nezahualcoyotl','Lote 5',250,200000,.10);
insert into Parcelas values(666,'Tepozotlan','Lote 6',90,90000,.10);
insert into Parcelas values(777,'Nezahualcoyotl','Lote 7',700,2800000,.10);

/*LOTS 1*/
drop table parcelas1;
create table parcelas1 as
select Id_propiedad,Nom_municipio,Num_Lote,Area,precio
	from parcelas
	order by 1;


select Id_propiedad,Nom_municipio,Num_Lote,Area,precio
	from parcelas1
	order by 1;

/*LOTS 2*/
drop table parcelas2;
create table parcelas2 as
select distinct Nom_municipio,Porc_impuesto from parcelas;

/*LOTS 2 SIN DISTINCT*/
drop table parcelas2;
create table parcelas2 as
select Nom_municipio,Porc_impuesto from parcelas;

select Nom_municipio,Porc_impuesto from parcelas2;

/*LOTS1A a partir de LOTS1*/
drop table parcelas1A;
create table parcelas1A as
select distinct Id_propiedad, Nom_municipio,Num_Lote,Area
	from parcelas1;

select Id_propiedad, Nom_municipio,Num_Lote,Area
	from parcelas1A;

/*LOTS1B  a part de LOTS1*/
drop table parcelas1B;
create table parcelas1B as
select distinct Area,precio
	from parcelas1;

select Area,precio
	from parcelas1B;



rem   resumen Esquema normalizado

select Id_propiedad, Nom_municipio,Num_Lote,Area
	from parcelas1A order by 2;

select Area,precio
	from parcelas1B order by 1;

select Nom_municipio,Porc_impuesto
	from parcelas2 order by 1;

select id_propiedad,Nom_municipio,Num_Lote,area,precio
	from parcelas1A natural join parcelas1B order by 1;



select id_propiedad,p2.Nom_municipio,Porc_impuesto
	from parcelas1A p1A,  parcelas2 p2,parcelas1B p1B
	where (p1A.Nom_municipio = p2.Nom_municipio)
	and (p1A.area = p1B.area) ;
------------------------------------------------------------
-----------------------------------------------------------
rem   normalizar parcelas1a en
rem        parcelas1AX     &  parcelas1AY

drop table parcelas1AX;
create table parcelas1AX as
select distinct id_propiedad,area,Num_lote
from parcelas1A order by 1;

select id_propiedad,area,Num_lote
from parcelas1Ax order by 1;


select id_propiedad,area,Num_lote

drop table parcelas1AY;
create table parcelas1AY as
select distinct area,Nom_municipio
from parcelas1A order by 1;

select distinct area,Nom_municipio
from parcelas1AY order by 1;
