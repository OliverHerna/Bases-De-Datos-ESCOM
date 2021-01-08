/*

Nomralización 4ta
DF   1      [modelo]  -->  Marca

DMV 1       [modelo]  -->  motor
DMV 2       [modelo]  -->    COLOR
DMV 3       [modelo, COLOR ]  -->   adornos |  toldo

DMV 3a      [modelo, COLOR ]  -->   adornos
DMV 3b      [modelo, COLOR]   -->   toldo

*/


drop table AUTOS;
create table AUTOS(
	modelo varchar2(10),
	color  varchar2(10),
	motor  varchar2(10),
	adornos varchar2(10),
	toldo   varchar2(10),
	marca   varchar2(10));


INSERT INTO AUTOS VALUES ('Mustang','Red','F3.2L','white','black','Ford');
INSERT INTO AUTOS VALUES ('Mustang','Red','F3.2L','white','white','Ford');
INSERT INTO AUTOS VALUES ('Mustang','Red','F3.2L','blue','black','Ford');
INSERT INTO AUTOS VALUES ('Mustang','Red','F3.2L','blue','white','Ford');
INSERT INTO AUTOS VALUES ('Mustang','Red','F4.5L','white','black','Ford');
INSERT INTO AUTOS VALUES ('Mustang','Red','F4.5L','white','white','Ford');
INSERT INTO AUTOS VALUES ('Mustang','Red','F4.5L','blue','black','Ford');
INSERT INTO AUTOS VALUES ('Mustang','Red','F4.5L','blue','white','Ford');
INSERT INTO AUTOS VALUES ('Mustang','White'.'F3.2L','red','white','Ford');
INSERT INTO AUTOS VALUES ('Mustang','White'.'F3.2L','red','red','Ford');
INSERT INTO AUTOS VALUES ('Mustang','White'.'F3.2L','black','white','Ford');
INSERT INTO AUTOS VALUES ('Mustang','White'.'F3.2L','black','red','Ford');
INSERT INTO AUTOS VALUES ('Mustang','White'.'F4.5L','red','white','Ford');
INSERT INTO AUTOS VALUES ('Mustang','White'.'F4.5L','red','red','Ford');
INSERT INTO AUTOS VALUES ('Mustang','White'.'F4.5L','black','white','Ford');
INSERT INTO AUTOS VALUES ('Mustang','White'.'F4.5L','black','red','Ford');
INSERT INTO AUTOS VALUES ('Mustang','Blue','F3.2L','white','black	Ford');
INSERT INTO AUTOS VALUES ('Mustang','Blue','F3.2L','white','white	Ford');
INSERT INTO AUTOS VALUES ('Mustang','Blue','F3.2L','yellow','black','Ford');
INSERT INTO AUTOS VALUES ('Mustang','Blue','F3.2L','yellow','white','Ford');
INSERT INTO AUTOS VALUES ('Mustang','Blue','F4.5L','white','black','Ford');
INSERT INTO AUTOS VALUES ('Mustang','Blue','F4.5L','white','white','Ford');
INSERT INTO AUTOS VALUES ('Mustang','Blue','F4.5L','yellow','black','Ford');
INSERT INTO AUTOS VALUES ('Mustang','Blue','F4.5L','yellow','white','Ford');
INSERT INTO AUTOS VALUES ('Cirrus','Red','C2.1L','white','black','Chrysler');
INSERT INTO AUTOS VALUES ('Cirrus','Red','C2.1L','white','blue','Chrysler');
INSERT INTO AUTOS VALUES ('Cirrus','Red','C2.1L','black','black','Chrysler');
INSERT INTO AUTOS VALUES ('Cirrus','Red','C2.1L','black','blue','Chrysler');
INSERT INTO AUTOS VALUES ('Cirrus','Red','C3.0L','white','black','Chrysler');
INSERT INTO AUTOS VALUES ('Cirrus','Red','C3.0L','white','blue','Chrysler');
INSERT INTO AUTOS VALUES ('Cirrus','Red','C3.0L','black','black','Chrysler');
INSERT INTO AUTOS VALUES ('Cirrus','Red','C3.0L','black','blue','Chrysler');
INSERT INTO AUTOS VALUES ('Cirrus','Green','C2.1L','white','brown','Chrysler');
INSERT INTO AUTOS VALUES ('Cirrus','Green','C2.1L','white','white','Chrysler');
INSERT INTO AUTOS VALUES ('Cirrus','Green','C2.1L','brown','brown','Chrysler');
INSERT INTO AUTOS VALUES ('Cirrus','Green','C2.1L','brown','white','Chrysler');
INSERT INTO AUTOS VALUES ('Cirrus','Green','C3.0L','white','brown','Chrysler');
INSERT INTO AUTOS VALUES ('Cirrus','Green','C3.0L','white','white','Chrysler');
INSERT INTO AUTOS VALUES ('Cirrus','Green','C3.0L','brown','brown','Chrysler');
INSERT INTO AUTOS VALUES ('Cirrus','Green','C3.0L','brown','white','Chrysler');


--           ----------------------------------------------------

drop  table modelo_marca;
create table modelo_marca as
select distinct modelo,marca from autos order by 1,2;

drop table modelo_color;
create table modelo_color as
select distinct modelo, color from autos order by 1,2;

drop  table modelo_adornos_toldo;
create table modelo_adornos_toldo as
select distinct modelo,adornos,toldo  from autos order by 1,2,3;


drop  table modelo_color_adornos;
create table modelo_color_adornos as
select distinct modelo, color, adornos from autos ORDER BY 1,2,3;


drop table modelo_motor;
create table modelo_motor as
select distinct modelo, motor from autos   ORDER BY 1,2;

select count (*) from modelo_marca;
select count (*) from modelo_color;
select count (*) from modelo_color_adornos;
select count (*) from modelo_color_adornos;
select count (*) from modelo_motor;

select distinct modelo,marca from modelo_marca order by 1,2;
select distinct modelo, color from modelo_color order by 1,2;
select distinct modelo,adornos,toldo  from modelo_adornos_toldo order by 1,2,3;
select distinct modelo, color, adornos from modelo_color_adornos ORDER BY 1,2,3;
select distinct modelo, motor from modelo_motor   ORDER BY 1,2;
