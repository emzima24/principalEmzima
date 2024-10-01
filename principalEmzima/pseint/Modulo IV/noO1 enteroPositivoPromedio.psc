// Complementario 1
// Desarrolla un programa que calcule el promedio de una secuencia de números ingresados por 
// el usuario a través del teclado. La secuencia finaliza con un -1. Por ejemplo: 5, 3, 0, 2, 4, 4, 0, 0, 2, 3, 6, 0, ..., -1. 
// Se asume que el usuario no ingresará números negativos. Utiliza la estructura repetitiva mientras para resolver esta actividad.



Algoritmo enteroPositivoPromedio
	// Se define real porque es menos probable que se rompa en ejecucion en el ingreso de la edad
	Definir acumulado,numeroEntry, cantidad Como Real
	Escribir sin saltar "Escribe un numero (se para con -1) "
	Leer numeroEntry
	//numeroEntry = 1001
	acumulado = numeroEntry
	cantidad = 1
	Mientras numeroEntry <> -1 Hacer
		Escribir sin saltar "Escribe un numero (se para con -1) "
		Leer numeroEntry
		//numeroEntry = 1001
		Si (numeroEntry > 0) Entonces
			acumulado = acumulado + numeroEntry
			cantidad = cantidad + 1
		FinSi
	Fin Mientras
	Escribir "Gracias por participar, el promedio es ", acumulado/cantidad
FinAlgoritmo

