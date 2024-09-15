// Complementario 8
// Realizar una función que reciba un número ingresado por el usuario y averigüe si el número es 
// capicúa o no (Por ejemplo: 12321). Nota: recordar el uso del MOD y el Trunc. 
// No podemos transformar el número a cadena para realizar el ejercicio.



Funcion cifraInvertida <- invertir ( cifra,cifraInvertida )
	//Escribir cifraInvertida
	Si cifra = 0 Entonces
		cifraInvertida = cifraInvertida
	SiNo
		cifraInvertida = invertir( trunc(cifra/10), (cifraInvertida*10 + cifra MOD 10))
		
	FinSi
		
Fin Funcion

Funcion isCapicua <- esCapicua ( cifra )
	Definir isCapicua Como Logico
	Definir  digito,cifraOrigen,cifraInvertida Como Real
	isCapicua = Falso
	cifraOrigen = cifra 
	cifraInvertida = 0
	cifraInvertida = invertir( cifra, cifraInvertida)
	
	Si cifraInvertida = cifraOrigen Entonces
		isCapicua = Verdadero
	Fin Si
Fin Funcion

Algoritmo esCapicuaNumero
	// Se define real porque es menos probable que se rompa en ejecucion en el ingreso de la variable y se mantiene para todos los casos por economia de codigo
	Definir  cifra Como Real
	Escribir 'Escribe, el numero '
	Leer cifra
	
	//Escribir cifra MOD 10
	//Escribir trunc(cifra/10)
	//Escribir  invertir(cifra,0)
	Escribir 'Es el numero ' cifra ' capicua? ' esCapicua(cifra)
FinAlgoritmo
