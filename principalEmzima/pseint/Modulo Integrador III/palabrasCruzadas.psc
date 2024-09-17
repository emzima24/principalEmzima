// Integrador III
// Palabras Cruzadas
// Se requiere crear una matriz con palabras específicas y luego ajustarlas de manera que la primera 
// letra 'R' de cada palabra quede en la posición 5, alineándose correctamente. Para abordar este 
// problema de manera eficiente y organizada, se propone dividir el trabajo en subprogramas o funciones.
//  	0 1 2 3 4 5 6 7 8 9 10 11       0 1 2 3 4 5 6 7 8 9 10 11
// 0	V E C T O R                     V E C T O R
// 1	M A T R I X                         M A T R I X
// 2	P R O G R A M A                         P R O G R A M A
// 3	S U B P R O G R A M A             S U B P R O G R A M A
// 4	S U B P R O C E S O               S U B P R O C E S O
// 5	V A R I A B L E                       V A R I A B L E
// 6 	E N T E R O                       E N T E R O
// 7 	P A R A                               P A R A
// 8 	M I E N T R A S                 M I E N T R A S
//  Deberán al menos contemplar los siguientes subprogramas:
//  	1. subprograma inicializarMatriz: Esta función inicializará la matriz con un asterisco 
//		en cada celda para evitar problemas y garantizar que no esté vacía. Deberá recibir como 
//		parámetros la matriz a inicializar, la cantidad de filas y la cantidad de columnas.
//		
//    	2. subprograma imprimirMatriz: Esta función imprimirá la matriz en la consola. Para evitar 
//		que las letras queden pegadas, entre cada letra se imprimirá un espacio. Recibirá como 
//		parámetros la matriz a imprimir, la cantidad de filas y la cantidad de columnas.
//			
//		3. subprograma agregarPalabra: Esta función agregará una palabra en una fila específica de la matriz. Recibirá 
//		como parámetros la matriz donde se agregará la palabra, la fila en la que se agregará y la propia palabra.
//			
//		4. subprograma buscarR: Esta función buscará la primera letra 'R' en una fila determinada de la matriz y devolverá 
//		su posición. Recibirá como parámetros la matriz donde se buscará la letra 'R' y el número de fila en el que se buscará.
//			
//		5. subprograma acomodarPalabra: Esta función acomodará las palabras en la matriz según 
//		la posición de la primera letra 'R'. Para ello, moverá las palabras hacia la izquierda o hacia 
//		la derecha según sea necesario, rellenando los espacios vacíos con asteriscos nuevamente.

// La idea será completada con variantes que a mi juicio mejoran el tema del subproceso considerando 
// que incluso ya lo hemos hecho antes por eso incumplimos la consigna conscientes de lo dicho anteriormente.
// Se usan del modulo X noO2 llenarPalabraMatriz.psc, modulo IX  y con ello listo se resuelve noO4 nombresMenu.psc 
// El diagrama de flujo se realizó como un mapa mental en Miro puede verse en https://miro.com/app/board/uXjVLdm-dIU=/?share_link_id=662231495089



// ADICIONAL A LO SOLICITADO EN EL INTEGRADOR
SubProceso controlLetraR (valUno Por Referencia)
	Definir mensaje,valDos Como Caracter
	Definir count,i Como Real
	Definir control Como Logico
	mensaje = ""
	control = Falso
	count = 0
	Repetir
		Si count > 0 Entonces
			mensaje = ", che boludo en serio CON ALGUNA LETRA r dale!!!"
		FinSi
		Escribir "Introduce la palabra con alguna letra r " + mensaje
		Leer valUno
		valDos = Mayusculas(valUno)
		Para i = 0 Hasta Longitud(valUno) Hacer
			Si Subcadena(valDos,i,i) = "R" Entonces
				control = Verdadero
			FinSi
		FinPara
		count = count +1
	Mientras Que control = Falso
FinSubProceso

