// Actividad 5
// Crear un programa que lea un n�mero entero (que represente la altura) y que genere una escalera invertida de asteriscos con esa altura. Por ejemplo, si ingresamos una altura de 5, se deber� mostrar:
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
	Escribir Sin Saltar"Introduce un n�mero "
	Leer numberEntryTwo 
	Para numberEntryOne<- 1 Hasta numberEntryTwo Con Paso 1 Hacer
		textEntrySave = ""
		Para numberEntryThree<- 1 Hasta  (numberEntryTwo- numberEntryOne+1) Con Paso 1 Hacer
			textEntrySave = textEntrySave+"*"
		Fin Para
		Escribir textEntrySave
	Fin Para
FinAlgoritmo
