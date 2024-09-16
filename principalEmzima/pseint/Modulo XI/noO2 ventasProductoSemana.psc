// Complementario 3
// Una empresa de venta de productos por correo desea realizar una 
// estadística de las ventas de cada uno de sus productos a lo largo de una 
// semana, distribuyendo los 5 productos en los 5 días hábiles. Se desea conocer:
//		* El total de ventas por cada día de la semana.
//	 	* El total de ventas de cada producto a lo largo de la semana.
//		* El producto más vendido en cada semana.
//		* El nombre, el día de la semana y la cantidad del producto más vendido.
// El informe final tendrá el siguiente formato:
//							Lunes	Martes	Miércoles	Jueves	Viernes	Total producto
//	Producto 1						
//	Producto 2						
//	Producto 3						
//	Producto 4						
//	Producto 5						
//	Total semana						
//	Producto más vendido						



SubProceso ingresarFilaColumna (numRow Por Referencia,numCol Por Referencia)
	Definir i,j,valUno Como Real
	Escribir "Indique cantidad de filas "
	Leer numRow
	Escribir "Indique cantidad de columnas "
	Leer numCol
FinSubProceso

SubProceso crearMatriz (type Por Valor,numRow Por Valor,numCol Por Valor,min Por Valor, max por Valor,matrix Por Referencia )
	Definir i,j,z,valUno,sumCol,maxCol,iMaxCol,sumFila Como Real
	Para i = 0 Hasta numRow-1 Hacer
		sumCol = 0
		iMaxCol = 0
		Para j = 0 Hasta numCol-1 Hacer
			maxCol = 0
			Segun type Hacer
				"user":
					Escribir "Indique el valor (" i, j ")"
					Leer valUno
					matrix[i,j] = valUno
				"ceros":
					matrix[i,j] = 0
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
					sumFila = 0
					Si i < numRow -2 Entonces
						Si j<>numCol-1 Entonces
							matrix[i,j] = Aleatorio(min,max)
						SiNo
							Para z = 0 Hasta numCol-2 Hacer
								sumCol = sumCol + matrix[i,z]
							FinPara
							matrix[i,j] = sumCol
						FinSi
					SiNo
						Si i = numRow -2 Entonces
							Para z = 0 Hasta numRow-3 Hacer
								sumFila = sumFila + matrix[z,j]
							FinPara
							matrix[i,j] = sumFila
							Si j = numCol-1 Entonces
								Para z = 0 Hasta numCol-2 Hacer
									sumCol = sumCol + matrix[i,z]
								FinPara
								matrix[i,j] = sumCol
							FinSi
						SiNo							
							
							Para z = 0 Hasta numRow-3 Hacer
								Si maxCol < matrix[z,j] Entonces
									maxCol = matrix[z,j]
									iMaxCol = z
								FinSi
							FinPara
							matrix[i,j] = iMaxCol
						FinSi
					FinSi
			FinSegun
		FinPara
	FinPara
FinSubProceso

Funcion mostrarMatriz (type,numRow,numCol,matrix, nombre,diasSemana, productos )
	Definir i,j,z Como Real
	Segun  type Hacer
		"normal":
			Escribir "La matriz es " nombre
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
		"particular":
			Para z = 0 Hasta  numCol-1 Hacer
				Escribir Sin Saltar diasSemana[z] ", "
			FinPara
			Escribir ""
			Para i = 0 Hasta numRow-1 Hacer
				Escribir Sin Saltar productos[i] ", "
				Para j = 0 Hasta numCol-1 Hacer
					Si i= numRow-1 Entonces
						Escribir Sin Saltar productos[matrix[i,j]] ", "
					SiNo
						Escribir Sin Saltar matrix[i,j] ", "
					FinSi
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
			Escribir "El total de las ventas de todos los representantes es " sum
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
		"sumaDeColumnaN":
			Para j = 0 Hasta numCol-1 Hacer
				sum = sum + matrixC[numRow,j]  
			FinPara
			Escribir sum
		"sumaDeFilaN":
			Para i = 0 Hasta numRow-1 Hacer
				sum = sum + matrixC[i,numCol]  
			FinPara
			Escribir sum
	FinSegun
FinSubProceso

Algoritmo ventasProductoSemana
	// Se define real porque es menos probable que se rompa en ejecucion en el ingreso de la variable y se mantiene para todos los casos por economia de codigo
	// las selecciones se definen como caracter como mecanismo mas general para evitar la ruptura de codigo
	Definir acumCemento, acumArena, acumLadrillos, acumPiedras, acumHierro8, acumHierro4, acumHierro10, acumPiedrasVol, acumHierro6, acumPintura, acumIluminacion Como Real
	Definir numRow,numCol,matrixA,matrixB,matrixC,min,max,i Como Real
	Definir type,nombre,productos,diasSemana, choice,choiceVector  Como Caracter
	Definir salir,salir2 Como Logico
	salir = Falso
	numRow = 7
	numCol = 7

	Dimension diasSemana[numCol], productos[numRow]
	productos[0] = "  Cafe"
	productos[1] = "    Te"
	productos[2] = "Azucar"
	productos[3] = " Yerba"
	productos[4] = "  Agua"
	productos[5] = " Total"
	productos[6] = "+ vnd"
	diasSemana[0] = " - "
	diasSemana[1] = "Lunes"
	diasSemana[2] = "Martes"
	diasSemana[3] = "Miercoles"
	diasSemana[4] = "Jueves"
	diasSemana[5] = "Viernes"
	diasSemana[6] = "Total Producto"
	//type = "azarEnteroMinMax"
	type = "ultimaColumnaSuma"
	Dimension matrixA[numRow,numCol], matrixB[numRow,numCol], matrixC[numRow,numCol]

	crearMatriz(type,numRow,numCol-1,5,10,matrixA)  //
	mostrarMatriz("particular",numRow,numCol-1,matrixA,"Informe ",diasSemana, productos)
FinAlgoritmo

