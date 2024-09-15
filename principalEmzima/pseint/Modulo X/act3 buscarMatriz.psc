// Actividad 3
// Crea un programa que cumpla con las siguientes condiciones:
//
//		* Define y dimensiona una matriz de 5x5 para almacenar datos numéricos enteros.
//		* Rellena la matriz de manera aleatoria con números comprendidos entre 10 y 40.
//		* Permite al usuario ingresar un número para buscarlo dentro de la matriz.
//		* Si el número se encuentra, muestra en pantalla un mensaje adecuado junto 
//		con las coordenadas en la matriz (fila y columna). En caso de que el número 
// 		esté repetido, solo se mostrará la posición de la primera ocurrencia.
//		* Si el número no se encuentra, informa por pantalla.



SubProceso ingresarFilaColumna (numRow Por Referencia,numCol Por Referencia)
	Definir i,j,valUno Como Real
	Escribir "Indique cantidad de filas "
	Leer numRow
	Escribir "Indique cantidad de columnas "
	Leer numCol
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


Algoritmo buscarMatriz
	// Se define real porque es menos probable que se rompa en ejecucion en el ingreso de la variable y se mantiene para otros de los casos por economia de codigo
	Definir numRow,numCol,matrix Como Real
	Definir type Como Caracter
	ingresarFilaColumna(numRow,numCol)
	type = "azarEntero"
	dimension matrix[numRow,numCol]
	crearMatriz(type,numRow,numCol,matrix)
	mostrarMatriz(numRow,numCol,matrix)
	operarMatriz("sumAll",numRow,numCol,matrix)
	operarMatriz("buscar",numRow,numCol,matrix)
FinAlgoritmo
