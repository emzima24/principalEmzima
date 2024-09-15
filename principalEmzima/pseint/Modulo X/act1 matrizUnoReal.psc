// Actividad 1
// Crea un programa que solicite al usuario ingresar 9 valores. Los valores ingresados deben ser almacenados en un único arreglo bidimensional (matriz).y debe mostrarlos posteriormente por pantalla. Sigue estos pasos:
//
//		1. Declara el tipo de dato que almacenará la matriz.
//		2. Define la dimensión del arreglo, en este caso, 3X3 (ya que precisamos almacenar 9 datos).
//		3. Utiliza un bucle para recorrer el arreglo recién creado, posición por posición, y solicita 
//		al usuario que introduzca un dato. Puedes emplear una estructura de bucle "Para" para esta tarea. 
//		Recuerda que necesitarás bucles anidados para recorrer cada fila y cada columna, 
//		siendo el bucle externo para las filas y el interno para las columnas.



SubProceso crearMatriz (type Por Valor,numRow Por Valor,numCol Por Valor,matrix Por Referencia)
	Definir i,j,valUno Como Real
	Para i = 0 Hasta numRow-1 Hacer
		Para j = 0 Hasta numCol-1 Hacer
			Segun type Hacer
				"user":
					Escribir "Indique el valor (" i, j ")"
					Leer valUno
					matrix[i,j] = valUno
				"azarEntero":
					matrix[i,j] = Aleatorio(0,100)
				"azarReal":
					matrix[i,j] = Aleatorio(0,1000)/10
			FinSegun
		FinPara
	FinPara
FinSubProceso
	
Funcion mostrarMatriz (numRow,numCol,matrix)
	Definir i,j Como Real
	Escribir "La matriz es "
	Para i = 0 Hasta numRow-1 Hacer
		Para j = 0 Hasta numCol-1 Hacer
			Escribir Sin Saltar matrix[i,j] ", "
		FinPara
		Escribir ""
	FinPara
Fin Funcion

Algoritmo matrizUnoReal
	// Se define real porque es menos probable que se rompa en ejecucion en el ingreso de la variable y se mantiene para otros de los casos por economia de codigo
	Definir numRow,numCol,matrix Como Real
	Definir type Como Caracter
	numRow = 3
	numCol = 3
//	type = "azarEntero"
	type = "user"
	dimension matrix[numRow,numCol]
	crearMatriz(type,numRow,numCol,matrix)
	mostrarMatriz(numRow,numCol,matrix)
FinAlgoritmo
