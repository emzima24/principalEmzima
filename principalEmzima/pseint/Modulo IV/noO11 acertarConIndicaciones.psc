// Complementario 11
// Programa un juego en el que la computadora elija un número aleatorio entre 1 y 10,
// y el jugador tenga que adivinarlo. El programa seguirá estos pasos:
//
// La computadora elige al azar un número "n" entre 1 y 10.
//
// El usuario ingresa un número "x".
//
// Si "x" no es el número exacto, el programa indica si "n" es mayor o menor que "x".
//		
// Se repite desde el paso 2 hasta que "x" sea igual a "n". El programa imprimirá los
// mensajes adecuados para guiar al usuario hasta que adivine el número. 
//			
// Utiliza la estructura repetitiva repetir-mientras para resolver esta actividad.



Algoritmo acertarConIndicaciones
	// Se define real porque es menos probable que se rompa en ejecucion en el ingreso de la variable
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
