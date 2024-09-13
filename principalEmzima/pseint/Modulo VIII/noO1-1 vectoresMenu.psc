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

SubProceso  operarArreglo(operacion por Valor, tamanho por Valor, vector1 Por Referencia, vector2 Por Referencia, vector Por Referencia)
	Definir i Como Entero
	Si operacion = "+" Entonces
		Para i <- 0 Hasta tamanho -1 Hacer
			vector[i] = vector2[i] + vector1[i]
		FinPara
	SiNo
		Para i <- 0 Hasta tamanho -1 Hacer
			vector[i] = vector2[i] - vector1[i]
		FinPara
	FinSi
	
FinSubProceso

SubProceso  menu
	Definir choice,choiceVector,letter Como Caracter
	//Definir acumCemento, acumArena, acumLadrillos, acumPiedras, acumHierro8, acumHierro4, acumHierro10, acumPiedrasVol, acumHierro6, acumPintura, acumIluminacion Como Real
	//Definir a, b, c Como Real
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

Algoritmo vectoresMenu
	menu	
FinAlgoritmo