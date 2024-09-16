// Actividad 3
// Crea una matriz con 3 columnas y una cantidad de filas definida por el usuario. En las dos primeras columnas, el usuario ingresará valores enteros (puede diseñar este ingreso de manera aleatoria para enviar la carga manual). En la tercera columna se almacenará el resultado de sumar los números de la primera y segunda columna. La matriz se mostrará de la siguiente forma:
//
//	3  5  8 => 8 se obtuvo de sumar 3 + 5 
//	4  3  7 ? 7 se obtuvo de sumar 4 + 3 
//	1  4  5 ? 5 se obtuvo de sumar 1 +4 



SubProceso ingresarFilaColumna (numRow Por Referencia,numCol Por Referencia)
	Definir i,j,valUno Como Real
	Escribir "Indique cantidad de filas "
	Leer numRow
	Escribir "Indique cantidad de columnas "
	Leer numCol
FinSubProceso

SubProceso crearMatriz (type Por Valor,numRow Por Valor,numCol Por Valor,matrix Por Referencia)
	Definir i,j,z,valUno,sum Como Real
	Para i = 0 Hasta numRow-1 Hacer
		Para j = 0 Hasta numCol-1 Hacer
			Segun type Hacer
				"user":
					Escribir "Indique el valor (" i, j ")"
					Leer valUno
					matrix[i,j] = valUno
				"azarEntero0a100":
					matrix[i,j] = Aleatorio(0,100)
				"azarEntero1a100":
					matrix[i,j] = Aleatorio(0,100)
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

Funcion mostrarMatriz (type,numRow,numCol,matrix)
	Definir i,j Como Real
	Segun  type Hacer
		"normal":
			Escribir "La matriz es "
			Para i = 0 Hasta numRow-1 Hacer
				Para j = 0 Hasta numCol-1 Hacer
					Escribir Sin Saltar matrix[i,j] ", "
				FinPara
				Escribir ""
			FinPara
		"transpuesta":
			Escribir "La matriz transpuesta es "
			Para j = 0 Hasta numCol-1 Hacer
				Para i = 0 Hasta numRow-1 Hacer
					Escribir Sin Saltar matrix[i,j] ", "
				FinPara
				Escribir ""
			FinPara
	FinSegun
Fin Funcion

SubProceso operarMatriz (type Por Valor,numRow Por Valor,numCol Por Valor,matrix Por Referencia)
	Definir i,j,sum Como Real
	sum = 0
	Segun type Hacer
		"sumAll":
			Para i = 0 Hasta numRow-1 Hacer
				Para j = 0 Hasta numCol-1 Hacer
					sum = sum + matrix[i,j] 
				FinPara
			FinPara
			Escribir "La suma de todos los elementos de la matriz es " sum
		"sumAllrecu":
			Escribir "aca"
	FinSegun
FinSubProceso


Algoritmo matrizSumaUltimaColumna
	// Se define real porque es menos probable que se rompa en ejecucion en el ingreso de la variable y se mantiene para otros de los casos por economia de codigo
	Definir numRow,numCol,matrix Como Real
	Definir type Como Caracter
	ingresarFilaColumna(numRow,numCol)
	//type = "azarEntero0a100"
	type = "ultimaColumnaSuma"
	dimension matrix[numRow,numCol]
	crearMatriz(type,numRow,numCol,matrix)
	mostrarMatriz("normal",numRow,numCol,matrix)
	//mostrarMatriz("transpuesta",numRow,numCol,matrix)
FinAlgoritmo


