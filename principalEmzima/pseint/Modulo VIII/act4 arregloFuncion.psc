// Actividad 4
// Desarrolla un programa que rellene un vector de tamaño N, con valores numéricos ingresados por el usuario.
// A continuación, se deberá crear una función que reciba el vector y devuelva el valor más grande del arreglo.



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
	// Se define real porque es menos probable que se rompa en ejecucion en el ingreso de la variable y se mantiene para todos los casos por economia de codigo
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