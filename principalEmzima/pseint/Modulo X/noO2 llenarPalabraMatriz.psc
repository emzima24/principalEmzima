// Complementario 2
// Desarrolla un programa para rellenar una matriz de tamaño 3 x 3 con 
// los caracteres de una palabra de longitud 9 proporcionada por el usuario, 
// asegurando que la palabra se muestre de manera continua en la matriz.
//
// Primero, se debe validar que la palabra ingresada por el usuario tenga 
// exactamente 9 caracteres. Luego, se insertará un carácter en cada posición 
// de la matriz. Finalmente, se imprimirá la matriz rellenada por pantalla.
//
// Por ejemplo, si el usuario ingresa la palabra "habilidad", la matriz resultante se vería así:	
//			0	1	2
//		0	H	A	B
//		1	I	L	I
//		2	D	A	D
// Una explicación en forma visual de la resolución se puede ver en 
// https://docs.google.com/spreadsheets/d/1XZUC2BzjYaTDcOBipbDeZIlfXTtfCCvNFRDJzELJEUg/edit?gid=1944097503#gid=1944097503&range=B2:J16




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

SubProceso crearMatrizChar (type Por Valor,numRow Por Valor,numCol Por Valor,matrixChar Por Referencia)
	Definir i,j,count,salto Como Real
	Definir valUno,mensaje Como Caracter
	count = 0
	salto = 0
	Para i = 0 Hasta numRow-1 Hacer
		Para j = 0 Hasta numCol-1 Hacer
			Segun type Hacer
				"user":
					Escribir "Indique el valor (" i, j ")"
					Leer valUno
					matrixChar[i,j] = valUno
				"palabra":
					mensaje = ""
					Repetir
						Si count > 0 Entonces
							mensaje = ", che boludo en serio 9 letras dale!!!"
						FinSi
						Escribir "Introduce la palabra de nueve letras " + mensaje
						Leer valUno
						count = count + 1
					Mientras Que Longitud(valUno) <> 9
					Para i = 0 Hasta numRow-1 Hacer
						Para j = 0 Hasta numCol-1 Hacer
							matrixChar[i,j] = Subcadena(valUno,j+salto,j+salto)
						FinPara
						salto = salto + 3
					FinPara
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


Algoritmo llenarPalabraMatriz
	// Se define real porque es menos probable que se rompa en ejecucion en el ingreso de la variable y se mantiene para otros de los casos por economia de codigo
	Definir numRow,numCol,matrix Como Real
	Definir type, matrixChar Como Caracter
	type = "cuadrada"
	numCol = 3
	numRow = 3
	type = "palabra"
	dimension matrixChar[numRow,numCol]
	crearMatrizChar(type,numRow,numCol,matrixChar)
	mostrarMatriz(numRow,numCol,matrixChar)
FinAlgoritmo

