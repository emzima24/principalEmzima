// Complementario 1
// Se desea crear un programa que realice dos subprocesos:
//
//		* En el primer subproceso se rellenará una matriz cuadrada con números aleatorios, 
//		excepto en la diagonal principal, la cual estará compuesta por ceros. La dimensión 
// 		de la matriz será elegida por el desarrollador mientras sea cuadrada.
//		* En el segundo subproceso se imprimirá la matriz resultante.
// Después de ejecutar ambos subprocesos, se mostrará la matriz generada por pantalla. 



SubProceso ingresarFilaColumna (type Por Valor, numRow Por Referencia,numCol Por Referencia)
	Definir i,j Como Real
	Si type = "cuadrada" Entonces
		Escribir "Indique cantidad de filas y columnas "
		Leer numRow
		numCol = numRow
	SiNo
		Escribir "Indique cantidad de filas "
		Leer numRow
		Escribir "Indique cantidad de columnas "
		Leer numCol
	FinSi
FinSubProceso

SubProceso crearMatriz (type Por Valor,numRow Por Valor,numCol Por Valor,matrix Por Referencia)
	Definir i,j,valUno,valDos Como Real
	Para i = 0 Hasta numRow-1 Hacer
		Para j = 0 Hasta numCol-1 Hacer
			Segun type Hacer
				"user":
					Escribir "Indique el valor (" i, j ")"
					Leer valUno
					matrix[i,j] = valUno
				"azarEntero":
					matrix[i,j] = Aleatorio(10,40)
				"azarEnteroDiagonal":
					Si i = j Entonces
						matrix[i,j] = 0
					SiNo
						matrix[i,j] = Aleatorio(1,250)
					FinSi
				"azarEnteroSel":
					Escribir "Del valor inicial "
					Leer valUno
					Escribir "Del valor final "
					Leer valDos
					matrix[i,j] = Aleatorio(valUno,valDos)
				"azarReal":
					matrix[i,j] = Aleatorio(0,1000)/10
				"azarRealSel":
					Escribir "Del valor inicial "
					Leer valUno
					Escribir "Del valor final "
					Leer valDos
					matrix[i,j] = Aleatorio(valUno,valDos)/10
			FinSegun
		FinPara
	FinPara
FinSubProceso

Funcion mostrarMatriz (numRow,numCol,matrix)
	Definir i,j Como Real
	Escribir "La matriz es "
	Para i = 0 Hasta numRow-1 Hacer
		Para j = 0 Hasta numCol-1 Hacer
			Escribir Sin Saltar matrix[i,j] ", " //(" i "," j ")"
		FinPara
		Escribir ""
	FinPara
Fin Funcion

SubProceso operarMatriz (type Por Valor,numRow Por Valor,numCol Por Valor,matrix Por Referencia)
	Definir i,j,sum,numSerc,count, posI, posJ Como Real
	sum = 0
	count = 0
	Segun type Hacer
		"sumAll":
			Para i = 0 Hasta numRow-1 Hacer
				Para j = 0 Hasta numCol-1 Hacer
					sum = sum + matrix[i,j] 
				FinPara
			FinPara
			Escribir "La suma de todos los elementos de la matriz es " sum
		"buscar":
			Escribir "Indique el numero que desea buscar "
			Leer numSerc
			Para i = 0 Hasta numRow-1 Hacer
				Para j = 0 Hasta numCol-1 Hacer
					Si numSerc = matrix[i,j] Y count = 0 Entonces
						count = count + 1
						posI = i
						posJ = j
					FinSi
				FinPara
			FinPara
			Si count = 0 Entonces
				Escribir "El numero " numSerc " no esta presente en la matriz"
			SiNo
				Escribir "El numero " numSerc " su primera posición en la matriz (si existe mas de una vez) es (" posI "," posJ ")"
			FinSi
	FinSegun
FinSubProceso


Algoritmo diagonalMatriz
	// Se define real porque es menos probable que se rompa en ejecucion en el ingreso de la variable y se mantiene para otros de los casos por economia de codigo
	Definir numRow,numCol,matrix Como Real
	Definir type Como Caracter
	type = "cuadrada"
	ingresarFilaColumna(type,numRow,numCol)
	type = "azarEnteroDiagonal"
	dimension matrix[numRow,numCol]
	crearMatriz(type,numRow,numCol,matrix)
	mostrarMatriz(numRow,numCol,matrix)
FinAlgoritmo
