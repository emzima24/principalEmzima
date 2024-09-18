// Integrador IV 
// Complementario
// El mundo de la investigación se enfrenta a un nuevo desafío científico. Un brillante investigador, el Dr. Marlowe,
// ha descubierto una intrigante correlación entre secuencias genéticas codificadas y patrones matriciales.
//
// Cada muestra de ADN se presenta como una secuencia de caracteres compuesta por 
// cuatro bases: A, B, C y D. Por ejemplo, una muestra podría ser "ACDDCADBCDABDBBA".
//	
// El Dr. Marlowe, empleando un enfoque innovador, convierte estas secuencias en matrices cuadradas (MxM)
// y busca patrones específicos en las diagonales principales de estas matrices. El patrón específico consiste 
// en que ambos conjuntos de caracteres en las diagonales principales de la matriz sean idénticos, aunque los
// caracteres entre sí pueden ser diferentes. Por ejemplo, una muestra podría generar la siguiente matriz:
//	
//	A C D D
//	C A D B
//	C D A B
//	D B B A
//	
//	Sin embargo, lo intrigante es que el tamaño de la matriz no se conoce de antemano y debe inferirse de la muestra ingresada.
//	
//T u Misión: Desarrollar un programa que permita al usuario ingresar una muestra de ADN completa 
// y determinar su validez según los patrones identificados por el Dr. Marlowe. Si la muestra es 
// válida, el programa deberá mostrar la matriz generada y un mensaje indicando si se ha encontrado
// un patrón específico. En caso contrario, se solicitará al usuario que ingrese una nueva muestra.
//			
// Para que una muestra sea considerada válida, debe cumplir con los siguientes criterios:
//				
// 		* Debe tener una longitud de 9 caracteres para ser almacenada en una matriz de 
//		3x3 o de 16 caracteres para ser almacenada en una matriz de 4x4, respectivamente.
//		* Los caracteres de la muestra deben ser exclusivamente A, B, C o D para ser considerada válida.
//							
// Para encontrar el patrón especificado: 
//								
// Una vez validada la muestra ingresada, se procederá a crear la matriz correspondiente para recorrer 
// sus diagonales. Si todos los caracteres de la diagonal principal 1 son iguales, indicando que cumple 
// con el patrón, se continuará analizando la diagonal principal 2. Si todos los caracteres de la diagonal 
// principal 2 también son iguales, se concluirá que la muestra ingresada presenta los patrones específicos
// esperados. En ese caso, se mostrará en pantalla el mensaje "¡Felicidades! La muestra contiene patrones 
// específicos en sus diagonales". En caso contrario, si la muestra no cumple con los patrones especificados en ambas 
// diagonales, se mostrará en pantalla el mensaje "La muestra NO contiene los patrones especificados en sus diagonales".
// 
// Se usan del modulo Integrador III palabrasCruzadas.psc, modulo X noO3 magiaMatriz.psc y  modulo Integrador IV trabajandoFrase.psc
// Una explicacion de la forma de como avanzar respecto a las diagonales en la siguiente tabla https://docs.google.com/spreadsheets/d/1XZUC2BzjYaTDcOBipbDeZIlfXTtfCCvNFRDJzELJEUg/edit?gid=1514302018#gid=1514302018&range=D3:K14
// Una explicacion de la forma de como avanzar respecto al texto cargado en la matriz en la siguiente tabla https://docs.google.com/spreadsheets/d/1XZUC2BzjYaTDcOBipbDeZIlfXTtfCCvNFRDJzELJEUg/edit?gid=1944097503#gid=1944097503&range=B2:I15
// A los efectos del codigo se consideraron casos de predefinidos
// Positivo 4x4 2 ACDDCADBCDABDBBA
// Positivo 3x3 1 ACACABADA
// Negativo 4x4 2 ACDDCADBCDABDBBD
// Negativo 3x3 1 ACACABADD

SubProceso controlLetras (valUno Por Referencia, isConfirm Por Referencia)
	Definir mensaje,valDos Como Caracter
	Definir count,i Como Real
	Definir control Como Logico
	mensaje = ""
	isConfirm = Verdadero
	count = 0
	Para i = 0 Hasta Longitud(valUno)-1 Hacer
		Si Subcadena(valUno,i,i) <> "A" Y Subcadena(valUno,i,i) <> "B" Y Subcadena(valUno,i,i) <> "C" Y Subcadena(valUno,i,i) <> "D" Entonces
			isConfirm = Falso
			i = Longitud(valUno)
		FinSi
	FinPara
	
