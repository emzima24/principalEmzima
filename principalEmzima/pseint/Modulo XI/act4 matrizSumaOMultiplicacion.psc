// Actividad 4
// Desarrolla un programa que calcule la multiplicación de dos matrices de enteros
// de tamaño 3x3. Asegúrate de inicializar las matrices para evitar tener que ingresar
// datos desde el teclado. La multiplicación se almacenará en una tercera matriz, 
// donde cada elemento será el resultado de multiplicar los elementos correspondientes en la 
// misma posición de las matrices A y B. Por ejemplo, el elemento en la posición (0,0) de la 
// matriz C será el resultado de multiplicar el elemento en la posición (0,0) de la matriz A 
// con el elemento en la posición (0,0) de la matriz B.
//
//Por ejemplo: 
//	MATRIZ A 	MATRIZ B 		MATRIZ C
//	1  2  3 	 2   4   6		2    8  18
//	4  5  6 	 8  10  12		32  50  72
//	7  8  9  	 2   3   4		14  24  36



SubProceso ingresarFilaColumna (numRow Por Referencia,numCol Por Referencia)
	Definir i,j,valUno Como Real
	Escribir "Indique cantidad de filas "
	Leer numRow
	Escribir "Indique cantidad de columnas "
	Leer numCol
FinSubProceso

SubProceso crearMatriz (type Por Valor,numRow Por Valor,numCol Por Valor,min Por Valor, max por Valor,matrix Por Referencia)
	Definir i,j,z,valUno,sum Como Real
	Para i = 0 Hasta numRow-1 Hacer
		Para j = 0 Hasta numCol-1 Hacer
			Segun type Hacer
				"user":
					Escribir "Indique el valor (" i, j ")"
					Leer valUno
					matrix[i,j] = valUno
				"azarEntero0a100":
					matrix[i,j] = Aleatorio(0,10)
				"azarEnteroMinMax":
					matrix[i,j] = Aleatorio(min,max)
				"azarReal":
					matrix[i,j] = Aleatorio(0,1000)/10
				"unosCeroGeometrico":
					Si (i = 0 O (j=0 O j=numCol-1)) O (i = numRow-1 O (j=0 O j=numCol-1)) Entonces
						matrix[i,j] = 1
					SiNo
						matrix[i,j] = 0
					FinSi
				"ultimaColumnaSuma":
					sum = 0
					Si j<>numCol-1 Entonces
						matrix[i,j] = Aleatorio(1,100)
					SiNo
						Para z = 0 Hasta numCol-2 Hacer
							sum = sum + matrix[i,z]
						FinPara
						matrix[i,j] = sum
					FinSi
			FinSegun
		FinPara
	FinPara
FinSubProceso

Funcion mostrarMatriz (type,numRow,numCol,matrix, nombre)
	Definir i,j Como Real
	Segun  type Hacer
		"normal":
			Escribir "La matriz  " nombre
			Para i = 0 Hasta numRow-1 Hacer
				Para j = 0 Hasta numCol-1 Hacer
					Escribir Sin Saltar matrix[i,j] ", "
				FinPara
				Escribir ""
			FinPara
		"transpuesta":
			Escribir "La matriz transpuesta " nombre
			Para j = 0 Hasta numCol-1 Hacer
				Para i = 0 Hasta numRow-1 Hacer
					Escribir Sin Saltar matrix[i,j] ", "
				FinPara
				Escribir ""
			FinPara
	FinSegun
Fin Funcion

SubProceso operarMatriz (type Por Valor,numRow Por Valor,numCol Por Valor,matrixA Por Referencia,matrixB Por Referencia,matrixC Por Referencia)
	Definir i,j,sum Como Real
	sum = 0
	Segun type Hacer
		"sumAll":
			Para i = 0 Hasta numRow-1 Hacer
				Para j = 0 Hasta numCol-1 Hacer
					sum = sum + matrixA[i,j] 
				FinPara
			FinPara
			Escribir "La suma de todos los elementos de la matriz es " sum
		"multiplicacionDeMatrices":
			Para i = 0 Hasta numRow-1 Hacer
				Para j = 0 Hasta numCol-1 Hacer
					matrixC[i,j] =  matrixA[i,j] * matrixB[i,j] 
				FinPara
			FinPara
		"sumaDeMatrices":
			Para i = 0 Hasta numRow-1 Hacer
				Para j = 0 Hasta numCol-1 Hacer
					matrixC[i,j] =  matrixA[i,j] + matrixB[i,j] 
				FinPara
			FinPara
	FinSegun
FinSubProceso


Algoritmo matrizSumaOMultiplicacion
	// Se define real porque es menos probable que se rompa en ejecucion en el ingreso de la variable y se mantiene para otros de los casos por economia de codigo
	Definir numRow,numCol,matrixA,matrixB,matrixC,min,max Como Real
	Definir type,nombre Como Caracter
	ingresarFilaColumna(numRow,numCol)
	type = "azarEnteroMinMax"
	//type = "ultimaColumnaSuma"
	dimension matrixA[numRow,numCol], matrixB[numRow,numCol], matrixC[numRow,numCol]
	crearMatriz(type,numRow,numCol,1,20,matrixA)
	crearMatriz(type,numRow,numCol,1,20,matrixB)
	//operarMatriz("multiplicacionDeMatrices",numRow,numCol,matrixA,matrixB,matrixC)
	operarMatriz("sumaDeMatrices",numRow,numCol,matrixA,matrixB,matrixC)
	mostrarMatriz("normal",numRow,numCol,matrixA,"A")
	mostrarMatriz("normal",numRow,numCol,matrixB,"B")
	Escribir "La suma de las matrices se refleja en  "
	//Escribir "La multiplicación de las matrices se refleja en "
	mostrarMatriz("normal",numRow,numCol,matrixC,"C")
FinAlgoritmo


