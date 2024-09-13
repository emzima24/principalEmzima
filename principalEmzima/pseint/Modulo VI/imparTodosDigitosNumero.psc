Funcion isImpar <- imparTodosDigitos ( cifra )
	Definir isImpar Como Logico
	Definir  digito Como Real
	isImpar = Verdadero
	//sumDig = cifra mod 10
	
	Mientras cifra > 0 Hacer
		digito = cifra MOD 10
		Si ((digito MOD 2) = 0) Entonces
			isImpar = Falso
		Fin Si
		cifra = trunc(cifra/10)
	Fin Mientras
Fin Funcion

Algoritmo imparTodosDigitosNumero
	Definir  cifra Como Real
	Escribir 'Escribe, el numero '
	Leer cifra

	Escribir 'Todos los digitos de ' cifra ' son impares? ' imparTodosDigitos(cifra)
FinAlgoritmo
