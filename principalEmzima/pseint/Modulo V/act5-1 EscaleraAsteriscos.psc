// Actividad 5
// Crear un programa que lea un número entero (que represente la altura) y que genere una escalera invertida de asteriscos con esa altura. Por ejemplo, si ingresamos una altura de 5, se deberá mostrar:
// 
// *****
// ****
// ***
// **
// *



Algoritmo EscaleraAsteriscos
	// Se define real porque es menos probable que se rompa en ejecucion en el ingreso de la variable
	Definir textEntrySave Como Caracter
	Definir numberEntryOne,numberEntryTwo,numberEntryThree  Como Real
	Escribir Sin Saltar"Introduce un número "
	Leer numberEntryTwo 
	Para numberEntryOne<- 1 Hasta numberEntryTwo Con Paso 1 Hacer
		textEntrySave = ""
		Para numberEntryThree<- 1 Hasta  (numberEntryTwo- numberEntryOne+1) Con Paso 1 Hacer
			textEntrySave = textEntrySave+"*"
		Fin Para
		Escribir textEntrySave
	Fin Para
FinAlgoritmo
