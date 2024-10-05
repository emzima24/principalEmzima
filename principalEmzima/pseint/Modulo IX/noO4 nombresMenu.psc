// Complementario 4
// Diseña un programa que trabaje con un vector de cadenas de caracteres de dimensión 10, donde cada 
// cadena representa un nombre ingresado por el usuario. El programa debe realizar las siguientes tareas:
//
// 		1. Llenar el vector con nombres ingresados por el usuario.
// 		2. Mostrar el vector original en pantalla.
//		3. Contar y mostrar cuántas veces se repite cada vocal en todos los nombres 
//		del vector. Es decir el total de A-E-I-O-U utilizadas en todo el vector.
//		4. Encontrar y mostrar el nombre más largo y el nombre más corto del vector.
//		5. Crear un nuevo vector que contenga solo los nombres que comiencen con una 
//		letra específica ingresada por el usuario.Mostrar el nuevo vector en pantalla.
// Se define real porque es menos probable que se rompa en ejecucion en el ingreso de la variable y se mantiene para otros de los casos por economia de codigo




Funcion mostrarVector( arreglo1, tamanho,letter )
	Definir i Como Real
	Escribir "El arreglo (" letter ") es "
	Para i <- 0 Hasta tamanho-1 Hacer
		Escribir Sin Saltar arreglo1[i] ", " 
		Escribir ""
	FinPara
	Escribir ""
Fin Funcion


SubProceso  llenarArregloChar(tamanho por Valor, valores Por Valor, vector1 Por Referencia, campo Por Valor)
	Definir i Como Entero
	Definir variable Como Caracter
	Segun valores Hacer
		"vacios":
			Para i <- 0 Hasta tamanho -1 Hacer
				vector1[i] = ""
			FinPara
		"variables":
			Para i <- 0 Hasta tamanho -1 Hacer
				Escribir "Introduce el " campo
				Leer variable
				vector1[i] = variable
			FinPara
	FinSegun
FinSubProceso

SubProceso  contarVocalArregloChar(tamanho por Valor, vector1 Por Referencia, qtyA Por Referencia, qtyE Por Referencia,qtyI Por Referencia,qtyO Por Referencia,qtyU Por Referencia)
	Definir i,j Como Entero
	Definir variable,letra Como Caracter
	qtyA = 0
	qtyE = 0
	qtyI = 0 
	qtyO = 0
	qtyU = 0
	Para i <- 0 Hasta tamanho -1 Hacer
		Para j <-0 Hasta Longitud(vector1[i]) Hacer
			letra = Mayusculas(Subcadena(vector1[i],j,j))
			Segun letra
				"A":
					qtyA = qtyA + 1
				"E":
					qtyE = qtyE + 1
				"I":
					qtyI = qtyI + 1
				"O":
					qtyO = qtyO + 1
				"U":
					qtyU = qtyU + 1
			FinSegun

		FinPara
	FinPara
FinSubProceso

SubProceso  maxArregloChar(tamanho por Valor, vector1 Por Referencia, max Por Referencia, palabraMax Por Referencia, min Por Referencia, palabraMin Por Referencia)
	Definir i,j Como Entero
	Definir variable Como Caracter
	max = Longitud(vector1[0])
	min = Longitud(vector1[0])
	palabraMax = vector1[0]
	palabraMin = vector1[0]
	Para i <- 1 Hasta tamanho -1 Hacer
		Si Longitud(vector1[i]) > max Entonces
			max = Longitud(vector1[i])
			palabraMax = vector1[i]
		FinSi
		Si Longitud(vector1[i]) < min Entonces
			min = Longitud(vector1[i])
			palabraMin = vector1[i]
		FinSi
		
	FinPara
FinSubProceso

