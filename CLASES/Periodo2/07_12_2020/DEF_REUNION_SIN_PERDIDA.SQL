/*
PRUEBA DE REUNION SIN PERDIDA O DECOMPOSICION NO ADITIVA 
A PARTIR DE LA DEFINICION 
SOLO PARA PARTICIONES BINARIAS.
DIAPOSITIVAS DE NAVATHE  PAG 7 2A PARTE.

D = {R1 & R2} .ES UNA DESCOMPOSICION DE R Y F ES EL CONJUNTO
DE DEPENDENCIAS FUNCIONALES EN R, LUEGO D TIENE
UNA REUNION SIN DESCOMPOSICIÓN ADITIVA CON RESPECTO A F 
SI 

          F => (R1 INTERSECCIÓN R2) -> (R1 - R2 )
	  OR  F => (R1 INTERSECCIÓN R2) -> (R2 - R1 ) 
	  
	  
CONSIDERE EL PROBLEMA  R= A, B, C  &  F = {A -> B},
  SEA LA PARTICION D1 = {AB,AC} 
  AQUI R= A,B  &  R2= AC9, 
  
  POR LO TANTO 
     . (R1 INTERSECCIÓN R2)  =  { A }
	    (R1 - R2 )          =   { B }
		
	OR 	(R2 - R1 )          =   { C }
		
		
		LA PREGUNTA  F = (R1 INTERSECCION R2 ) -> (R1 - R2 )
		
		                              { A }    ->  { B } ES EQUIVALENTE  A F = {A -> B}
		     ESTO ES VERDADERO PORQUE  F CONTIENE EXACTAMENTE ESA DEPENDENCIA.
			 
			 
			 
		 concluimos que la descomposición  D1 es sin perdida con respecto a F.
		 
		 
*/		
		