COL COLUMN_NAME FORMAT A19
SELECT OWNER
	, CONSTRAINT_NAME
	, TABLE_NAME
	, COLUMN_NAME
	FROM USER_CONS_COLUMNS;


COL OWNER FORMAT A10
COL NOMBRE FORMAT A19
COL TABLE_NAME      FORMAT A15
COL TIPO            FORMAT A4
COL STATUS          FORMAT A8
COL DEFERRABLE      FORMAT A15
COL DEFERRED        FORMAT A10

select owner
	, constraint_name NOMBRE
	, constraint_type TIPO
	, table_name
	, status
	, deferrable
	, deferred
	from user_constraints
	where owner = 'chapter8Nava' 
		and table_name in ('CAR','VEHICLE','TRUCK')
	ORDER BY 3,2;

COL COLUMN_NAME FORMAT A19
SELECT OWNER
	, CONSTRAINT_NAME
	, TABLE_NAME
	, COLUMN_NAME
	FROM USER_CONS_COLUMNS
	where table_name in ('CAR','VEHICLE','TRUCK');
