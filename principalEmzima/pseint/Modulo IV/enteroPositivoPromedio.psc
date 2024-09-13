Algoritmo enteroPositivoPromedio
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
		Si (numeroEntry <> -1) Y (numeroEntry > 0) Entonces
			acumulado = acumulado + numeroEntry
			cantidad = cantidad + 1
		FinSi
	Fin Mientras
	Escribir "Gracias por participar, el total es ", acumulado/cantidad
FinAlgoritmo

