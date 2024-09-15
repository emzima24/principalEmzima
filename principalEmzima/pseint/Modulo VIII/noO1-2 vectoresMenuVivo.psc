// Complementario 1 OTRO DESARROLLADO EN EL VIVO
// Desarrolla un programa con un menú de opciones que permita al usuario realizar diversas operaciones 
// con vectores hasta que elija la opción 'Salir'. El menú contempla las siguientes opciones: 
//
// 		1. Llenar Vector A: Este vector, de tamaño N, se llena de manera aleatoria 
//			utilizando la función Aleatorio(valorMin, valorMax) de PSeInt.
//	
// 		2. Llenar Vector B: Este vector, de tamaño N, se llena de manera aleatoria 
//			utilizando la función Aleatorio(valorMin, valorMax) de PSeInt.
//	
// 		3. Llenar Vector C con la suma de los vectores A y B: La suma se realiza 
//			elemento a elemento (es decir, C[i] = A[i] + B[i]). Esto quiere decir, 
//			por ejemplo, que la posición 1 del vector C será el número resultante 
//			de la suma de la posición 1 del vector A y la posición 1 del vector B.
//	
// 		4. Llenar Vector C con la resta de los vectores B y A: La resta se realiza 
//			elemento a elemento (es decir, C[i] = B[i] - A[i]). Esto quiere decir, 
//			por ejemplo, que la posición 1 del vector C será el número resultante 
//			de la resta de la posición 1 del vector A y la posición 1 del vector B.
//	
// 		5. Mostrar: Esta opción permite al usuario decidir qué vector desea mostrar: Vector A, B o C.
//		
// 		6.Salir.
//		
// 			Tener en cuenta: 
//		
// 		El rango de los números aleatorios para los vectores será de -100 a 100. La longitud para 
//		todos los vectores será la misma, por lo tanto, esa información solo se solicitará una vez.
//				
// 		Utiliza funciones o subprocesos para mejorar la reutilización de código.



Funcion mostrarVector( number, tamanho,letter )
	Definir i Como Real
	Escribir Sin Saltar"El arreglo (" letter ") es "
	Para i <- 0 Hasta tamanho-1 Hacer
		Escribir Sin Saltar number[i] ", "
	FinPara
	Escribir ""
Fin Funcion

SubProceso llenarArreglo(tamanho Por Valor, valores Por Valor, vector Por Referencia )
	Definir i Como Entero
	
	Si valores = 0 Entonces
		Para i=0 Hasta tamanho- 1 Hacer
			vector[i] = 0
		FinPara
	SiNo
		Para i=0 Hasta tamanho- 1 Hacer
			vector[i] = Aleatorio(-100,100)
		FinPara
	FinSi
FinSubProceso

SubProceso operarArreglo(operacion Por Valor,tamanho Por Valor, vector1 Por Referencia, vector2 Por Referencia, vector Por Referencia )
		Definir i Como Entero
		
		Si operacion = "+" Entonces
			Para i=0 Hasta tamanho- 1 Hacer
				vector[i] = vector2[i] + vector1[i]
			FinPara
		SiNo
			Para i=0 Hasta tamanho- 1 Hacer
				vector[i] = vector2[i] - vector1[i]
			FinPara
		FinSi
FinSubProceso


SubProceso  menu
	// Se define real porque es menos probable que se rompa en ejecucion en el ingreso de la variable
	Definir choice,choiceVector,letter Como Caracter
	Definir number,i,tamanho,vectorA,vectorB,vectorC Como Real
	Definir salir Como Logico
	
	Escribir Sin Saltar "Tamaño del arreglo "
	Leer tamanho
	Dimension vectorA[tamanho]
	Dimension vectorB[tamanho]
	Dimension vectorC[tamanho]
	
	salir = Falso
	llenarArreglo(tamanho, 0,vectorA)
	llenarArreglo(tamanho, 0,vectorB)
	llenarArreglo(tamanho, 0,vectorC)
	Repetir
		Limpiar Pantalla
		Escribir "Opciones "
		Escribir "1- Llenar Vector A"
		Escribir "2- Llenar Vector B"
		Escribir "3- Llenar Vector C (A+B)"
		Escribir "4- Llenar Vector C (B-A)"
		Escribir "5- Mostrar"
		Escribir "6- Salir"
		Escribir sin saltar "Selecciona alguna de las opciones anteriores "
		Leer choice
		Segun choice Hacer
			"1":
				llenarArreglo(tamanho,1,vectorA)
			"2":
				llenarArreglo(tamanho,1,vectorB)
			"3":
				operarArreglo("+", tamanho, vectorA, vectorB, vectorC)
			"4":
				operarArreglo("-", tamanho, vectorA, vectorB, vectorC)
			"5":
				Repetir
					Limpiar Pantalla
					Escribir "Opciones "
					Escribir "(A) Vector A"
					Escribir "(B) Vector B"
					Escribir "(C) Vector C"
					Escribir "(S) Salir"
					Escribir sin saltar "Selecciona alguna de las opciones anteriores "
					Leer choiceVector
					choiceVector = Mayusculas(choiceVector)
					Segun choiceVector Hacer
						"A":
							mostrarVector( vectorA, tamanho, "A" )
						"B":
							mostrarVector( vectorB, tamanho, "B" )
						"C":
							mostrarVector( vectorC, tamanho, "C" )
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
			"6":
				salir = Verdadero
				Escribir "Hasta la vista baby"
			De Otro Modo:
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

Algoritmo vectoresMenuVivo
	menu	
FinAlgoritmo
