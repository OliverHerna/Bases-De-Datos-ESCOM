spool C:\Users\ssali\OneDrive\2020_12_8_clase_34\teach_salida.txt

rem fig 15.4 pag 530
rem como ejemplo considere la figura 15.4 la cual muestra
rem la relación TEACH con las siguientes dependencias funcionales
rem    FD1: {STUDENT,CURSO}  -> INSTRUCTOR
REM    FD2: INSTRUCTOR  ->  COURSE
REM NOTE QUE {STUDENT,CURSO}  ES LLAVE CANDIDATA
REM    LA DESCOMPOSICIÓN DE ESTA RELACIÓN EN DOS ESQUEMAS 
REM    PODEMOS TENER TRES ESCENARIOS
rem   una relación TEACH que esta en 
rem  3FN   pero no esta en BCNF
rem descompongamos en uno de los tres diferentes escenarios
rem  escenario 1.- {student,instructor} & {student,curso}
rem  escenario 2.- {curso,instructor} & {curso,student}
rem  escenario 3.- {instructor,curso} & {instructor,student}

drop table teach;
create table teach(
	Student varchar2(12),
	curso   varchar2(18),
	instructor varchar2(10));
insert into teach values ('Narayan','Database', 'Mark');
insert into teach values ('Smith', 'Database','Navathe');
insert into teach values ('Smith','Operating Systems', 'Ammar');
insert into teach values ('Smith','Theory', 'Schulman');
insert into teach values ('Wallace','Database', 'Mark');
insert into teach values ('Wallace', 'Operating Systems','Ahamad');
insert into teach values ('Wong', 'Database', 'Omiecinski');
insert into teach values ('Zelaya', 'Database','Navathe');
insert into teach values ('Narayan','Operating Systems', 'Ammar');

rem   dependencia FD: {student,curso}  ->  instructor
select  student,curso,' -> ',instructor from teach order by 1,2,3,4;

select  distinct student,curso,' -> ',instructor from teach order by 1,2,3,4;

select  distinct student,curso from teach;


rem  los tres atributos
rem   student, instructor, curso
rem  combinemos de dos en dos
rem        student, instructor (teach_1)  =   student,curso      (teach_3)
rem        curso,   instructor (teach_2) =    curso, student     (teach_3)
rem        instructor,curso    (teach_3)  =   curso, instructor  (teach_1)
rem 
rem  determinemos el natural join de cada escenario
rem      teach_1_JN_13  teach_1 natural join teach_3
rem      teach_1_JN_23  teach_2 natural join teach_3
rem      teach_1_JN_21  teach_2 natural join teach_1
rem 
rem generemos las tablas teach1, teach2 & teach3
rem generemos las tablas del JOIN teach_1_JN_13, teach_1_JN_23, teach_1_JN_21
rem

drop table teach_1;
create table teach_1 as 
select  distinct student,instructor from teach;
select student,instructor from teach_1 order by 1,2;

drop table teach_2;
create table teach_2 as 
select  distinct curso,instructor  from teach;
select curso,instructor from teach_2 order by 1,2;

drop table teach_3;
create table teach_3 as 
select  distinct student,curso from teach;
select student, curso from teach_3;
rem  
rem generemos las tablas de joins

drop table teach_1_JN_13;
create table teach_1_JN_13 as
select student,curso,instructor 
	from teach_1 natural join teach_3 order by 1,2,3;
select student,curso,instructor from teach_1_JN_13 order by 1,2;	

drop table   teach_1_JN_23;
create table teach_1_JN_23 as
select student,curso,instructor 
	from teach_2 natural join teach_3 order by 1,2,3;
select student,curso,instructor from teach_1_JN_23 order by 1,2;	

drop table teach_1_JN_21;
create table teach_1_JN_21 as
select student,curso,instructor 
	from teach_2 natural join teach_1 order by 1,2,3;
select student,curso,instructor from teach_1_JN_21 order by 1,2;	

select student,curso,instructor from teach_1_JN_13 order by 1,2;
select student,curso,instructor from teach_1_JN_23 order by 1,2;
select student,curso,instructor from teach_1_JN_21 order by 1,2;	
rem 
rem         cifras de control  
rem 

select count(*) from teach_1_JN_13 ;
select count(*) from teach_1_JN_23 ;
select count(*) from teach_1_JN_21 ;

select student,curso,instructor from teach_1_JN_13
WHERE  (student,curso,instructor) not in 
		( select student,curso,instructor from teach)
			order by 1,2,3;

select student,curso,instructor from teach_1_JN_23
WHERE  (student,curso,instructor) not in 
		( select student,curso,instructor from teach)
			order by 1,2,3;
			
select student,curso,instructor from teach_1_JN_21
WHERE  (student,curso,instructor) not in 
		( select student,curso,instructor from teach)
			order by 1,2,3;
spool off
		
			
			

