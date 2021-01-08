REM TOMADO DEL CURSO TUTORIALES YA
REM DE LA SECCION ORACLEYA
REM 25 DE OCTUBRE DE 2020
REM https://www.tutorialesprogramacionya.com/oracleya/index.php?inicio=50

REM  Problema:
REM Una librer�a almacena la informaci�n de sus libros para la venta en dos tablas, "libros" y "editoriales".

REM Eliminamos ambas tablas:

 drop table libros;
 drop table editoriales;
REM Creamos las tablas:

 create table libros(
  codigo number(5),
  titulo varchar2(40),
  autor varchar2(30),
  codigoeditorial number(3),
  primary key (codigo)
 );
 create table editoriales(
  codigo number(3),
  nombre varchar2(20),
  primary key (codigo)
);
REM Ingresamos algunos registros en ambas tablas:

 insert into editoriales values(1,'Emece');
 insert into editoriales values(2,'Planeta');
 insert into editoriales values(3,'Siglo XXI');

 insert into libros values(1,'El aleph','Borges',1);
 insert into libros values(2,'Martin Fierro','Jose Hernandez',2);
 insert into libros values(3,'Aprenda PHP','Mario Molina',2);
 insert into libros values(4,'El anillo del hechicero','Gaskin',3);
REM Establecemos una restricci�n "foreign key" para evitar que se
REM ingrese en "libros" un c�digo de editorial inexistente en "editoriales"
REM  con la opci�n "on cascade" para eliminaciones:

 alter table libros
 add constraint FK_libros_codigoeditorial
  foreign key (codigoeditorial)
  references editoriales(codigo)
  on delete cascade;


REM Consultamos "user_constraints":

 select constraint_name, constraint_type, delete_rule
  from user_constraints
  where table_name='LIBROS';
REM En la columna "delete_rule" de la restricci�n "foreign key" mostrar� "cascade".

REM Si eliminamos una editorial, se borra tal editorial de "editoriales" y todos los registros de "libros" de dicha editorial:

 delete from editoriales where codigo=1;
REM Veamos si la eliminaci�n se extendi� a "libros":

 select *from libros;
REM El libro "El aleph", de la editorial con c�digo 1 se ha eliminado.

REM Eliminamos la restricci�n "foreign key" de "libros":

 alter table libros
  drop constraint FK_LIBROS_CODIGOEDITORIAL;
REM Establecemos una restricci�n "foreign key" sobre "codigoeditorial" de "libros" con la opci�n "set null" para eliminaciones:

 alter table libros
 add constraint FK_libros_codigoeditorial
  foreign key (codigoeditorial)
  references editoriales(codigo)
  on delete set null;
REM Consultamos "user_constraints":

 select constraint_name, constraint_type, delete_rule
  from user_constraints
  where table_name='LIBROS';
REM En la columna "delete_rule" de la restricci�n "foreign key" mostrar� "set null".

REM Si eliminamos una editorial cuyo c�digo est� presente en "libros",
REM se borra tal editorial de "editoriales" y todos los registros de "libros"
REM de dicha editorial se setean con el valor "null":

 delete from editoriales where codigo=2;
 select *from libros;
REM Ahora, los libros "Martin Fierro" y "Aprenda PHP" tiene valor nulo en "codigoeditorial".

REM Eliminamos la restricci�n "foreign key" de "libros":

 alter table libros
  drop constraint FK_LIBROS_CODIGOEDITORIAL;
REM Establecemos una restricci�n "foreign key" sobre "codigoeditorial" de "libros" sin especificar opci�n para eliminaciones:

 alter table libros
 add constraint FK_libros_codigoeditorial
  foreign key (codigoeditorial)
  references editoriales(codigo);
REM Consultamos "user_constraints":

 select constraint_name, constraint_type, delete_rule
  from user_constraints
  where table_name='LIBROS';
REM En la columna "delete_rule" de la restricci�n "foreign key" mostrar� "no action".

REM Intentamos eliminar una editorial cuyo c�digo est� presente en "libros":

 delete from editoriales where codigo=3;
REM Un mensaje de error indica que la acci�n no se ha realizado porque existen registros coincidentes.

REM Ingresemos el siguiente lote de comandos en el Oracle SQL Developer:
 drop table libros  CASCADE CONSTRAINTS;
 drop table editoriales CASCADE CONSTRAINTS;

 create table libros(
  codigo number(5),
  titulo varchar2(24),
  autor varchar2(17),
  codigoeditorial number(3),
  primary key (codigo)
 );
 create table editoriales(
  codigo number(3),
  nombre varchar2(20),
  primary key (codigo)
 );

 insert into editoriales values(1,'Emece');
 insert into editoriales values(2,'Planeta');
 insert into editoriales values(3,'Siglo XXI');

 insert into libros values(1,'El aleph','Borges',1);
 insert into libros values(2,'Martin Fierro','Jose Hernandez',2);
 insert into libros values(3,'Aprenda PHP','Mario Molina',2);
 insert into libros values(4,'El anillo del hechicero','Gaskin',3);

--------------------------------------------------
  select *from libros;
  select *from EDITORIALES;
  COL CODIGO HEADING "# EDIT" FORMAT 999
  SELECT L.CODIGO,L.TITULO, L.AUTOR, E.CODIGO CODIGO, E.NOMBRE
  FROM LIBROS L, EDITORIALES E
  WHERE L.CODIGOEDITORIAL = E.CODIGO;
 -------------------------------
 alter table libros
 add constraint FK_libros_codigoeditorial
  foreign key (codigoeditorial)
  references editoriales(codigo)
  on delete cascade;

 select constraint_name, constraint_type, delete_rule
  from user_constraints
  where table_name='LIBROS';
COMMIT;
 delete from editoriales where codigo=1;
  select *from EDITORIALES;
 select *from libros;

 alter table libros
  drop constraint FK_LIBROS_CODIGOEDITORIAL;

 alter table libros
 add constraint FK_libros_codigoeditorial
  foreign key (codigoeditorial)
  references editoriales(codigo)
  on delete set null;

 select constraint_name, constraint_type, delete_rule
  from user_constraints
  where table_name='LIBROS';
  REM DESPLEGUEMOS LAS EDITORIALES Y LIBROS
  select *from EDITORIALES;
 select *from libros;
 REM BORREMOS LA EDITORIAL  2
 delete from editoriales where codigo=2;
 select *from libros;
 SELECT CODIGO, TITULO, AUTOR, CODIGOEDITORIAL,
   FROM LIBROS;

 alter table libros
  drop constraint FK_LIBROS_CODIGOEDITORIAL;
  REM DESPLEGUEMOS LAS RESTRICCIONES
   select constraint_name, constraint_type, delete_rule
  from user_constraints
  where table_name='LIBROS';

 alter table libros
 add constraint FK_libros_codigoeditorial
  foreign key (codigoeditorial)
  references editoriales(codigo);

 select constraint_name, constraint_type, delete_rule
  from user_constraints
  where table_name='LIBROS';

 delete from editoriales where codigo=3;
La ejecuci�n de este lote de comandos SQL genera una salida similar a:
