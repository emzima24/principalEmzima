// Actividad 1
// Crea un programa que solicite al usuario ingresar 5 valores. Los valores ingresados deben ser 
// almacenados en un único arreglo.y debe mostrarlos posteriormente por pantalla. Sigue estos pasos:
//
// 		1. Declara el tipo de dato que almacenará el vector.
//		2. Define la dimensión del arreglo.
//		3. Utiliza un bucle para recorrer el arreglo recién creado, posición por posición, y solicitar 
// 		al usuario que introduzca un dato. Puedes emplear una estructura de bucle "Para" para esta tarea. 
// Se define real porque es menos probable que se rompa en ejecucion en el ingreso de la variable
// Se define real por costumbre mas que por otra razon cuando la memoria importe lo consideraremos distinto



Funcion mostrarVector( number, tamanho )
	Definir i Como Real
	Escribir Sin Saltar"El arreglo es "
	Para i <- 0 Hasta tamanho-1 Hacer
		Escribir Sin Saltar number[i] ", "
	FinPara
	Escribir ""
Fin Funcion

Algoritmo arregloUno
	// Se define real porque es menos probable que se rompa en ejecucion en el ingreso de la variable y se mantiene para todos los casos por economia de codigo
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
