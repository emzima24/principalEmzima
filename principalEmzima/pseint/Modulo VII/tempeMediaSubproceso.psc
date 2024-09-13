SubProceso media( tempUno Por valor, tempDos Por valor,tempMinima Por Referencia,tempMaxima Por Referencia, tempMedia Por Referencia )
	Definir temp Como Real
	tempMinima = tempUno
	tempMaxima = tempDos
	Si tempUno > tempDos Entonces
		tempMinima = tempDos
		tempMaxima = tempUno
	FinSi
	tempMedia = (tempUno + tempDos)/2
FinSubProceso

Algoritmo tempeMediaSubproceso
	Definir tempUno, tempDos,tempMinima,tempMaxima, tempMedia Como Real
	Escribir "Escribe la temperatura uno "
	Leer tempUno
	Escribir "Escribe la temperatura dos "
	Leer tempDos
	media(tempUno,tempDos,tempMinima,tempMaxima,tempMedia)
	Escribir "La temperatura mínima es " tempMinima
	Escribir "La temperatura máxima es " tempMaxima
	Escribir "La temperatura media es " tempMedia
FinAlgoritmo