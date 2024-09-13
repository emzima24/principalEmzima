Algoritmo acertarConIndicaciones
	Definir numeroIngresado,numeroAzar Como Real
	numeroAzar = azar(11)+1
	Repetir
		Escribir sin saltar "Escribe el numero "
		Leer numeroIngresado
		Si (numeroIngresado < numeroAzar) Entonces
			Escribir "El numero ingresado es menor al de la compu "//,numeroAzar
		FinSi
		Si (numeroIngresado > numeroAzar) Entonces
			Escribir "El numero ingresado es mayor al de la compu "//,numeroAzar
		FinSi
	Mientras Que (numeroIngresado <> numeroAzar)
	Escribir "Acertaste el numero de la compu ",numeroIngresado
FinAlgoritmo
