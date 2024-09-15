// Actividad 1
// Crea un programa que solicite al usuario ingresar el tamaño deseado para dos vectores. El primero
// almacenará nombres de personas como cadenas, mientras que el segundo vector contendrá la longitud 
// de cada uno de los nombres. Luego, se mostrarán en pantalla los nombres junto con su respectiva longitud.



Funcion mostrarVector( arreglo1, arreglo2, tamanho,letter )
	Definir i Como Real
	Escribir "El arreglo (" letter ") es "
	Para i <- 0 Hasta tamanho-1 Hacer
		Escribir Sin Saltar arreglo1[i] ", " arreglo2[i]
		Escribir ""
	FinPara
	Escribir ""
Fin Funcion

	
SubProceso  llenarArregloChar(tamanho por Valor, valores Por Valor, vector1 Por Referencia, vector2 Por Referencia, campo Por Valor)
	Definir i Como Entero
	Definir variable Como Caracter
	Segun valores Hacer
		"vacios":
			Para i <- 0 Hasta tamanho -1 Hacer
				vector1[i] = ""
				vector2[i] = 0
			FinPara
		"variables":
			Para i <- 0 Hasta tamanho -1 Hacer
				Escribir "Introduce el " campo
				Leer variable
				vector1[i] = variable
				vector2[i] = Longitud(variable)
			FinPara
	FinSegun
FinSubProceso

SubProceso  menu
	// Se define real porque es menos probable que se rompa en ejecucion en el ingreso de la variable y se mantiene para todos los casos por economia de codigo
	Definir choice,choiceVector,letter,vectorA Como Caracter

	Definir number,i,tamanho,vectorB Como Real
	Definir salir Como Logico
	
	Escribir Sin Saltar "Tamaño del arreglo "
	Leer tamanho
	Dimension vectorA[tamanho]
	Dimension vectorB[tamanho]
	
	
	salir = Falso
	llenarArregloChar(tamanho, "vacios",vectorA,vectorB,"Ninguno")
	
	Repetir
		Limpiar Pantalla
		Escribir "Opciones "
		Escribir "1- Llenar arreglo Nombres"
		Escribir "2- Mostrar"
		Escribir "3- Salir"
		Escribir sin saltar "Selecciona alguna de las opciones anteriores "
		Leer choice
		Segun choice Hacer
			"1":
				llenarArregloChar(tamanho, "variables",vectorA,vectorB,"Nombre")
			
			"2":
				mostrarVector( vectorA, vectorB,tamanho, "Nombres y tamaños de los mismos " )
				
			"3":
				salir = Verdadero
				Escribir "Hasta la vista baby"
			De Otro Modo:
				Escribir "del 0 al 3 boludo"
		Fin Segun
		Si choice <> "3"
			Escribir 'Presione enter para volver al menu principal'
		SiNo
			Escribir 'Presione enter para salir'
		FinSi
		Esperar Tecla	
	Mientras Que salir = Falso
FinSubProceso

Algoritmo nombresLongitud
	menu	
FinAlgoritmo