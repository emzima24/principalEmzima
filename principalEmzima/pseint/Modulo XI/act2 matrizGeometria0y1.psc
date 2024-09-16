// Actividad 2
// Desarrolla un programa que genere una matriz de tamaño 5x15. Tu tarea 
// consiste en llenar la matriz con unos y ceros, donde los 1 ocupan el 
// borde externo de la matriz y los 0 llenarán el área interior.
//
// Por ejemplo, el aspecto final de tu matriz deberá ser el siguiente:
//	
//	111111111111111
//	100000000000001
//	100000000000001
//	100000000000001
//	111111111111111



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


Algoritmo matrizGeometria0y1
	// Se define real porque es menos probable que se rompa en ejecucion en el ingreso de la variable y se mantiene para otros de los casos por economia de codigo
	Definir numRow,numCol,matrix Como Real
	Definir type Como Caracter
	ingresarFilaColumna(numRow,numCol)
	//type = "azarEntero0a100"
	type = "unosCeroGeometrico"
	dimension matrix[numRow,numCol]
	crearMatriz(type,numRow,numCol,matrix)
	mostrarMatriz("normal",numRow,numCol,matrix)
	//mostrarMatriz("transpuesta",numRow,numCol,matrix)
FinAlgoritmo

