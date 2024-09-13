Funcion mostrarVector( number, tamanho )
	Definir i Como Real
	Escribir Sin Saltar"El arreglo es "
	Para i <- 0 Hasta tamanho-1 Hacer
		Escribir Sin Saltar number[i] ", "
	FinPara
	Escribir ""
Fin Funcion

Algoritmo arregloVariable
	Definir valores,i,suma,mult Como Real
	Dimension valores[10]
	suma = 0
	mult = 1
	Para i <- 0 Hasta 9 Hacer
		Escribir Sin Saltar"Valor " i
		//Leer valores[i]
		valores[i] = i +1
		//Escribir i +1
	FinPara
	Escribir ""
	Escribir Sin Saltar"El arreglo es "
	Para i <- 0 Hasta 9 Hacer
		suma = suma + valores[i]
		mult = mult*valores[i]
	FinPara
	Escribir "La suma es " suma
	Escribir "La multiplicacion es " mult
	//mostrarVector( valores, 10 )
FinAlgoritmo