FinSubProceso

SubProceso controlLongitud (valUno Por Referencia,tamanho por Valor)
	Definir mensaje,tamanhoText Como Caracter
	Definir count,i Como Real
	Definir isConfirm Como Logico
	mensaje = ""
	count = 0
	Escribir ""
	Repetir
		Si count > 0 Entonces
			tamanhoText = ConvertirATexto(tamanho)
			mensaje = ", che boludo en serio "+ tamanhoText + " y letras solo A,B C ó D dale!!!"
			Escribir ""
		FinSi
		Escribir "Introduce la cadena de ADN caracteres" + mensaje
		Leer valUno
		valUno = Mayusculas(valUno)
		controlLetras(valUno, isConfirm)
		count = count +1
	Mientras Que Longitud(valUno) <> tamanho O isConfirm = Falso
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
					controlLongitud(valUno, numCol*numRow)
					Para i = 0 Hasta numRow-1 Hacer
						Para j = 0 Hasta numCol-1 Hacer
							matrixChar[i,j] = Subcadena(valUno,j+salto,j+salto)
						FinPara
						salto = salto + numCol
					FinPara
			FinSegun
		FinPara
	FinPara
FinSubProceso

Funcion mostrarMatriz (numRow,numCol,matrix)
	Definir i,j Como Real
	Escribir ""
	Escribir "La matriz es "
	Para i = 0 Hasta numRow-1 Hacer
		Para j = 0 Hasta numCol-1 Hacer
			Escribir Sin Saltar matrix[i,j] ", " //(" i "," j ")"
		FinPara
		Escribir ""
	FinPara
Fin Funcion

SubProceso operarMatriz (numRow Por Valor,numCol Por Valor,matrix Por Referencia)
	Definir i,sum,count Como Real
	Definir isConfirm Como Logico
	sum = 0
	count = 0
	isConfirm = Verdadero
	Escribir ""
	Para i = 0 Hasta numRow- 1 Hacer
		SI matrix[i,i] <> matrix[0,0] Entonces
			isConfirm = Falso
			i = numRow
		FinSi
		Si isConfirm Entonces	
			SI matrix[i,numCol-1-i] <> matrix[0,numCol-1] Entonces
				isConfirm = Falso
				i = numRow
			FinSi
		FinSi
	FinPara
	Si isConfirm Entonces
		Escribir "¡Felicidades! La muestra contiene patrones específicos en sus diagonales"
		Escribir ''
	SiNo
		Escribir "La muestra NO contiene los patrones especificados en sus diagonales"
		Escribir ''
	FinSi
FinSubProceso

Algoritmo investigacionADN
	// Se define real porque es menos probable que se rompa en ejecucion en el ingreso de la variable y se mantiene para otros de los casos por economia de codigo
	Definir numR3C,numR4C Como Real
	Definir type, matrixChar3,matrixChar4,choice Como Caracter
	Definir isSalir Como Logico
	isSalir = Falso
	type = "cuadrada"
	numR3C = 3
	numR4C = 4
	type = "palabra"
	dimension matrixChar3[numR3C,numR3C], matrixChar4[numR4C,numR4C]
	Repetir
		Limpiar Pantalla
		Escribir "Secciona el tamaño de la matrz"
		Escribir "1- cadena de 9"
		Escribir "2- cadena de 16"
		Escribir "3- Salir"
		
		Leer choice
		Segun choice
			"1":
				crearMatrizChar(type,numR3C,numR3C,matrixChar3)
				mostrarMatriz(numR3C,numR3C,matrixChar3)
				operarMatriz(numR3C,numR3C,matrixChar3)
			"2":
				crearMatrizChar(type,numR4C,numR4C,matrixChar4)
				mostrarMatriz(numR4C,numR4C,matrixChar4)
				operarMatriz(numR4C,numR4C,matrixChar4)
			"3": 
				isSalir = Verdadero
				Escribir 'Hasta la vista baby'
			De Otro Modo:
				Escribir "del 1 al 3 boludo"
		Fin Segun
		
		Si choice <> "3"
			Escribir 'Presione enter para volver al menu principal'
		SiNo
			Escribir 'Presione enter para salir'
		FinSi
		Esperar Tecla	
	Mientras Que isSalir = Falso
FinAlgoritmo

