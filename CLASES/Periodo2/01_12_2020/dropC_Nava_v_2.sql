spool C:\Users\ORA_bases\borra_cia.txt
rem ************************************
rem file: dropcompania.sql
rem descripción: utlizada para borrar el esquama compania
rem              borra cada una de las entidades
rem              con sus restricciones en cascada 
rem              entre otras las de integridad referencail
rem      creado el 10 de octubre de 2020
rem    actualizado 30 de octubre de 2020
rem ************************************
prompt  ******************************
prompt  ** el continuar causa que todas las entidades del
prompt  ** esquema compania seas borrados en sus estructura
prompt  ** y sus contenidos "DROP"
prompt  ** presione control CTRL-C ahora para cancelar
prompt  ** o <RETURN> para continuar
prompt  ************************************
PAUSE 

PROMPT 
PROMPT DROPPING esquema COMPANIA y sus objetos
set linesize 130
set pagesize 90
set feddback on
set colsep ' |=|'
clear screen 
   
DROP TABLE DEPENDENT      CASCADE CONSTRAINTS;
DROP TABLE WORKS_ON       CASCADE CONSTRAINTS;
DROP TABLE PROJECT        CASCADE CONSTRAINTS;
DROP TABLE DEPT_LOCATIONS CASCADE CONSTRAINTS;
DROP TABLE DEPARTMENT     CASCADE CONSTRAINTS;
DROP TABLE EMPLOYEE       CASCADE CONSTRAINTS;
spool off
