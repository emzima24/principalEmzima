// Actividad 5
// Crea una función que determine si un número ingresado por el usuario es primo. Un número es primo
// si solo es divisible por 1 y por sí mismo (por ejemplo: 2, 3, 5, 7, 11, 13, 17, etc.) . Recuerda nombrar y guardar tu algoritmo.



Funcion count <- esPrimo (numberEntry)
	// Se define real por costumbre mas que por otra razon cuando la memoria importe lo consideraremos distinto
	Definir element,count Como Real
	count = 0
	Para element<- 1 Hasta numberEntry Con Paso 1 Hacer
		Si ((numberEntry MOD element) = 0) Entonces
			count = 1 + count
		FinSi
	FinPara
Fin Funcion

Algoritmo primoFuncion
	// Se define real porque es menos probable que se rompa en ejecucion en el ingreso de la variable
	Definir numberEntry Como Real
	Escribir Sin Saltar"Introduce un número "
	Leer numberEntry
	
	Si numberEntry > 1 Entonces
		Si esPrimo(numberEntry) = 2 Entonces
			Escribir "El número ",numberEntry," es primo"
		SiNo
			Escribir "El número ",numberEntry," NO es primo"
		FinSi
	SiNo
		Escribir "El número ",numberEntry," no es ni primo ni compuesto"
	FinSi
FinAlgoritmo
