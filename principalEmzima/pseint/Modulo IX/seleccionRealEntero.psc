Funcion mostrarVector( arreglo1, tamanho,letter )
	Definir i Como Real
	Escribir "El arreglo (" letter ") es "
	Para i <- 0 Hasta tamanho-1 Hacer
		Escribir Sin Saltar arreglo1[i] ", "
	FinPara
	Escribir ""
Fin Funcion


SubProceso  llenarArregloNum(tamanho por Valor, valores Por Valor, vector1 Por Referencia, campo Por Valor)
	Definir i Como Entero
	Definir variable Como Caracter
	Segun valores Hacer
		"ceros":
			Para i <- 0 Hasta tamanho -1 Hacer
				vector1[i] = 0
				FinPara
		"variableReal":
			Para i <- 0 Hasta tamanho -1 Hacer
				vector1[i] = Aleatorio(1,100)/10
			FinPara
		"variableEntera":
			Para i <- 0 Hasta tamanho -1 Hacer
				vector1[i] = Aleatorio(1,100)
			FinPara
	FinSegun
FinSubProceso

Funcion  resultado <- operarArreglo(tamanho por Valor, vector1 Por Referencia, campo Por Valor)
	Definir i,min,max, resultado Como Real
	min = vector1[0]
	max = vector1[0]
	Para i <- 1 Hasta tamanho -1 Hacer
		Si vector1[i] > max Entonces
			max = vector1[i]
		FinSi
		Si vector1[i] < min Entonces
			min = vector1[i]
		FinSi
		
	FinPara
	resultado = max - min
FinFuncion


SubProceso  menu
	Definir choice,choiceVector,letter,tipo,mensaje,variable Como Caracter
	//Definir acumCemento, acumArena, acumLadrillos, acumPiedras, acumHierro8, acumHierro4, acumHierro10, acumPiedrasVol, acumHierro6, acumPintura, acumIluminacion Como Real
	//Definir a, b, c Como Real
	
	Definir number,i,tamanho,arregloEntero,arregloReal,arreglo Como Real
	Definir salir,salir2 Como Logico
		
	salir = Falso	
	Repetir
		Limpiar Pantalla
		Escribir "Opciones "
		Escribir "1- Seleccionar tipo y tama�o del arreglo"
		Escribir "2- Salir"
		Escribir sin saltar "Selecciona alguna de las opciones anteriores "
		Leer choice
		Segun choice Hacer
			"1":
				salir2 = Falso
				Escribir Sin Saltar "Tama�o del arreglo "
				Leer tamanho
				Dimension arreglo[tamanho]
				tipo = ""
				mensaje = ""
				Repetir
					Si tipo <> "" Entonces
							mensaje = "Boludo en serio..."
					FinSi
					Escribir Sin Saltar "Tipo (R)eal o (E)ntero " mensaje
					Leer tipo
					tipo = mayusculas(tipo)
				Mientras Que tipo <> "R" Y tipo <> "E"
				Si tipo = "R" Entonces
					llenarArregloNum(tamanho, "variableReal", arreglo, "Ninguno")
					variable = "Real"
				SiNo
					llenarArregloNum(tamanho, "variableEntera", arreglo, "Ninguno")
					variable = "Entero"
				FinSi				
			
				Repetir
					Limpiar Pantalla
					Escribir "Opciones "
					Escribir "1- Diferencia entre maximo y minimo"
					Escribir "2- Mostrar"
					Escribir "3- Salir"
					Escribir sin saltar "Selecciona alguna de las opciones anteriores "
					Leer choiceVector
					Segun choiceVector Hacer
						"1":
							Escribir "La diferencia entre max y min es " operarArreglo(tamanho,  arreglo, "Ninguno")
						"2":
							mostrarVector( arreglo, tamanho,variable )	
						"3":
							salir2 = Verdadero
							salir = Verdadero
							Escribir "Hasta la vista baby"
						De Otro Modo:
							Escribir "del 1 al 3 boludo"
					Fin Segun
					Si choiceVector <> "3"
						Escribir 'Presione enter para volver al menu principal'
					SiNo
						Escribir 'Presione enter para salir'
					FinSi
					Esperar Tecla	
				Mientras Que salir2 = Falso
				
			"2":
				salir = Verdadero
				Escribir "Hasta la vista baby"
			De Otro Modo:
				Escribir "del 1 al 2 boludo"
		Fin Segun
		Si choice <> "2"
			Escribir 'Presione enter para volver al menu principal'
		SiNo
			Escribir 'Presione enter para salir'
		FinSi
		Esperar Tecla	
	Mientras Que salir = Falso
FinSubProceso

Algoritmo seleccionRealEntero
	menu	
FinAlgoritmo