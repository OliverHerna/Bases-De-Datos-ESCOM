rem user chapter8Nava
rem schema fig 8.3  p 251 generalizacion de dos entidades
rem          libro Elmasri& Navathe
rem genearalizacion de la entidad CAR & Truck
rem en la superclase VEHICULE
rem Subtype Relationship Properties
rem The following SQL script is
rem produced using the forward engineering
rem feature of ERWin for the Vehicles example:
drop table car cascade constraints ;
drop table truck cascade constraints ;
drop table vehicle cascade constraints ;
CREATE TABLE CAR (
	VehicleID NUMBER(5)
		CONSTRAINT  VehicleID_C_NN   NOT NULL,
	MaxSpeed NUMBER(3)                   NULL,
	NumOfPassengers NUMBER(2)            NULL
	 );

ALTER TABLE CAR
		ADD CONSTRAINT CAR_PK
		PRIMARY KEY (VehicleID);

 CREATE TABLE TRUCK (
	VehicleID NUMBER(5)
		CONSTRAINT VehicleID_T_NN    NOT NULL,
	NumOfAxles NUMBER(1)                 NULL,
	Tonnage NUMBER(3)                    NULL
	 );

 ALTER TABLE TRUCK
	ADD CONSTRAINT TRUCK_PK
	PRIMARY KEY (VehicleID);

CREATE TABLE VEHICLE (
	VehicleID NUMBER(5)
		CONSTRAINT VehicleID_V_NN  NOT NULL,
	Price NUMBER(8,2)                  NULL,
	LicensePlateNo VARCHAR2(10)        NULL );

ALTER TABLE VEHICLE
	ADD CONSTRAINT VEHICLE_PK
	PRIMARY KEY (VehicleID);

ALTER TABLE CAR ADD CONSTRAINT CAR_VEHICLE_FK
			FOREIGN KEY (VehicleID)
			REFERENCES VEHICLE(VehicleID);

ALTER TABLE TRUCK ADD CONSTRAINT CAR_TRUCK_FK
			FOREIGN KEY (VehicleID)
			REFERENCES VEHICLE(VehicleID);

insert into vehicle values(10001,200000,'A5001');
insert into vehicle values(10002,100000,'B2001');
insert into vehicle values(10003,300000,'A5002');
insert into vehicle values(10004,500000,'B2004');
insert into vehicle values(10005,800000,'A5010');
insert into vehicle values(10006,700000,'B2007');
insert into vehicle values(10007,750000,'A5025');
insert into vehicle values(10008,60000,'B8001');
insert into vehicle values(10009,80000,'A5039');
insert into vehicle values(10010,90000,'B8002');

select * from vehicle;

insert into CAR values(10001,90,4);
insert into CAR values(10003,190,4);
insert into CAR values(10005,150,10);
insert into CAR values(10007,130,7);
insert into CAR values(10009,160,8);

select * from car;

insert into truck values(10002,2,8);
insert into truck values(10004,3,12);
insert into truck values(10006,4,25);
insert into truck values(10008,3,10);
insert into truck values(10010,4,30);

select * from truck;

select * from vehicle;
select * from car;
select * from truck;
col precio format $999,999.00
select VehicleID,
	Price          precio,
	LicensePlateNo placa
	from vehicle;

col "Vel Max" format 99999
col pasaje heading "Pajaseros" format 999
select VehicleID,
	MaxSpeed  "Vel Max",
    NumOfPassengers pasaje
	from car;

SELECT VehicleID,
	    NumOfAxles EJES,
        Tonnage TONELAJE
		FROM TRUCK;

REM DESPLAGAR LOS ATRIBUTOS DE CAR
REM COMBINANDO LA SUBCLASE CAR & LA SUPERCLASE VEHICLE
SELECT VehicleID,
		Price          precio,
		LicensePlateNo placa,
		MaxSpeed  "Vel Max",
		NumOfPassengers pasaje
		FROM VEHICLE NATURAL JOIN CAR;

REM DESPLAGAR LOS ATRIBUTOS DE TRUCK
REM COMBINANDO LA SUBCLASE TRUCK & LA SUPERCLASE VEHICLE
SELECT VehicleID,
		Price          precio,
		LicensePlateNo placa,
		NumOfAxles EJES,
		Tonnage TONELAJE
		FROM VEHICLE NATURAL JOIN TRUCK;

REM PROBEMOS USANDO EL LEFT NATURAL JOIN

SELECT 'CARROS',
		VehicleID,
		Price          precio,
		LicensePlateNo placa,
		MaxSpeed  "Vel Max",
		NumOfPassengers pasaje
		FROM VEHICLE NATURAL LEFT JOIN CAR
		ORDER BY 4,1;

SELECT 'TRUKS ',VehicleID,
		Price          precio,
		LicensePlateNo placa,
		NumOfAxles EJES,
		Tonnage TONELAJE
		FROM VEHICLE NATURAL LEFT  JOIN TRUCK
		ORDER BY 4,1;

