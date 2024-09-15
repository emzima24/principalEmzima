// Complementario 3 EJERCICIO REALIZADO EN VIVO
// Desarrolla un programa que inicialice un arreglo de números, permitiéndote elegir 
// el tipo y tamaño del arreglo. Asigna valores aleatorios entre 15 y 155. Posteriormente:
//  	1. Crea una función para calcular la suma de TODOS LOS ELEMENTOS CON ÍNDICE IMPAR. 
//		El número 0(cero) no será contemplado en este grupo. Es decir, los elementos del vector con índice 1,3,5 etc. 
//	
// 		2. Crea una función para calcular la suma de TODOS LOS ELEMENTOS CON ÍNDICE PAR. 
//		El número 0(cero) debe ser contemplado en este grupo. Es decir, los elementos del vector con índice 0,2,4,6 etc. 


SubProceso mostrarVector(v1 ,tam )
	Definir i Como Entero
	Escribir "Los valores son los siguientes: "
	Para i = 0 Hasta tam - 1 Hacer
		Escribir v1(i)  "," Sin Saltar
	FinPara
	Escribir ""
FinSubProceso

SubProceso llenarArregloNum(v1 por Referencia,tipo Por Valor,tam por Valor)
	Definir i Como Entero
	Para i = 0 Hasta tam - 1 Hacer
		Si tipo = "variableEntero" Entonces
			
			v1[i] = Aleatorio(1,100)
		SiNo
			v1[i] = Aleatorio(10,1000)/10
		FinSi
	FinPara
FinSubProceso

Funcion operarArreglo (tam por Valor,  v1 por Referencia)
	Definir i,max, min Como Real
    max =	v1[0]
	min =	v1[0]
	Para i = 1 Hasta tam - 1 Hacer
		Si v1[i] > max Entonces
			max = v1[i] 
		FinSi
		Si v1[i] < min Entonces
			min = v1[i] 
		FinSi
	FinPara
	Escribir "maximo" max 
	Escribir "minimo" min
	Escribir "diferencia" max - min
FinFuncion



SubProceso  menu
	// Se define real porque es menos probable que se rompa en ejecucion en el ingreso de la variable y se mantiene para otros de los casos por economia de codigo
	Definir choice,choiceVector,letter,tipo,mensaje,variable Como Caracter
	Definir number,i,tamanho,arregloEntero,arregloReal,arreglo Como Real
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
					llenarArregloNum(tamanho, "variableReal", arreglo)
					variable = "Real"
				SiNo
					llenarArregloNum(arreglo, "variableEntera", tamanho)
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
							operarArreglo(tamanho,  arreglo)
						"2":
							mostrarVector( arreglo, tamanho)	
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

Algoritmo vivoSumaRecursivaImparPar
	menu	
FinAlgoritmo
