// Complementario 3
// Crea un programa que solicite al usuario dos n�meros enteros, m�nimo y m�ximo. Luego, solicita 
// al usuario que ingrese n�meros enteros que est�n dentro del intervalo entre el m�ximo y el m�nimo. 
// Por cada n�mero ingresado dentro de este intervalo, se suma uno a una variable. El programa 
// finalizar� cuando se ingrese un n�mero que no pertenezca a este intervalo. Al finalizar, 
// se mostrar� la cantidad de n�meros ingresados dentro del intervalo. 
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
