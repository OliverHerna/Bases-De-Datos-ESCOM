DROP TABLE FACTURA cascade constraints;

create table factura(
  factura_ID number(3) constraint tot_fact_NN   NOT NULL,
  fecha_emision date   constraint fech_emis_NN  NOT NULL,
  total_factura number (6,2),
  constraint factura_pk primary key (factura_ID)
);

DROP TABLE NOTA_VENTA cascade constraints;

CREATE TABLE NOTA_VENTA(
  NOTA_ID NUMBER(3),
  FECHA_VENTA DATE             constraint fecha_venta_NN not null,
  TOTAL_NOTA_VENTA NUMBER(6,2) constraint tot_venta_NN   not null,
  constraint nota_pk primary key (nota_ID)
);

DROP TABLE fact_nota cascade constraints;

create table fact_nota (
    nota_id number(3)            constraint nota_id_NN NOT NULL,
    factura_id  number (3)       constraint fact_id_NN NOT NULL,
    descuento number (3,2),
    constraint nota_id_pk primary key (nota_id),
    constraint factura_ID_fk foreign key(factura_id)
    references factura(factura_ID)
    );

DROP TABLE fact_nota cascade constraints;

 INSERT INTO FACTURA VALUES (100,TO_DATE('10/02/2020','DD/MM/RR'),250.30);
 INSERT INTO FACTURA VALUES (200,TO_DATE('10/02/2020','DD/MM/RR'),25.30);
 INSERT INTO FACTURA VALUES (300,TO_DATE('10/02/2020','DD/MM/RR'),50.30);
 INSERT INTO FACTURA VALUES (400,TO_DATE('10/02/2020','DD/MM/RR'),2500.30);
 INSERT INTO FACTURA VALUES (500,TO_DATE('10/02/2020','DD/MM/RR'),100.30);
 INSERT INTO FACTURA VALUES (600,TO_DATE('10/02/2020','DD/MM/RR'),75.30);
 INSERT INTO FACTURA VALUES (700,TO_DATE('10/02/2020','DD/MM/RR'),99.3));
 INSERT INTO FACTURA VALUES (720,TO_DATE('10/02/2020','DD/MM/RR'),999.30);
 INSERT INTO nota_venta values (10,TO_DATE('10/02/2020','DD/MM/RR'),150.30);
 INSERT INTO nota_venta values (20,TO_DATE('10/02/2020','DD/MM/RR'),80.00);
 INSERT INTO nota_venta values (30,TO_DATE('10/02/2020','DD/MM/RR'),20.00);
 INSERT INTO nota_venta values (40,TO_DATE('10/02/2020','DD/MM/RR'),7.30);
 INSERT INTO nota_venta values (50,TO_DATE('10/02/2020','DD/MM/RR'),75.30);
 INSERT INTO nota_venta values (60,TO_DATE('10/02/2020','DD/MM/RR'),25.00);
 INSERT INTO nota_venta values (70,TO_DATE('10/02/2020','DD/MM/RR'),3.30);
 INSERT INTO nota_venta values (80,TO_DATE('10/02/2020','DD/MM/RR'),75.30);
 INSERT INTO nota_venta values (85,TO_DATE('10/02/2020','DD/MM/RR'),75.30);
 INSERT INTO nota_venta values (86,TO_DATE('10/02/2020','DD/MM/RR'),75.30);

INSERT INTO fact_nota values (10,100,.05);
INSERT INTO fact_nota values (20,100,.05);
INSERT INTO fact_nota values (30,100,.05);
INSERT INTO fact_nota values (40,200,.05);
INSERT INTO fact_nota values (50,500,.05);
INSERT INTO fact_nota values (60,500,.05);
INSERT INTO fact_nota values (70,700,.05);
INSERT INTO fact_nota values (80,600,.05);


select f.factura_ID,n.nota_ID,f.total_factura,
  n.total_nota_venta,fn.descuento,n.fecha_venta
  from factura f,nota_venta n , fact_nota fn
  where f.factura_ID = fn.factura_ID and n.nota_ID = fn.nota_ID;
