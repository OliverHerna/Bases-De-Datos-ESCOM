/*
En un lugar se tienen  muchos gatos y muchos ratones
un ratón solo puede ser cazado por un único gato
la entidades son gatos y ratones
la relación es cazar
las cardinalidades indican el número de entidades con las
que se puede relacionar una entidades


                                 1:N
        *************            **            *************
        *           *          *     *         *           *
        *           * (0,1)   *        * (0,N) *  RATON    *
	   *  GATO     * ***** *   caza   ********           *
        *           *         *       *        *           *
	   *           *          *     *         *           *
	   *************             **           *************
CADA GATO PUEDE CAZAR UN RATON
EL GATO PODRIA NO CAZAR NINGUNO
CADA GATO PUEDE CAZAR COMO MÁXIMO N
PREGUNTAMOS AHORA EN PASIVO
CADA RATON PUEDE  SER CAZADO COMO MÍNIMO POR CUANTOS GATOS
CERO SI ES QUE EL RATON PUEDE NO SER CAZADO
PARA EL MÁXIMO TOMAMOS 
UN RATON PUEDE SER CAZADO POR UN ÚNICO GATO


*/)
DROP TABLE GATO;
CREATE TABLE GATO (
ID_GATO NUMBER (3),
NOMBRE_GATO VARCHAR2(10),
PRIMARY KEY (ID_GATO));

dROP TABLE RATON;
CREATE TABLE RATON (
	ID_RATON NUMBER (3),
	NOMBRE_RATON VARCHAR2(10),
	ID_GATO NUMBER(3),
	PRIMARY KEY (ID_RATON ),
	FOREIGN KEY (ID_GATO) REFERENCES GATO (ID_GATO));
	
INSERT INTO GATO VALUES (10,'Felix');
INSERT INTO GATO VALUES (20,'Azrael');
INSERT INTO GATO VALUES (30,'Berloiz');
INSERT INTO GATO VALUES (40,'Touluse');
INSERT INTO GATO VALUES (50,'Calbert');
INSERT INTO GATO VALUES (60,'Rex');
INSERT INTO GATO VALUES (70,'Jack');


insert into raton VALUES (	100,'Mickey',10);
insert into raton VALUES (	200,'Minnie',20);
insert into raton VALUES (	300,'Roquefort',10);
insert into raton VALUES (	400,'Olivia',30);
insert into raton VALUES (	500,'Timothy',50);
insert into raton VALUES (	600,'Feivel',30);
insert into raton VALUES (	700,'Basil',10);
insert into raton VALUES (	800,'Bianca',10);
insert into raton VALUES (	900,'Stuart',30);

select * from gato;
select * from raton;
select * from gato natural join raton ORDER BY 1;
select * from gato natural left join raton;


	
REM INSERTEMEOS RATONES QUE NO HAYAN SIDO CAZADOS 
insert into raton VALUES (	910,'Jerry',null);
insert into raton VALUES (	920,'Tom',null);
insert into raton VALUES (	930,'Speedy',null);
insert into raton VALUES (	940,'Cerebro',null);

select * from RATON
WHERE RATON.ID_GATO IS NULL;

