SPOOL C:\Users\ssali\OneDrive\2020_11_30_BASES_clase29\maier_4_1.txt
rem capitulo dependencias funcionales libro
rem   The theory of Relational Databases
rem david Maier
rem Oregon  Graduate Center
rem Computer Science press 1983
rem 2020_11_29
rem   (Maier, 1983,45)

rem   algoritmo 4.1
rem una relación r y una dependencia funcional   X-> Y
REM LA DEPENCENCIA FUNCIONAL ES VERDADERA SI:
REM  ES VERDADERA si X satisface  X->Y

REM PROBEMOS QUE LA DEPENDENCIA FUNCIONAL VUELO -> SALIDA SE SATISFACE
set colsep '| = |'
set pagesize 99
set linesize 130

drop table vuelos;
create table vuelos(
	piloto varchar2(10),
	vuelo number(3),
	fecha date ,
	salida varchar2(10));

INSERT INTO VUELOS  values ('Cruz',83,TO_DATE('09-AGO-2020','DD-MON-YYYY'),'10:15a');
INSERT INTO VUELOS  values ('Rodríguez',83,TO_DATE('11-AGO-2020','DD-MON-YYYY'),'10:15a');
INSERT INTO VUELOS  values ('Robledo',83,TO_DATE('13-AGO-2020','DD-MON-YYYY'),'10:15a');

INSERT INTO VUELOS  values ('Cruz',116,TO_DATE('10-AGO-2003','DD-MON-YYYY'),'01:25p');
INSERT INTO VUELOS  values ('Robledo',116,TO_DATE('12-AGO-2003','DD-MON-YYYY'),'01:25p');

INSERT INTO VUELOS  values ('Rodríguez',281,TO_DATE('08-AGO-2003','DD-MON-YYYY'),'05:50a');
INSERT INTO VUELOS  values ('Carranza',281,TO_DATE('09-AGO-2003','DD-MON-YYYY'),'05:50a');
INSERT INTO VUELOS  values ('Carranza',281,TO_DATE('13-AGO-2003','DD-MON-YYYY'),'05:50a');


INSERT INTO VUELOS VALUES ('Rodríguez',301,TO_DATE('12-AGO-2003','DD-MON-YYYY'),'06:25p');
INSERT INTO VUELOS VALUES ('Carranza',412,TO_DATE('15-AGO-2003','DD-MON-YYYY'),'01:25p');

TTITLE CENTER 'E s c o m ' sKIP 1 -
CENTER ==================== SKIP 1 LEFT 'PERSONNEL REPORT' -
RIGHT 'SALES DEPARTMENT' SKIP 2

TTITLE COL 28  '===>  E  S  C  O  M' SKIP 1 -
COL 28  '====================' SKIP 1    -
COL 5 LEFT 'Ejercicios Clase'      COL 28 '===================='  COL 65  'Bases de Datos' skip 1  -
COL 5 '====================================================' SKIP 2

----- TITULO CORRECTO
select * from vuelos;
select vuelo||piloteo||fecha||salida from vuelos;
select DISTINCT(vuelo||piloto||fecha||salida) CONCATENACION from vuelos ORDER BY 1;


DROP TABLE VUELOS2;
CREATE TABLE VUELOS2 AS
select (vuelo||piloto||fecha||salida) CONCATENACION from vuelos ORDER BY 1;

select CONCATENACION  AA, count(CONCATENACION) GR
from VUELOS2
group by CONCATENACION
having count(CONCATENACION)>= 1;



rem                              PROBAR SI VUELO -> SALIDA

REM HAGAMOS UNA CONSULTA DE DE LOS ATRIBUTOS INVOLUCRADOS EN LA DEPENDENCIA FUNCIONAL
REM REVISEMOS DESPLEGANDO  LOS DOS ATRIBUTOS LOS ORGANIZAMOS Y LOS VERIFICAMOS QUE LOS VALORES SEAN DISTINTOS
break on vuelo skip 2 duplicates


.


SELECT DISTINCT(VUELO), SALIDA FROM VUELOS ORDER BY 1;

SELECT DISTINCT(VUELO), SALIDA FROM VUELOS ORDER BY 2;

INSERTEMOS UN VALOR QUE NO CUMPLA CON LA  DEPENDENCIA FUNCIONAL VUELO -> SALIDA

INSERT INTO VUELOS  values ('Cruz',83,TO_DATE('09-AGO-2020','DD-MON-YYYY'),'12:15a');
rem    Y la tupla
INSERT INTO VUELOS  values ('Cruz',83,TO_DATE('09-AGO-2020','DD-MON-YYYY'),'11:15a');
rem con estos nuevos datos adicionados se viola la dependencia funcional por lo que no deberian incluirse en a base
REM
REM  BORREMOS ESTAS ULTIMAS TUPLAS
SELECT * FROM VUELOS;
DELETE FROM VUELOS WHERE SALIDA = '11:15a';
DELETE FROM VUELOS WHERE SALIDA = '12:15a';
REm el propósito es encontar el conjunto de dependencias funcionales que se satisfagan
rem   llamaremos a esa Familia de dependencias funcionales    F
rem el numero de dependencia funcionales es finita puesto que existe un número finito de subconjuntos de r
rem
rem Un conjunto F de dependencias funcionales F  X-> Y escrito como  F|= X-> Y que cada relación que satisace
rem   todas las dependencias funcionales en F tambien satisface  X->Y.
rem de la tabla 4.3  de la pagina 45
rem evaluemos si se satisaface la dependencia funcional SALIDA -> VUELO
clear break
break on SALIDA skip 2 duplicates
break on SALIDA skip 2
rem
SELECT SALIDA,VUELO FROM VUELOS ORDER BY 1;

SELECT DISTINCT(SALIDA), VUELO FROM VUELOS ORDER BY 1;

SELECT DISTINCT(SALIDA), VUELO FROM VUELOS ORDER BY 2;

REM SALIDA NO DETERMINA A VUELO


SELECT DISTINCT VUELO, SALIDA FROM VUELOS ORDER BY 1;


select SALIDA  AA, count(SALIDA) GR
from VUELOS
group by SALIDA
having count(SALIDA)>= 1;


SELECT VUELO, count(*)
FROM VUELOS
GROUP BY VUELO HAVING COUNT(*) >=1;

spool off