// Se corresponde con subprograma inicializarMatriz y con el subprograma agregarPalabra
SubProceso crearMatrizChar (type Por Valor,numRow Por Valor,numCol Por Valor,matrixChar Por Referencia)
	Definir i,j Como Real
	Definir valUno Como Caracter
	
	Para i = 0 Hasta numRow-1 Hacer
		Para j = 0 Hasta numCol-1 Hacer
			Segun type Hacer
				"vacios":
					matrixChar[i,j] = " "
				"user":
					Escribir "Indique el valor (" i, j ")"
					Leer valUno
					matrixChar[i,j] = valUno
				"palabra":
					Para i = 0 Hasta numRow-1 Hacer
						controlLetraR(valUno)
						Para j = 0 Hasta numCol-1 Hacer
							matrixChar[i,j] = Subcadena(valUno,j,j)
						FinPara
					FinPara
			FinSegun
		FinPara
	FinPara
FinSubProceso

// Se corresponde con subprograma imprimirMatriz 
Funcion mostrarMatriz (numRow,numCol,matrix)
	Definir i,j Como Real
	Escribir "La matriz es "
	Para i = 0 Hasta numRow-1 Hacer
		Para j = 0 Hasta numCol-1 Hacer
			Escribir Sin Saltar matrix[i,j] " " //(" i "," j ")"
		FinPara
		Escribir ""
	FinPara
Fin Funcion

// Se corresponde con subprograma buscarR 
SubProceso  letraEspecificaArregloChar(i por valor, numCol Por Valor, letter Por Valor, matrix Por Referencia,ubicacion Por Referencia)
	Definir j Como Entero
	Definir count Como real
	count = 0
	Para j <- 0 Hasta numCol -1 Hacer
			Si Minusculas(matrix[i,j]) = Minusculas(letter) Y count = 0 Entonces
				ubicacion = j
				count = count +1
			FinSi
		FinPara
FinSubProceso

// Se corresponde con subprograma acomodarPalabra
SubProceso operarMatriz (type Por Valor,numRow Por Valor,numCol Por Valor,matrix Por Referencia, matrixB Por Referencia)
	Definir i,j, ubicacion,ubicacionDos,step Como Real
	Segun type Hacer
		"ordenar":
			letraEspecificaArregloChar(0, numCol, "r", matrix, ubicacion)
			Para i = 0 Hasta numRow-1 Hacer
				letraEspecificaArregloChar(i, numCol, "r", matrix, ubicacionDos)
				step = ubicacion - ubicacionDos
				Para j = 0 Hasta numCol-1 Hacer
					Si j >= step Entonces
						matrixB[i,j] = matrix[i,j-step]
					SiNo
						matrixB[i,j] = " "
					FinSi
					
				FinPara
			FinPara

	FinSegun
FinSubProceso

Algoritmo palabrasCruzadas
	// Se define real porque es menos probable que se rompa en ejecucion en el ingreso de la variable y se mantiene para otros de los casos por economia de codigo
	Definir numRow,numCol Como Real
	Definir type, matrixChar, matrixCharOrd  Como Caracter
	type = "cuadrada"
	numCol = 12
	numRow = 9
	
	dimension matrixChar[numRow,numCol], matrixCharOrd[numRow,numCol]
	Limpiar Pantalla
	Escribir "**************"
	Escribir "Crear matrices"
	Escribir "**************"
	Escribir ""
	Esperar Tecla
	crearMatrizChar("vacios",numRow,numCol,matrixChar)
	crearMatrizChar("vacios",numRow,numCol,matrixCharOrd)
	mostrarMatriz(numRow,numCol,matrixChar)
	mostrarMatriz(numRow,numCol,matrixCharOrd)
	Limpiar Pantalla
	Escribir "*******************************"
	Escribir "Cargar palabras en las matriz"
	Escribir "*******************************"
	Escribir ""
	Esperar Tecla
	type = "palabra"
	crearMatrizChar(type,numRow,numCol,matrixChar)
	Esperar Tecla
	mostrarMatriz(numRow,numCol,matrixChar)
	Limpiar Pantalla
	Escribir "*******************"
	Escribir "Ordenar la matriz"
	Escribir "*******************"
	Escribir ""
	Esperar Tecla
	operarMatriz("ordenar",numRow,numCol,matrixChar,matrixCharOrd)
	mostrarMatriz(numRow,numCol,matrixCharOrd)
FinAlgoritmo
