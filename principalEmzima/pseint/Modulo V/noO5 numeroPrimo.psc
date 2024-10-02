// Complementario 5
// Diseña un programa que permita al usuario ingresar un número entero y determine si es primo o no. 
// Utiliza estructuras anidadas para iterar sobre los posibles divisores del número y determinar si
// es divisible solo por 1 y por sí mismo. Muestra un mensaje indicando si el número es primo o no.



Algoritmo numeroPrimo
	// Se define real porque es menos probable que se rompa en ejecucion en el ingreso de la variable
	Definir numberEntry,element,count Como Real
	Escribir Sin Saltar"Introduce un número "
	Leer numberEntry
	count = 0
	//numberEntry = 7
	Si numberEntry > 1 Entonces
		Para element<- 1 Hasta numberEntry Con Paso 1 Hacer
			Si ((numberEntry MOD element) = 0) Entonces
				count = 1 + count
			FinSi
		FinPara
		Si count = 2 Entonces
			Escribir "El número ",numberEntry," es primo"
		SiNo
			Escribir "El número ",numberEntry," NO es primo"
		FinSi
	SiNo
		Escribir "El número ",numberEntry," no es ni primo ni compuesto"
	FinSi
FinAlgoritmo
