Algoritmo limitePositivo
	Definir limite,numeroEntry,acumulado Como Real
	Escribir sin saltar "Escribe una limite "
	Leer limite
	//limite = 1000
	acumulado = 0
	Mientras acumulado <= limite Hacer
		Escribir sin saltar "Escribe un número "
		Leer numeroEntry
		//numeroEntry = 1001
		acumulado = acumulado + numeroEntry
	Fin Mientras
	Escribir "Ya superaste el limite, el total es ", acumulado
	
FinAlgoritmo
