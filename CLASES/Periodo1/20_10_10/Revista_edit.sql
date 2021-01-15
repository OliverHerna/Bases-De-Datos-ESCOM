/* regla 3.1   */
drop table revista;
drop table editorial;
create table editorial(
	nombre_editorial varchar2(18)
			constraint PK_editorial_nombre_edit primary key,
	director varchar2(24),
	direccion varchar2(15));
	
--drop table revista;
create table revista (
	titulo varchar2(20)
			constraint PK_revista_titulo 
			primary key,
	editor varchar2(17),
	ejemplares integer,
	nombre_editorial varchar2(17) 
			constraint FK_editorial_nombre_ed 
		    references editorial(nombre_editorial));
	prompt editoriales 
	
	insert into editorial values('Vuelta','Enrique Krauze', 'Chilaque 9');
	insert into editorial values('Libertinaje','Francisco López', 'Holbein 75');
	insert into editorial values('Impresiones Aereas','Robert Hoffman', 'Mitla # 95');
	insert into editorial values('Gastronomia','Martha Chapa', 'Correo  # 9');
	insert into editorial values('INAH','Juan Gonzalez', 'Moneda # 70');
	insert into editorial values('Televisa', 'Juan Origel', 'Chapultepec 18');
	
	prompt revistas 
	
	insert into revista values('Letras Libres','Octavio Paz',10000,'Vuelta');
	insert into revista values('Mex Desconocido','Beatriz Quintanar',4500,'Impresiones Aereas');
	insert into revista values('Memelas ','Martucha',1000,'Gastronomia');
	insert into revista values('Arqueologia','Octogenario S',7000,'INAH');
	insert into revista values('Desiertos','Jose Arena',10000,'INAH');
	insert into revista values('Manglares','Vicente Matus',10000,'INAH');
	insert into revista values('Letras enclaustradas','El can cerbero',10000,'Vuelta');
	insert into revista values('Automovil','Octavio Paz',10000,'Televisa');
	insert into revista values('Motociclismo','agente 777',10000,'Televisa');
	insert into revista values('Vanidades','Lupita Jones',1200,'Televisa');
	insert into revista values('Tiempo Libre','Lupita Jones',1200,'Libertinaje');
	
	select * from editorial
		order by 1;
	select * from revista
		order by 4;

rem  vinculemos en un query las dos entidades por medio de 
rem la integridad referencial 
rem  foreing key 	
	
	select E.nombre_editorial, titulo, ejemplares 
		from editorial E, revista R
		where E.nombre_editorial = R.nombre_editorial
		order by 1;
	
rem intentamos borrar la editorial Vuelta	
	delete from editorial
		where nombre_editorial = 'Vuelta';
		
rem  borramos una editorial que no tenia titulos publicados]	
	delete from editorial
		where nombre_editorial = 'Impresiones Aereas';

rem intentamos borrar la editorial Gastronomia
	delete from editorial
		where nombre_editorial = 'Gastronomia';
		
rem borramos primero los hijos de la editorial Televisa		

	delete from revista 
		where titulo = 'Automovil';
		
		delete from revista 
		where titulo = 'Vanidades';
		
			delete from revista 
		where titulo = 'Motociclismo';
		
rem una vez borrado los hijos "Titulos" de la editorial "Televisa"
rem 
rem intentamos borrar la tupla  Televisa de la tabla de Editorial
rem
	delete from editorial
		where nombre_editorial = 'Televisa';	
rem ahora si se pudo hacer 
rem 
rem listemos las tablas y su equijoin
	select * from editorial
		order by 1;
	select * from revista
		order by 4;
rem 
	select E.nombre_editorial, titulo, ejemplares 
		from editorial E, revista R
		where E.nombre_editorial = R.nombre_editorial
		order by 1;
-----------------------------------------------------------------------------------
-----------------------------------------------------------------------------------
		
rem despleguemos la cosntraints de la entidades Revista y Editorial
COLUMN OWNER FORMAT A17
select owner
	, constraint_name NOMBRE
	, constraint_type TIPO
	, table_name 
	, status
	, deferrable
	, deferred
	from user_constraints
	where owner = 'SERGIOALUMNO'
	ORDER BY 4,2;
	
COL COLUMN_NAME FORMAT A23	
SELECT OWNER
	, CONSTRAINT_NAME
	, TABLE_NAME
	, COLUMN_NAME
	FROM USER_CONS_COLUMNS
	ORDER BY 3,4;
		
	