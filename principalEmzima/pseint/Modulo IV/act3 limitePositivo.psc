// Actividad 3
// Crea un programa que solicite al usuario ingresar un l�mite positivo. Luego, 
// pide n�meros al usuario hasta que la suma de los n�meros introducidos supere 
// este l�mite inicial. Recuerda nombrar y guardar tu algoritmo.
// Se define real porque es menos probable que se rompa en ejecucion en el ingreso de la edad



Algoritmo limitePositivo
	// Se define real porque es menos probable que se rompa en ejecucion en el ingreso de la edad
	Definir limite,numeroEntry,acumulado Como Real
	Escribir sin saltar "Escribe una limite "
	Leer limite
	//limite = 1000
	acumulado = 0
	Mientras acumulado <= limite Hacer
		Escribir sin saltar "Escribe un n�mero "
		Leer numeroEntry
		//numeroEntry = 1001
		acumulado = acumulado + numeroEntry
	Fin Mientras
	Escribir "Ya superaste el limite, el total es ", acumulado
	
FinAlgoritmo
