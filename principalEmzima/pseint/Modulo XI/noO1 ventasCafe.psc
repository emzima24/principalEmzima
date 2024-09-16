// Complementario 1 el complementario 2 es exactamente este pero sin indicaciones (no se puede hacer)
// Una distribuidora de Nescafé cuenta con 4 representantes que recorren toda 
// Argentina para ofrecer sus productos. Para la gestión administrativa, el país 
// está dividido en cinco zonas: Norte, Sur, Este, Oeste y Centro. Mensualmente, 
// la empresa registra los datos de ventas de los representantes en cada 
// zona y recopila diversas estadísticas sobre su desempeño.
//
// Se requiere un programa que lea el monto de las ventas de los 
// representantes en cada zona y realice los siguientes cálculos:
//		* Total de ventas de una zona especificada por el usuario.
//	 	* Total de ventas de un representante seleccionado por el usuario en cada una de las zonas.
//		* Total de ventas de todos los representantes.



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

SubProceso  menu
	// Se define real porque es menos probable que se rompa en ejecucion en el ingreso de la variable y se mantiene para todos los casos por economia de codigo
	// las selecciones se definen como caracter como mecanismo mas general para evitar la ruptura de codigo
	Definir acumCemento, acumArena, acumLadrillos, acumPiedras, acumHierro8, acumHierro4, acumHierro10, acumPiedrasVol, acumHierro6, acumPintura, acumIluminacion Como Real
	Definir numRow,numCol,matrixA,matrixB,matrixC,min,max,i Como Real
	Definir type,nombre,represVentas,zonas, choice,choiceVector  Como Caracter
	Definir salir,salir2 Como Logico
	salir = Falso
	Dimension zonas[5], represVentas[4]
	numRow = 4
	numCol = 5
	represVentas[0] = "Carlos"
	represVentas[1] = "Juan"
	represVentas[2] = "Ana"
	represVentas[3] = "Laura"
	zonas[0] = "Norte"
	zonas[1] = "Sur"
	zonas[2] = "Este"
	zonas[3] = "Oeste"
	zonas[4] = "Centro"
	type = "azarEnteroMinMax"
	//type = "ultimaColumnaSuma"
	Dimension matrixA[numRow,numCol], matrixB[numRow,numCol], matrixC[numRow,numCol]
	crearMatriz(type,numRow,numCol,5,10,matrixA)  //
	
	
	Repetir
		Limpiar Pantalla
		Escribir "Opciones sobre el Total de ventas de "
		Escribir "1- Una zona especifica "
		Escribir "2- Un representante en cada zona "
		Escribir "3- Todos los representantes"
		Escribir "4- Salir"
		Escribir sin saltar "Selecciona alguna de las opciones anteriores "
		Leer choice
		Segun choice Hacer
			"1":
				salir2 = Falso
				Repetir
					Limpiar Pantalla
					Escribir "****************"
					Escribir "MODULO POR ZONAS"
					Escribir "****************"
					Escribir "Opciones"
					Para i = 0 hasta numCol - 1 Hacer
						Escribir "" i "- " zonas[i] 
					FinPara			
					Escribir "5- Volver al menu principal"
					Escribir sin saltar "Selecciona alguna de las opciones anteriores "
					Leer choiceVector 
					Escribir  ""
					Si choiceVector = "0" O choiceVector = "1" O choiceVector = "2" O choiceVector = "0" Entonces
						mostrarMatriz("normal",numRow,numCol,matrixA,"Reprentante vs Zona")
						Escribir  ""
					FinSi
					Segun choiceVector Hacer
						"0":
							Escribir Sin Saltar "La suma de todas las ventas para la zona " zonas[0] " es $ "
							operarMatriz("sumaDeFilaN",numRow,0,matrixA,matrixA,matrixA)
						"1":
							Escribir Sin Saltar "La suma de todas las ventas para la zona " zonas[1] " es $ "
							operarMatriz("sumaDeFilaN",numRow,1,matrixA,matrixA,matrixA)
						"2":
							Escribir Sin Saltar "La suma de todas las ventas para la zona " zonas[2] " es $ "
							operarMatriz("sumaDeFilaN",numRow,2,matrixA,matrixA,matrixA)	
						"3":
							Escribir Sin Saltar "La suma de todas las ventas para la zona " zonas[3] " es $ "
							operarMatriz("sumaDeFilaN",numRow,3,matrixA,matrixA,matrixA)	
						"4":
							Escribir Sin Saltar "La suma de todas las ventas para la zona " zonas[4] " es $ "
							operarMatriz("sumaDeFilaN",numRow,4,matrixA,matrixA,matrixA)
						"5":
							salir2 = Verdadero
						De Otro Modo:
							Escribir "del 0 al 5 boludo"
					Fin Segun
					Escribir ""
					Si choiceVector <> "5"
						Escribir 'Presione enter para seleccionar un Representante o volver al menu principal'
					FinSi
					Esperar Tecla	
				Mientras Que salir2 = Falso
			"2":
				salir2 = Falso
				Repetir
					Limpiar Pantalla
					Escribir "*************************"
					Escribir "MODULO POR REPRESENTANTES"
					Escribir "*************************"
					Escribir "Opciones"
					Para i = 0 hasta numRow - 1 Hacer
						Escribir "" i "- " represVentas[i] 
					FinPara			
					Escribir "4- Volver al menu principal"
					Escribir sin saltar "Selecciona alguna de las opciones anteriores "
					Leer choiceVector 
					Escribir  ""
					Si choiceVector = "0" O choiceVector = "1" O choiceVector = "2" O choiceVector = "0" Entonces
						mostrarMatriz("normal",numRow,numCol,matrixA,"A")
						Escribir  ""
					FinSi
					Segun choiceVector Hacer
						"0":
							Escribir Sin Saltar "La suma de todas las zonas del representante " represVentas[0] " es $ "
							operarMatriz("sumaDeColumnaN",0,numCol,matrixA,matrixA,matrixA)
						"1":
							Escribir Sin Saltar "La suma de todas las zonas del representante " represVentas[1] " es $ "
							operarMatriz("sumaDeColumnaN",1,numCol,matrixA,matrixA,matrixA)
						"2":
							Escribir Sin Saltar "La suma de todas las zonas del representante " represVentas[2] " es $ "
							operarMatriz("sumaDeColumnaN",2,numCol,matrixA,matrixA,matrixA)	
						"3":
							Escribir Sin Saltar "La suma de todas las zonas del representante " represVentas[3] " es $ "
							operarMatriz("sumaDeColumnaN",3,numCol,matrixA,matrixA,matrixA)	
						"4":
							salir2 = Verdadero
						De Otro Modo:
							Escribir "del 0 al 4 boludo"
					Fin Segun
					Escribir ""
					Si choiceVector <> "4"
						Escribir 'Presione enter para seleccionar un Representante o volver al menu principal'
					FinSi
					Esperar Tecla	
				Mientras Que salir2 = Falso
				
			"3":
				Limpiar Pantalla
				Escribir "**********************"
				Escribir "MODULO TOTAL DE VENTAS"
				Escribir "**********************"
				mostrarMatriz("normal",numRow,numCol,matrixA,"A")
				Escribir  ""
				operarMatriz("sumAll",numRow,numCol,matrixA,matrixA,matrixA)
			"4":
				salir = Verdadero
				Escribir 'Hasta la vista baby'
			De Otro Modo:
				Escribir "del 1 al 4 boludo"
		Fin Segun
		Si choice <> "4"
			Escribir 'Presione enter para volver al menu principal'
		SiNo
			Escribir 'Presione enter para salir'
		FinSi
		Esperar Tecla	
	Mientras Que salir = Falso
	
FinSubProceso

Algoritmo ventasCafe
	menu
FinAlgoritmo


