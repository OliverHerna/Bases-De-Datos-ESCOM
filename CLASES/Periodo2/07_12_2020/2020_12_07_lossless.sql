/* EJEMPLO 8.7 PAG 122 DEL LIBRO
tHE DESIGN OF RELATIONAL DATABASES 
AUTOR: HEIKKI mANNILA  &
       KARI-JOUKO RÄIHÄ
	   EDITORIAL   ADDISON WESLEY 
*/

DROP TABLE R122;
create table R122(
	A NUMBER(2),
	B NUMBER(2),
	C NUMBER(2));
	
INSERT INTO R122 VALUES (1,3,5);
INSERT INTO R122 VALUES (1,3,6);
INSERT INTO R122 VALUES (2,3,6);
INSERT INTO R122 VALUES (2,4,6);
select a,b,c from R122 order by 1,2,3;
SELECT distinct A,B FROM R122 ORDER BY 1;

SELECT distinct B,C FROM R122 ORDER BY 1;


drop table R122_R1;
create table R122_R1 AS
SELECT distinct A,B FROM R122 ORDER BY 1;
select a,b from R122_R1;


drop table R122_R2;
create table R122_R2 AS
SELECT distinct B,C FROM R122 ORDER BY 1;
select B,C from R122_R2;

DROP TABLE R122_JOIN_N;
CREATE TABLE R122_JOIN_N AS
SELECT A,B,C FROM R122_R1 NATURAL JOIN R122_R2 ORDER BY 1,2,3;
REM PRIMER OPERANDO RELACION ORIGINAL
select a,b,c from R122
	where (a,b,c) not in
	(
		select a,b,c from R122_R1 natural join R122_R2
	)
	order by 1,2,3;

select a,b,c from R122
	where (a,b,c)  in
	(
		select a,b,c from R122_R1 natural join R122_R2
	)
	order by 1,2,3;


REM PRIMER OPERANDO RELACION *JOIN NATURAL 
select a,b,c from R122_JOIN_N
	where (a,b,c) not in
	(
		select a,b,c from R122
	)
	order by 1,2,3;

select a,b,c from R122_JOIN_N
	where (a,b,c)  in
	(
		select a,b,c from R122
	)
	order by 1,2,3;


REM CREAR UNA TABLA AUXILIAR 





drop table   R122_2;
create table R122_2 AS
SELECT distinct A,B,C FROM R122 ORDER BY 1;

select a,b,c from R122_R1 natural join R122_R2 order by 1,2,3;


select a,b,c from R122 
	where (a,b,c) not in (select a,b,c from r122_2 );

INSERT INTO R122 VALUES (7,7,7);
INSERT INTO R122 VALUES (8,8,8);

select a,b,c from R122 
	where (a,b,c) not in (select a,b,c from r122_2 );

select a,b,c from R122
where (a,b,c) not in (
select a,b,c from R122_R1 natural join R122_R2)
 order by 1,2,3;