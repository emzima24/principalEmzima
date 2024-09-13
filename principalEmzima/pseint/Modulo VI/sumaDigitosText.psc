Funcion sumDig <- sumaDigitos ( cifra )
	Definir i,sumDig Como Real
	sumDig = 0
	Para i<-0 Hasta Longitud(cifra) Hacer
		sumDig = sumDig + ConvertirANumero(SubCadena(cifra,i,i))
	FinPara
Fin Funcion

Algoritmo sumaDigitosText
	Definir i Como Real
	Definir  cifra Como Caracter
	Escribir 'Escribe, el numero '
	Leer cifra
	Escribir 'La suma de los digitos de ' cifra ' es ' sumaDigitos(cifra)
FinAlgoritmo
