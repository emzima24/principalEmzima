Funcion mostrarVector( number, tamanho )
	Definir i Como Real
	Escribir Sin Saltar"El arreglo es "
	Para i <- 0 Hasta tamanho-1 Hacer
		Escribir Sin Saltar number[i] ", "
	FinPara
	Escribir ""
Fin Funcion

Algoritmo arregloVariable
	Definir number,i,numberIncog,tamanho,count Como Entero
	Escribir Sin Saltar "Tamaño del arreglo "
	Leer tamanho
	Dimension number[tamanho]
	count = 0
	Para i <- 0 Hasta tamanho- 1 Hacer
		//Escribir Sin Saltar"Valor " i
		//Leer number[i]
		number[i] = Aleatorio(1,25)
		//Escribir i +1
	FinPara
	Escribir ""
	Escribir Sin Saltar "Indique un numero para probar "
	Leer numberIncog
	Para i <- 0 Hasta tamanho-1 Hacer
		Si numberIncog = number[i] Entonces
			count = count + 1
			Escribir "Posicion " i " vez " count
		FinSi
	FinPara
	Si count = 0 Entonces
		Escribir "No estaba en el arreglo"
	FinSi
	mostrarVector( number, tamanho )
FinAlgoritmo