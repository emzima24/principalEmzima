// Actividad 2
// Realiza un programa que lea 10 números reales por teclado, los almacene en un arreglo y 
// muestre por pantalla la suma y multiplicación de todos los números ingresados al arreglo.
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

Algoritmo arregloVariable
	// Se define real porque es menos probable que se rompa en ejecucion en el ingreso de la variable y se mantiene para todos los casos por economia de codigo
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
