/*
EJEMPLO NO 3  CONTINUACIÓN  página  siete diapositivas
  NONADDITIVE LOSSLESS-JOIN_DECOMPOSITION
SCHEMA  < R=ABC, F= { A->B }  > 
   AND PARTITION D2 = { AB, AC}
*/

DROP TABLE REX_7_1;
create table REX_7_1(
	A NUMBER(2),
	B NUMBER(2),
	C NUMBER(2));
INSERT INTO REX_7_1 VALUES (1,2,3);
INSERT INTO REX_7_1 VALUES (4,2,3);
INSERT INTO REX_7_1 VALUES (3,1,4);
INSERT INTO REX_7_1 VALUES (2,2,6);

DROP TABLE REX_7_2;
create table REX_7_2(
	B NUMBER(2),
	C NUMBER(2),
	D NUMBER(2));
INSERT INTO REX_7_2 VALUES (2,3,4);
INSERT INTO REX_7_2 VALUES (2,3,5);
INSERT INTO REX_7_2 VALUES (1,4,2);

SELECT * FROM REX_7_1;
SELECT * FROM REX_7_2;

DROP  TABLE REX_7_JOIN_N;
CREATE TABLE REX_7_JOIN_N AS 
SELECT A,B,C,D FROM REX_7_1 NATURAL JOIN REX_7_2 ORDER BY 1,2,3,4;

SELECT A,B,C,D FROM REX_7_JOIN_N;


SELECT DISTINCT A,B,C FROM REX_7_JOIN_N  ORDER BY 1,2,3;

SELECT DISTINCT B,C,D FROM REX_7_JOIN_N  ORDER BY 1,2,3;

--               SE PERDIO LA TUPLA 2,2,6

select a,b,c from REX_7_1
	where (a,b,c) not in
	(
		select a,b,c from REX_7_JOIN_N
	)
	order by 1,2,3;

--  LA TUPLA APARECE EN LA ORIGINAL Y SE PIERDE
select b,c,D from REX_7_2
	where (b,c,D) not in
	(
		select B,C,D from REX_7_JOIN_N
	)
	order by 1,2,3;
--  SI LAS  COMPARAMOS ESTAN IGULAES 	
select b,c,D from REX_7_2
	where (b,c,D)  in
	(
		select B,C,D from REX_7_JOIN_N
	)
	order by 1,2,3;


