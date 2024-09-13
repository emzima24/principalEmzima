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
	Definir  cifra Como Real
	Escribir 'Escribe, el numero '
	Leer cifra
	
	//Escribir cifra MOD 10
	//Escribir trunc(cifra/10)
	//Escribir  invertir(cifra,0)
	Escribir 'Es el numero ' cifra ' capicua? ' esCapicua(cifra)
FinAlgoritmo
