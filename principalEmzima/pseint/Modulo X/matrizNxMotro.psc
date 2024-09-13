SubProceso ingresarFilaColumna (numRow Por Referencia,numCol Por Referencia)
	Definir i,j,valUno Como Real
	Escribir "Indique cantidad de filas "
	Leer numRow
	Escribir "Indique cantidad de columnas "
	Leer numCol
FinSubProceso

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

Funcion  sum <- operarMatriz (type,numRow,numCol,i, j, matrix )
	Definir sum Como Real
	sum = 0
	Segun type Hacer
		"sumAll":
			Para i = 0 Hasta numRow-1 Hacer
				Para j = 0 Hasta numCol-1 Hacer
					sum = sum + matrix[i,j] 
				FinPara
			FinPara
		"sumAllrecu":
			Si i = 0 Entonces
				sum = 0
			SiNo
				si j = 0 Entonces
					sum = operarMatriz("sumAllrecu",numRow,numCol,i-1,numCol,matrix)
				SiNo
					sum = matrix[i-1,j-1] + operarMatriz("sumAllrecu",numRow,numCol,i,j-1,matrix)
				FinSi
			FinSi
	FinSegun
FinFuncion

Algoritmo matrizNxM
	Definir numRow,numCol,matrix Como Real
	Definir type Como Caracter
	ingresarFilaColumna(numRow,numCol)
	type = "azarEntero"
	dimension matrix[numRow,numCol]
	crearMatriz(type,numRow,numCol,matrix)
	mostrarMatriz(numRow,numCol,matrix)
	Escribir "La suma de todos (logica normal) los elementos de la matriz es " operarMatriz("sumAll",numRow,numCol,numRow,numCol,matrix)
	Escribir "La suma de todos (logica recursiva) los elementos de la matriz es " operarMatriz("sumAllrecu",numRow,numCol,numRow,numCol,matrix)
FinAlgoritmo