REM mi version del diagrama 8.4
REM FUNDAMENTALS OF DATABASE SYSTEMS
REM ELMASRI & NAVATHE 6a. Ed.

DROP TABLE PERSON cascade constraints;
CREATE TABLE PERSON (
  Ssn number(5) NOT NULL,
  Driver_licence_no number(6) NOT NULL,
  Name varchar2(10) NOT NULL,
  Address varchar2(19),
  Id_Owner number(3)
);

DROP TABLE BANK cascade constraints;
CREATE TABLE BANK (
  Bname varchar2(10),
  Baddress varchar2(25),
  Id_Owner number(3)
);


DROP TABLE COMPANY cascade constraints;
CREATE TABLE COMPANY (
  Cname varchar2(10),
  Caddress varchar2(25),
  Id_Owner number(3)
);

DROP TABLE OWNER cascade constraints;
CREATE TABLE OWNER (
  Id_Owner number(3)
);

DROP TABLE REGISTERED_VEHICLE cascade constraints;
CREATE TABLE REGISTERED_VEHICLE(
  License_plate_no number(6);
  Vehicle_id  number(6)
);
