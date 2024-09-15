// Complementario 3
// Un ejemplo de una matriz mágica es una matriz cuadrada, donde el número de filas es igual al número de columnas, 
// y que tiene la propiedad especial de que la suma de sus filas, columnas y diagonales es igual. Por ejemplo:
//			0	1	2
//		0	2	7	6
//		1	9	5	1
//		2	4	3	8
// En el ejemplo dado, las sumas siempre dan como resultado 15. Se plantea el problema de construir un algoritmo que 
// verifique si una matriz de datos enteros es mágica o no. En caso de serlo, el programa debe escribir la suma total. 
// Además, el programa debe validar que los números introducidos estén en el rango de 1 a 9. 
// El usuario define el tamaño de la matriz, que no debe exceder un orden de 10.
// Una explicación en forma visual de la resolución se puede ver en 
//https://docs.google.com/spreadsheets/d/1XZUC2BzjYaTDcOBipbDeZIlfXTtfCCvNFRDJzELJEUg/edit?gid=1514302018#gid=1514302018&range=C2:L15



SubProceso ingresarFilaColumna (type Por Valor, numRow Por Referencia,numCol Por Referencia)
	Definir i,j,count,valUno,arreglo,temp Como Real
	Definir  mensaje Como Caracter
	count = 0
	Segun type Hacer
	"cuadrada":
		Escribir "Indique cantidad de filas y columnas "
		Leer numRow
		numCol = numRow
	"cuadradaMagica":
		mensaje = ""
		Repetir
			Si count > 0 Entonces
				mensaje = ", che boludo en serio entre 2 y 10 dale!!!"
			FinSi
			Escribir "Introduce un numero del 2 al 10 (cantidad de filas y columnas) " + mensaje
			Leer numRow
//			numRow = 3
			numCol = numRow
			count = count + 1
		Mientras Que numRow < 2 O numRow > 10
	"otro":
		Escribir "Indique cantidad de filas "
		Leer numRow
		Escribir "Indique cantidad de columnas "
		Leer numCol
		
	FinSegun
FinSubProceso

SubProceso crearMatriz (type Por Valor,numRow Por Valor,numCol Por Valor,matrix Por Referencia)
	Definir i,j,valUno,valDos,temp,arreglo,salto Como Real
	Dimension arreglo[9]
	salto = 0
	Para i = 0 Hasta 9-1 Hacer
		arreglo[i] = i + 1
	FinPara
	Para i = 8 Hasta 1 Con Paso -1 Hacer
		j = Aleatorio(1,i)
		temp = arreglo[i]
		arreglo[i] = arreglo[j]
		arreglo[j] = temp 
	FinPara
	Para i = 0 Hasta numRow-1 Hacer
		Para j = 0 Hasta numCol-1 Hacer
			Segun type Hacer
				"user":
					Escribir "Indique el valor (" i, j ")"
					Leer valUno
					matrix[i,j] = valUno
				"azarEntero":
					matrix[i,j] = Aleatorio(1,9)
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
				"azar1a9Entero":
					matrix[i,j] = Aleatorio(1,9)
				"3x3magico":
					matrix[i,j] = arreglo(j+salto)					
			FinSegun
		FinPara
		salto = salto + 3
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
	Definir i,j,sum,numSerc,count, posI, posJ,sumColumna,sumFila Como Real
	Definir isMagico Como Logico
	sum = 0
	count = 0
	isMagico = Verdadero
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
		"magico":
			Dimension  sumFila[numRow], sumColumna[numRow] 
			Para i = 0 Hasta numRow- 1 Hacer
				sum = sum + matrix[i,i]
				count = count + matrix[i,numCol-1-i]
			FinPara
			
			Si sum = count Entonces
				operarMatrizII("sumaFila",numRow,numCol,matrix,sumFila)
				operarMatrizII("sumaColumna",numRow,numCol,matrix,sumColumna)
				Para i = 0 Hasta numCol -1 Hacer
					Si sumFila[i] <> sumColumna[i] Entonces
						isMagico = Falso
					FinSi
				FinPara
				Si isMagico Entonces
					Escribir sin saltar "Como es magica, "
					operarMatriz("sumAll",numRow,numCol,matrix)
				SiNo
					Escribir "No es magica, pero las diagonales suman lo mismo"
				FinSi
			SiNo
				Escribir "No es magica"
				
			FinSi
	FinSegun
FinSubProceso

SubProceso operarMatrizII (type Por Valor,numRow Por Valor,numCol Por Valor,matrix Por Referencia,resultado Por Referencia)
	// Se define real porque es menos probable que se rompa en ejecucion en el ingreso de la variable y se mantiene para otros casos por economia de codigo
	Definir i,j Como Real //,sum,numSerc,count, posI, posJ,sumColumna,sumFila
	Si type = "sumaFila" Entonces
		Para i = 0 Hasta numRow- 1 Hacer
			resultado[i] = 0
			Para j = 0 Hasta numCol- 1 Hacer
				resultado[i]  = resultado[i] + matrix[i,j]
			FinPara
		FinPara
	SiNo
		Para j = 0 Hasta numCol- 1 Hacer
			resultado[j] = 0
			Para i = 0 Hasta numRow - 1 Hacer
				resultado[j]  = resultado[j] + matrix[i,j]
			FinPara
		FinPara
	FinSi
FinSubProceso

Algoritmo magicaMatriz
	// Se define real porque es menos probable que se rompa en ejecucion en el ingreso de la variable y se mantiene para otros de los casos por economia de codigo
	Definir numRow,numCol,matrix Como Real
	Definir type,choice Como Caracter
	Escribir "Escriba (1) para Tamaño decidido por el usuario o (2) para 3x3 magico"
	Leer choice
//	choice = "2"
	Segun choice Hacer
		"1":		
			type = "cuadradaMagica"
			ingresarFilaColumna(type,numRow,numCol)
			type = "azarEntero"
		De Otro Modo:
			type = "3x3magico"
			numCol = 3
			numRow = 3
	FinSegun
	
	Dimension matrix[numRow,numCol]
	crearMatriz(type,numRow,numCol,matrix)
	mostrarMatriz(numRow,numCol,matrix)
	operarMatriz("magico",numRow,numCol,matrix)
FinAlgoritmo
