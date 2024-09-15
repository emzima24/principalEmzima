// Actividad 4
// Elabora un algoritmo que genere e imprima las tablas de multiplicar del 1 al 10. 
// Se espera que en la salida por pantalla se presente cada tabla de multiplicar de la siguiente manera: (se inserta imagen)



Algoritmo tablasMultiplicar
	// Se define real por costumbre mas que por otra razon cuando la memoria importe lo consideraremos distinto
	Definir numberEntryOne,numberEntryTwo  Como Real
	Para numberEntryOne<- 1 Hasta 10 Con Paso 1 Hacer
		Para numberEntryTwo<- 1 Hasta 10 Con Paso 1 Hacer
			Escribir numberEntryOne," x ",numberEntryTwo," = ",numberEntryOne*numberEntryTwo
		Fin Para
		Escribir "---------------------"
	Fin Para
FinAlgoritmo
