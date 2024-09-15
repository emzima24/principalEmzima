// Actividad 5 OTRA FORMA DE HACERLO POR JODER NADA MAS
// Crear un programa que lea un número entero (que represente la altura) y que genere una escalera invertida de asteriscos con esa altura. Por ejemplo, si ingresamos una altura de 5, se deberá mostrar:
// 
// *****
// ****
// ***
// **
// *



Algoritmo EscaleraAsteriscosOtro
	// Se define real porque es menos probable que se rompa en ejecucion en el ingreso de la variable
	Definir numberEntryOne,numberEntryTwo,numberEntryThree  Como Real
	Escribir Sin Saltar"Introduce un número "
	Leer numberEntryTwo 
	Para numberEntryOne<- 1 Hasta numberEntryTwo Con Paso 1 Hacer
		Para numberEntryThree<- 1 Hasta  (numberEntryTwo- numberEntryOne+1) Con Paso 1 Hacer
			Escribir sin saltar "*"
		Fin Para
		Escribir ""
	Fin Para
FinAlgoritmo
