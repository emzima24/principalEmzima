// Complementario 5
// Dise�a un programa que permita al usuario ingresar un n�mero entero y determine si es primo o no. 
// Utiliza estructuras anidadas para iterar sobre los posibles divisores del n�mero y determinar si
// es divisible solo por 1 y por s� mismo. Muestra un mensaje indicando si el n�mero es primo o no.



Algoritmo numeroPrimo
	// Se define real porque es menos probable que se rompa en ejecucion en el ingreso de la variable
	Definir numberEntry,element,count Como Real
	Escribir Sin Saltar"Introduce un n�mero "
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
			Escribir "El n�mero ",numberEntry," es primo"
		SiNo
			Escribir "El n�mero ",numberEntry," NO es primo"
		FinSi
	SiNo
		Escribir "El n�mero ",numberEntry," no es ni primo ni compuesto"
	FinSi
FinAlgoritmo
