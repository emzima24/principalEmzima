// Complementario 6
// Diseña una función que determine si un número ingresado por el usuario es capicúa (por ejemplo: 12321).
// Nota: recuerda el uso de MOD y Trunc. No conviertas el número a cadena para realizar el ejercicio.
// Se define real porque es menos probable que se rompa en ejecucion en el ingreso de la variable y se mantiene para todos los casos por economia de codigo



Funcion isCapicua <- esCapicua ( cifra )
	Definir isCapicua Como Logico
	// Se define real por costumbre mas que por otra razon cuando la memoria importe lo consideraremos distinto
	Definir  digito,cifraOrigen,cifraInvertida Como Real
	isCapicua = Falso
	cifraOrigen = cifra 
	cifraInvertida = 0
	
	Mientras cifra > 0 Hacer
		//digito = cifra MOD 10
		cifraInvertida = cifraInvertida*10 + (cifra MOD 10)
		cifra = trunc(cifra/10)
	Fin Mientras
	Escribir cifraInvertida
	Si cifraInvertida = cifraOrigen Y cifraOrigen>10 Entonces
		isCapicua = Verdadero
	Fin Si
Fin Funcion

Algoritmo esCapicuaNumero
	// Se define real porque es menos probable que se rompa en ejecucion en el ingreso de la variable
	Definir  cifra Como Real
	Escribir 'Escribe, el numero '
	Leer cifra
	
	Escribir 'Es el numero ' cifra ' capicua? ' esCapicua(cifra)
FinAlgoritmo
