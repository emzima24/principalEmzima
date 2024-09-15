// Complementario 2
// Crea un programa que calcule la suma de los primeros N números naturales, donde el valor de N se lee desde el teclado. 
// Por ejemplo, si el usuario ingresa 4 se deberá calcular y mostrar en pantalla la suma de 1 + 2 + 3 + 4. 



Algoritmo sumaNnaturales
	// Se define real porque es menos probable que se rompa en ejecucion en el ingreso de la variable
	Definir numberEntry,numberEntryTwo,sum Como Real
	Escribir Sin Saltar"Introduce un número "
	Leer numberEntryTwo 
	//numberEntryTwo = 6
	sum = 0
	Para numberEntry<- 1 Hasta numberEntryTwo Con Paso 1 Hacer
		sum = sum + numberEntry 
	Fin Para
	Escribir "La suma de los primeros ",numberEntry," naturales es igual a ",sum
FinAlgoritmo
