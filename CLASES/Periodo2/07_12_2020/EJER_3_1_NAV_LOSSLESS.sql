/*

Usuario nava_07_12_2020

EJEMPLO NO 3  NONADDITIVE LOSSLESS-JOIN_DECOMPOSITION
DIAPOSITIVAS DE NAVATHE   PAG  6   1A PARTE

SCHEMA  < R=ABC, F= { A->B }  >
   AND PARTITION D2 = { AB, BC}
*/

DROP TABLE REX_3;
create table REX_3(
	A NUMBER(2),
	B NUMBER(2),
	C NUMBER(2));
INSERT INTO REX_3 VALUES (1,2,3);
INSERT INTO REX_3 VALUES (1,2,4);
INSERT INTO REX_3 VALUES (2,1,1);
INSERT INTO REX_3 VALUES (3,1,0);
INSERT INTO REX_3 VALUES (3,1,4);

SELECT A,B FROM REX_3 ORDER BY 1,2;

SELECT B,C FROM REX_3 ORDER BY 1,2;

drop table REX_3_R1;
create table REX_3_R1 AS
SELECT distinct A,B FROM REX_3 ORDER BY 1;
select a,b from REX_3_R1;

drop table REX_3_R2;
create table REX_3_R2 AS
SELECT distinct B,C FROM REX_3 ORDER BY 1;
select B,C from REX_3_R2;

/*Tengo más tuplas que las que tenia originalmente, por lo tanto hay tuplas espuria*/
DROP TABLE REX_3_JOIN_N;
CREATE TABLE REX_3_JOIN_N AS
SELECT A,B,C FROM REX_3_R1 NATURAL JOIN REX_3_R2 ORDER BY 1,2,3;
SELECT * FROM REX_3_JOIN_N ORDER BY 1,2,3;

/**/
REM PRIMER OPERANDO RELACION *JOIN NATURAL
REM PARA DETERMINAR LAS TUPLAS ESPURIAS
select a,b,c from REX_3_JOIN_N
	where (a,b,c) not in
	(
		select a,b,c from REX_3
	)
	order by 1,2,3;
REM PARA DESPLEGAR LAS TUPLAS ORIGINALES  
select a,b,c from REX_3_JOIN_N
	where (a,b,c)  in
	(
		select a,b,c from REX_3
	)
	order by 1,2,3;
