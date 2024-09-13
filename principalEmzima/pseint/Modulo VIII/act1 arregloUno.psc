Funcion mostrarVector( number, tamanho )
	Definir i Como Real
	Escribir Sin Saltar"El arreglo es "
	Para i <- 0 Hasta tamanho-1 Hacer
		Escribir Sin Saltar number[i] ", "
	FinPara
	Escribir ""
Fin Funcion

Algoritmo arregloUno
	Definir valores Como Caracter
	Definir i Como Real
	Dimension valores[5]
	Para i <- 0 Hasta 4 Hacer
		Escribir Sin Saltar"Valor " i
		Leer valores[i]
	FinPara
	Escribir ""
	Escribir Sin Saltar"El arreglo es "
	Para i <- 0 Hasta 4 Hacer
		Escribir Sin Saltar valores[i]
	FinPara
	Escribir ""
	//mostrarVector( valores, 5 )
FinAlgoritmo
