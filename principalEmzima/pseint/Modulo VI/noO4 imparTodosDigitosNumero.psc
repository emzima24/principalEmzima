// Complementario 4
// Dise�a una funci�n que determine si todos los d�gitos de un n�mero ingresado por el usuario son
// impares (por ejemplo: 333, 55, etc.). Para ello, separa el n�mero en d�gitos y verifica si cada
// uno es par o impar. Nota: recuerda el uso de las funciones Mod y Trunc. No conviertas el n�mero a cadena para realizar el ejercicio.



Funcion isImpar <- imparTodosDigitos ( cifra )
	// Se define real por costumbre mas que por otra razon cuando la memoria importe lo consideraremos distinto
	Definir isImpar Como Logico
	Definir  digito Como Real
	isImpar = Verdadero
	//sumDig = cifra mod 10
	Si cifra = 0 Entonces
		isImpar = Falso
	FinSi
	
	Mientras cifra > 0 Y isImpar Hacer
		digito = cifra MOD 10
		Si ((digito MOD 2) = 0) Entonces
			isImpar = Falso
		Fin Si
		cifra = trunc(cifra/10)
	Fin Mientras
Fin Funcion

Algoritmo imparTodosDigitosNumero
	// Se define real porque es menos probable que se rompa en ejecucion en el ingreso de la variable
	Definir  cifra Como Real
	Escribir 'Escribe, el numero '
	Leer cifra

	Escribir 'Todos los digitos de ' cifra ' son impares? ' imparTodosDigitos(cifra)
FinAlgoritmo