REM    INSERTEMOS UN vehiculos
rem
insert into vehicle (VehicleID,Price,LicensePlateNo) values(10010,90000,'B9002');
insert into vehicle (VehicleID,Price,LicensePlateNo) values(10011,null,'B9002');
insert into vehicle (VehicleID,Price,LicensePlateNo) values(10013,90000,null);
insert into vehicle (VehicleID,Price,LicensePlateNo) values(10015,null,null);
insert into vehicle (VehicleID,Price,LicensePlateNo) values(10017,90000,'B9005');

select * from vehicle;

insert into vehicle (VehicleID,Price,LicensePlateNo) values(10012,190000,'B9025');
insert into vehicle (VehicleID,Price,LicensePlateNo) values(10014,null,'B9033');
insert into vehicle (VehicleID,Price,LicensePlateNo) values(10016,330000,null);
insert into vehicle (VehicleID,Price,LicensePlateNo) values(10018,null,'null');
insert into vehicle (VehicleID,Price,LicensePlateNo) values(10020,99000,'B9044');

select * from vehicle;

REM
REM    INSERTEMOS UN CARRO REPETIDO & con valores nulos
REM
insert into CAR (VehicleID,MaxSpeed,NumOfPassengers) values(10007,180,5);


insert into CAR (VehicleID,MaxSpeed,NumOfPassengers) values(10009,null,5);
insert into CAR (VehicleID,MaxSpeed,NumOfPassengers) values(10011,180,null);
insert into CAR (VehicleID,MaxSpeed,NumOfPassengers) values(10013,null,null);

select * from car;
rem
rem insertemos trucks
insert into truck (VehicleID,NumOfAxles,Tonnage) values(10012,3,20);
insert into truck (VehicleID,NumOfAxles,Tonnage) values(10014,3,null);
insert into truck (VehicleID,NumOfAxles,Tonnage) values(10016,null,null);
insert into truck (VehicleID,NumOfAxles,Tonnage) values(10018,null,20);
insert into truck (VehicleID,NumOfAxles,Tonnage) values(10020,null,null);

rem desplegar las tablas con nuevas tuplas incorporadas

select * from vehicle;
select * from car;
select * from truck;

SELECT VehicleID,
		Price          precio,
		LicensePlateNo placa,
		MaxSpeed  "Vel Max",
		NumOfPassengers pasaje
		FROM VEHICLE NATURAL JOIN CAR;

SELECT VehicleID,
		Price          precio,
		LicensePlateNo placa,
		NumOfAxles EJES,
		Tonnage TONELAJE
		FROM VEHICLE NATURAL JOIN TRUCK;




REM PARA PODER INSERTAR RESTRICIONES DE CKECK
REM DEBEMOS   MODIFICAR LA RESTRICCION DE NULL A NOT NULL




REM INCORPOREMOS NUEVAS RESTRICCIONES
CONSTRAINT      MaxSpeed_NULL  NULL,
ALTER TABLE CAR     MODIFY       (MaxSpeed NOT NULL );
ALTER TABLE CAR     ADD CONSTRAINT MaxSpeed_CK    CHECK  (MaxSpeed < 250);
ALTER TABLE TRUCK     MODIFY       (NumOfAxles NOT NULL );
ALTER TABLE TRUCK   ADD CONSTRAINT NumOfAxles_CK  CHECK  (NumOfAxles < 6);
ALTER TABLE VEHICLE      MODIFY       (PRICE NOT NULL );
ALTER TABLE VEHICLE ADD CONSTRAINT PRICE_CK       CHECK  (PRICE < 400000);
ALTER TABLE TRUCK     MODIFY       (TONNAGE NOT NULL );
ALTER TABLE TRUCK   ADD CONSTRAINT Tonnage_CK     CHECK  (Tonnage < 40);


select * from vehicle;
select * from car;
select * from truck;

SELECT VehicleID,
		Price          precio,
		LicensePlateNo placa,
		MaxSpeed  "Vel Max",
		NumOfPassengers pasaje
		FROM VEHICLE NATURAL JOIN CAR;

SELECT VehicleID,
		Price          precio,
		LicensePlateNo placa,
		NumOfAxles EJES,
		Tonnage TONELAJE
		FROM VEHICLE NATURAL JOIN TRUCK;






insert into truck (VehicleID,NumOfAxles,Tonnage) values(10012,3,20);
insert into truck (VehicleID,NumOfAxles,Tonnage) values(10014,3,null);
insert into truck (VehicleID,NumOfAxles,Tonnage) values(10016,null,null);
insert into truck (VehicleID,NumOfAxles,Tonnage) values(10018,null,20);
insert into truck (VehicleID,NumOfAxles,Tonnage) values(10020,null,null);


/*
ALTER TABLE car DROP CONSTRAINT MaxSpeed_NULL;

*/