SubProceso  letraEspecificaArregloChar(tamanho por Referencia, letter Por Valor, vector1 Por Referencia,vector2 Por Referencia)
	Definir i Como Entero
	Definir variable Como real
	variable = tamanho
	tamanho = 0
	Para i <- 0 Hasta variable -1 Hacer
		Si Minusculas(Subcadena(vector1[i],0,0)) = Minusculas(letter) Entonces
			vector2[tamanho] = vector1[i]
			tamanho = tamanho +1
		FinSi
	FinPara
	Si tamanho = 0 Entonces
		Escribir "Tamaño no puede ser 0"
	FinSi
FinSubProceso

SubProceso  menu
	// Se define real porque es menos probable que se rompa en ejecucion en el ingreso de la variable y se mantiene para otros de los casos por economia de codigo
	Definir choice,choiceVector,letter,vectorA,palabraMax,palabraMin,vectorB Como Caracter
	Definir number,i,tamanho,tamanhoDos,qtyA, qtyE, qtyI, qtyO ,qtyU,min,max Como Real
	Definir salir Como Logico
	
	Escribir Sin Saltar "Tamaño del arreglo "
	Leer tamanho
	
	Dimension vectorA[tamanho]
	Dimension vectorB[tamanho]
	
	salir = Falso
	//llenarArregloChar(tamanho, "vacios",vectorA,vectorB,"Ninguno")
	
	Repetir
		Limpiar Pantalla
		Escribir "Opciones "
		Escribir "1- Llenar arreglo Nombres"
		Escribir "2- Vocales"
		Escribir "3- Nombre largo y Nombre corto"
		Escribir "4- Solo con la letra seleccionada"
		Escribir "5- Mostrar"
		Escribir "6- Salir"
		Escribir sin saltar "Selecciona alguna de las opciones anteriores "
		Leer choice
		Segun choice Hacer
			"1":
				llenarArregloChar(tamanho, "variables",vectorA,"Nombre")
			"2":
				contarVocalArregloChar(tamanho, vectorA, qtyA, qtyE, qtyI, qtyO ,qtyU )
				Escribir ""
				Escribir "Cantidad de vocal(es) A " qtyA
				Escribir "Cantidad de vocal(es) E " qtyE
				Escribir "Cantidad de vocal(es) I " qtyI
				Escribir "Cantidad de vocal(es) O " qtyO 
				Escribir "Cantidad de vocal(es) U " qtyU
			"3":
				maxArregloChar(tamanho, vectorA, max, palabraMax, min, palabraMin)
				Escribir ""
				Escribir "El nombre mas largo (puede haber otra pero del mismo tamaño) "
				Escribir palabraMax " con una longitud de " max " caracteres"
				Escribir ""
				Escribir "El nombre mas corto (puede haber otra pero del mismo tamaño) " 
				Escribir palabraMin " con una longitud de " min " caracteres"
				Escribir ""
			"4":
				Escribir ""
				Escribir "Indique la letra con la que inicia los nombres que quiere mostrar"
				Leer letter
				tamanhoDos = tamanho
				letraEspecificaArregloChar(tamanhoDos , letter , vectorA ,vectorB  )
				Escribir ""
				Si tamanhoDos = 0 Entonces
					Escribir " No hay Nombres que comienzen por la letra " letter
					mostrarVector( vectorA ,tamanho, "Nombres " )
				SiNo
					letter = "Nombres que comienzan por letra " + letter
					mostrarVector( vectorB ,tamanhoDos, letter )
				FinSi
				
			"5":
				Escribir ""
				mostrarVector( vectorA ,tamanho, "Nombres " )
			"6":
				salir = Verdadero
				Escribir ""
				Escribir "Hasta la vista baby"
			De Otro Modo:
				Escribir ""
				Escribir "del 1 al 6 boludo"
		Fin Segun
		Si choice <> "6"
			Escribir 'Presione enter para volver al menu principal'
		SiNo
			Escribir 'Presione enter para salir'
		FinSi
		Esperar Tecla	
	Mientras Que salir = Falso
FinSubProceso

Algoritmo nombresMenu
	menu	
FinAlgoritmo