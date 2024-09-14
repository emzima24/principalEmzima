// Complementario 3
// Crea un programa que solicite al usuario dos números enteros, mínimo y máximo. Luego, solicita 
// al usuario que ingrese números enteros que estén dentro del intervalo entre el máximo y el mínimo. 
// Por cada número ingresado dentro de este intervalo, se suma uno a una variable. El programa 
// finalizará cuando se ingrese un número que no pertenezca a este intervalo. Al finalizar, 
// se mostrará la cantidad de números ingresados dentro del intervalo. 
// Utiliza la estructura repetitiva mientras para resolver esta actividad.



Algoritmo mayorMenor
	// Se define real porque es menos probable que se rompa en ejecucion en el ingreso del numero
	Definir minimo,maximo,numeroEntry,acumulado Como Real
	Escribir sin saltar "Escribe un entero que sera el valor minimo "
	Leer minimo
	//minimo = 0
	Escribir sin saltar "Escribe un entero que sera el valor maximo"
	Leer maximo
	//maximo = 1000
	Escribir sin saltar "Escribe un numero  "
	Leer numeroEntry
	acumulado = 0
	Mientras ((minimo <= numeroEntry) Y (maximo >= numeroEntry))
		Escribir sin saltar "Escribe un numero  "
		Leer numeroEntry
		acumulado = acumulado + 1
	Fin Mientras
	Escribir "Ingresaste en total, dentro de los limites ",acumulado
FinAlgoritmo
