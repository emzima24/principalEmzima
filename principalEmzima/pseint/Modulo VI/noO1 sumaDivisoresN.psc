// Complementario  1
// Diseña una función que calcule y retorne la suma de todos los divisores de un número n, excluyendo n.
// El valor de n debe ser ingresado por el usuario. Recuerda nombrar y guardar tu algoritmo.



Funcion sumaDiv <- sumaDivisores ( numberEntry )
//	// Se define real por costumbre mas que por otra razon cuando la memoria importe lo consideraremos distinto
	Definir element,sumaDiv Como Real
	sumaDiv = 0
	Para element<- 1 Hasta numberEntry -1 Con Paso 1 Hacer
		Si ((numberEntry MOD element) = 0) Entonces
			sumaDiv = 1 + sumaDiv
		FinSi
	FinPara
Fin Funcion

Algoritmo sumaDivisoresN
	// Se define real porque es menos probable que se rompa en ejecucion en el ingreso de la variable
	Definir numberEntry Como Real
	Escribir Sin Saltar"Introduce un número "
	Leer numberEntry
	
	Si numberEntry > 1 Entonces
		Escribir "La suma de los divisores del número " numberEntry " da como resultado " sumaDivisores(numberEntry)
	SiNo
		Escribir "El número ",numberEntry," no aplica para el concepto"
	FinSi
FinAlgoritmo
