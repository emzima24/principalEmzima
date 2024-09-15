// Actividad 4
// Diseña un programa que trabaje con un vector de datos lógicos 
// de tamaño 5. El programa debe realizar las siguientes tareas:
//
//		1. Llenar el vector con valores lógicos (verdadero o falso)
//			ingresados por el usuario.
//		2. Mostrar en pantalla el vector original.
//		3. Determinar y mostrar un mensaje en pantalla indicando 
//			si todos los elementos del vector son verdaderos.
//		4. Determinar y mostrar un mensaje en pantalla indicando si al menos 
//			uno de los elementos del vector es verdadero, junto 
//			con la posición en la que se encuentra.
//		5. Determinar y mostrar un mensaje en pantalla indicando 
//			si todos los elementos del vector son falsos.
//		6. Determinar y mostrar un mensaje en pantalla indicando si al menos 
//			uno de los elementos del vector es falso, junto 
//			con la posición en la que se encuentra.



Funcion mostrarVector( arreglo1, tamanho,letter )
	Definir i Como Real
	Escribir "El arreglo (" letter ") es "
	Para i <- 0 Hasta tamanho-1 Hacer
		Escribir Sin Saltar arreglo1[i] ", "
		Escribir ""
	FinPara
	Escribir ""
Fin Funcion


SubProceso  llenarArregloBool(tamanho por Valor, valores Por Valor, vector1 Por Referencia, campo Por Valor)
	Definir i Como Entero
	Definir variable Como Logico
	Segun valores Hacer
		"aleatorio":
			Para i <- 0 Hasta tamanho -1 Hacer
				Si Aleatorio(1,10) <= 5 Entonces
					vector1[i] = Verdadero
				SiNo
					vector1[i] = Falso
				FinSi
			FinPara
		"usuario":
			Para i <- 0 Hasta tamanho -1 Hacer
				Escribir "Introduce el " campo
				Leer variable
				vector1[i] = variable
			FinPara
	FinSegun
FinSubProceso

Funcion  operarArreglo(tamanho por Valor, vector1 Por Referencia, campo Por Valor)
	Definir i,ver,fal, resultado,posVer, posFal,countPosVer,countPosFal  Como Real
	Dimension posFal[5],posVer[5]
	countPosVer = 0
	countPosFal = 0
	Para i <- 0 Hasta tamanho -1 Hacer
		Si vector1[i] Entonces
			posVer[countPosVer] = i
			countPosVer = countPosVer + 1
		SiNo
			posFal[countPosFal] = i
			countPosFal = countPosFal + 1
		FinSi		
	FinPara
	Si countPosVer = 5 Entonces
		Escribir "Todos los elementos son verdaderos"
	SiNo
		Si countPosFal = 5 Entonces
			Escribir "Todos los elementos son falsos"
		SiNo
			Escribir "Hay al menos un elemento verdadero, en la(s) posicion(es) " 
			Para i <- 0 Hasta countPosVer-1 Hacer
				Escribir Sin Saltar posVer[i] ", "
				Escribir ""
			FinPara
			Escribir "Hay al menos un elemento falso, en la(s) posicion(es) " 
			Para i <- 0 Hasta countPosFal-1 Hacer
				Escribir Sin Saltar posFal[i] ", "
				Escribir ""
			FinPara
		FinSi
	FinSi
FinFuncion

SubProceso  menu
	// Se define real porque es menos probable que se rompa en ejecucion en el ingreso de la variable y se mantiene para otros los casos por economia de codigo
	Definir choice,choiceVector,letter Como Caracter
	Definir number,i,tamanho Como Real
	Definir salir,vectorB,vector1 Como Logico
	
	Dimension vectorB[5]
	
	salir = Falso
	llenarArregloBool(5, "aleatorio",vectorB,"Ninguno")
	
	Repetir
		Limpiar Pantalla
		Escribir "Opciones "
		Escribir "TRAE LLENO UNOS VALORES  LOGICOS ALEATORIOS"
		Escribir "1- Llenar arreglo valores logicos Usuario"
		Escribir "2- Mostrar"
		Escribir "3- Operaciones"
		Escribir "4- Salir"
		Escribir sin saltar "Selecciona alguna de las opciones anteriores "
		Leer choice
		Segun choice Hacer
			"1":
				llenarArregloBool(5, "usuario",vectorB,"boleano ")
				
			"2":
				mostrarVector( vectorB, 5, "de Boleanos" )
			"3":
				operarArreglo(5, vectorB, "Ninguno")
			"4":
				salir = Verdadero
				Escribir "Hasta la vista baby"
			De Otro Modo:
				Escribir "del 0 al 3 boludo"
		Fin Segun
		Si choice <> "4"
			Escribir 'Presione enter para volver al menu principal'
		SiNo
			Escribir 'Presione enter para salir'
		FinSi
		Esperar Tecla	
	Mientras Que salir = Falso
FinSubProceso

Algoritmo comparacionLogica
	menu	
FinAlgoritmo