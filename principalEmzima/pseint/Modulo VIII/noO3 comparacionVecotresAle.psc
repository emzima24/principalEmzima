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
	//Definir acumCemento, acumArena, acumLadrillos, acumPiedras, acumHierro8, acumHierro4, acumHierro10, acumPiedrasVol, acumHierro6, acumPintura, acumIluminacion Como Real
	//Definir a, b, c Como Real
	Definir number,i,tamanho,vectorA,vectorB Como Real
	Definir salir, isIgual Como Logico
	
	//Escribir Sin Saltar "Tama�o del arreglo "
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