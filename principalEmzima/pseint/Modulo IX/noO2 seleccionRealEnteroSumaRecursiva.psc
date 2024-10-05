// Complementario 2
// Desarrolla una función recursiva que calcula la suma de un arreglo de números enteros o reales, 
// según la preferencia del usuario. La función debe tomar como entrada el arreglo, su longitud y el 
// tipo de números contenidos en él. Luego, devolverá la suma total de todos los elementos del arreglo. 
// Esta función puede ser aplicada a arreglos de cualquier tamaño deseado, permitiendo al usuario 
// manipular conjuntos de datos de manera eficiente y versátil. La implementación de esta función 
// proporcionará práctica en el uso de la recursión para operaciones sobre arreglos.



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

Funcion  resultado <- operarArreglo(tamanho, vector1, campo)
	Definir i, resultado,vector1temp Como Real
	
	Si tamanho = 0 Entonces
		resultado = 0
	SiNo
		resultado = vector1[tamanho-1] + operarArreglo(tamanho-1,  vector1, campo)
	FinSi
FinFuncion


SubProceso  menu
	// Se define real porque es menos probable que se rompa en ejecucion en el ingreso de la variable y se mantiene para otros de los casos por economia de codigo
	Definir choice,choiceVector,letter,tipo,mensaje,variable Como Caracter
	Definir number,i,tamanho,arregloTemporal,arreglo Como Real
	Definir salir,salir2 Como Logico
	
	salir = Falso	
	Repetir
		Limpiar Pantalla
		Escribir "Opciones "
		Escribir "1- Seleccionar tipo y tamaño del arreglo"
		Escribir "2- Salir"
		Escribir sin saltar "Selecciona alguna de las opciones anteriores "
		Leer choice
		Segun choice Hacer
			"1":
				salir2 = Falso
				Escribir Sin Saltar "Tamaño del arreglo "
				Leer tamanho
				Dimension arreglo[tamanho], arregloTemporal[tamanho]
				tipo = ""
				mensaje = ""
				variable = "Entero"
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
					variable = "variableReal"
				SiNo
					llenarArregloNum(tamanho, "variableEntera", arreglo, "Ninguno")
					variable = "variableEntera"
				FinSi				
				
				Repetir
					Limpiar Pantalla
					Escribir "Opciones "
					Escribir "1- Suma recursiva"
					Escribir "2- Mostrar"
					Escribir "3- Salir"
					Escribir sin saltar "Selecciona alguna de las opciones anteriores "
					Leer choiceVector
					Segun choiceVector Hacer
						"1":
							Escribir "La suma recursiva es " operarArreglo(tamanho,  arreglo,  variable)
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

Algoritmo seleccionRealEnteroSumaRecursiva
	menu	
FinAlgoritmo
