Funcion mostrarVector( number, tamanho )
	Definir i Como Real
	Escribir Sin Saltar"El arreglo es "
	Para i <- 0 Hasta tamanho-1 Hacer
		Escribir Sin Saltar number[i] ", "
	FinPara
	Escribir ""
Fin Funcion

Funcion NumberMax <- maximo ( number, tamanho )
	Definir NumberMax,i Como Real
	NumberMax = number[0]
	Para i <- 0 Hasta tamanho -1 Hacer
		Si NumberMax < number[i] Entonces
			NumberMax = number[i]
		FinSi
	FinPara
Fin Funcion

Algoritmo arregloFuncion
	Definir number,i,tamanho Como Real
	Escribir Sin Saltar "Tamaño del arreglo "
	Leer tamanho
	Dimension number[tamanho]
	Para i <- 0 Hasta tamanho- 1 Hacer
		//Escribir Sin Saltar"Valor " i
		//Leer number[i]
		number[i] = Aleatorio(1,25)
		//Escribir i +1
	FinPara
	Escribir ""
	Escribir "el maximo " maximo( number, tamanho )
	mostrarVector( number, tamanho )
FinAlgoritmo