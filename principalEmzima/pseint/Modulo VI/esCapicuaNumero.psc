Funcion isCapicua <- esCapicua ( cifra )
	Definir isCapicua Como Logico
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
	Definir  cifra Como Real
	Escribir 'Escribe, el numero '
	Leer cifra
	
	Escribir 'Es el numero ' cifra ' capicua? ' esCapicua(cifra)
FinAlgoritmo
