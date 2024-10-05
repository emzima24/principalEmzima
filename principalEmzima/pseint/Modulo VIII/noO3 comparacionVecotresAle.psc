// Complementario 3
// Crea un subproceso que llene dos arreglos de tamaño n con números aleatorios. Luego, desarrollar 
// una función que tome como argumentos los dos arreglos y determine si todos sus valores son iguales o no. 
// Esta función debe devolver un valor booleano que indique el resultado de la validación.  
// Finalmente, en el algoritmo principal, mostrar un mensaje según el resultado obtenido. Se 
// recomienda utilizar variables de tipo lógico para facilitar la implementación.
// Se define real porque es menos probable que se rompa en ejecucion en el ingreso de la variable y se mantiene para todos los casos por economia de codigo



Funcion mostrarVector( number, tamanho,letter )
	Definir i Como Real
	Escribir Sin Saltar"El arreglo (" letter ") es "
	Para i <- 0 Hasta tamanho-1 Hacer
		Escribir Sin Saltar number[i] ", "
	FinPara
	Escribir ""
Fin Funcion

SubProceso  llenarArreglo(tamanho por Valor, valores Por Valor, vector Por Referencia)
	Definir i Como Entero
	Si valores = 1 Entonces
		Para i <- 0 Hasta tamanho -1 Hacer
			vector[i] = Aleatorio(-100,100)
		FinPara
	SiNo
		Para i <- 0 Hasta tamanho -1 Hacer
			vector[i] = 0
		FinPara
	FinSi
FinSubProceso

SubProceso  operarArreglo( tamanho por Valor, vector1 Por Referencia, vector2 Por Referencia, isIgual Por Referencia)
	Definir i Como Entero
	isIgual = Verdadero
	Para i <- 0 Hasta tamanho -1 Hacer
		Si vector1[i] <> vector2[i] Entonces
			isIgual = Falso
		FinSi
	FinPara
	
FinSubProceso

SubProceso  menu
	Definir choice,choiceVector,letter Como Caracter
	Definir number,i,tamanho,vectorA,vectorB Como Real
	Definir salir, isIgual Como Logico
	
	tamanho = azar(20)
	Dimension vectorA[tamanho]
	Dimension vectorB[tamanho]
	
	salir = Falso
	llenarArreglo(tamanho, 1,vectorA)
	llenarArreglo(tamanho, 1,vectorB)
	Repetir
		Limpiar Pantalla
		Escribir "Opciones "
		Escribir "1- Comparar"
		Escribir "2- Mostrar"
		Escribir "3- Salir"
		Escribir sin saltar "Selecciona alguna de las opciones anteriores "
		Leer choice
		Segun choice Hacer
			"1":
				operarArreglo( tamanho, vectorA, vectorB, isIgual)
				Si isIgual Entonces
					Escribir "Los vectores A y B son iguales"
				SiNo
					Escribir "Los vectores A y B NO son iguales"
				FinSi
			"2":
				Repetir
					Limpiar Pantalla
					Escribir "Opciones "
					Escribir "(A) Vector A"
					Escribir "(B) Vector B"
					Escribir "(S) Salir"
					Escribir sin saltar "Selecciona alguna de las opciones anteriores "
					Leer choiceVector
					choiceVector = Mayusculas(choiceVector)
					Segun choiceVector Hacer
						"A":
							mostrarVector( vectorA, tamanho, "A" )
						"B":
							mostrarVector( vectorB, tamanho, "B" )
						"S":
							Escribir "..."
						De Otro Modo:
							Escribir "Solo las letras indicadas boludo"
					Fin Segun
					Si choiceVector <> "S" Entonces
						Escribir 'Presione enter para volver al menu principal'
						Esperar Tecla	
					FinSi
				Mientras Que choiceVector <> "S"
			"3":
				salir = Verdadero
				Escribir "Hasta la vista baby"
			De Otro Modo:
				Escribir "del 1 al 6 boludo"
		Fin Segun
		Si choice <> "3"
			Escribir 'Presione enter para volver al menu principal'
		SiNo
			Escribir 'Presione enter para salir'
		FinSi
		Esperar Tecla	
	Mientras Que salir = Falso
FinSubProceso

Algoritmo comparacionVecotresAle
	menu	
FinAlgoritmo