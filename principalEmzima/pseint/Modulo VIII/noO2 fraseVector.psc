Funcion mostrarVector( number, tamanho,letter )
	Definir i Como Real
	Escribir Sin Saltar"El arreglo (" letter ") es "
	Para i <- 0 Hasta tamanho-1 Hacer
		Escribir Sin Saltar number[i] ", "
	FinPara
	Escribir ""
Fin Funcion

SubProceso  llenarArreglo(tamanho por Valor, frase Por Referencia, vector Por Referencia)
	//Definir vector Como Caracter
	Definir i Como Entero
	Para i <- 0 Hasta tamanho-1 Hacer
		vector[i] = Subcadena(frase,i,i)
	FinPara
	Si tamanho<19 Entonces
		Para i <- tamanho Hasta 19 Hacer
			vector[i] = " "
		FinPara
	FinSi
FinSubProceso

SubProceso  operarArreglo( tamanho por Valor, vector Por Referencia)
	Definir i, posicion Como Entero
	Definir char Como Caracter	
	Escribir "Indica un caracter "
	Leer char
	Escribir "En que posición deseas colocarlo "
	Leer posicion
	Si vector[posicion] = " " Entonces
		vector[posicion] = char
		mostrarVector( vector, tamanho,"Cambiada" )
	SiNo
		Escribir "La posición (" posicion ") está ocupada"
	FinSi
	
FinSubProceso

SubProceso  menu
	Definir choice,choiceVector,letter,frase,vectorUnidimensional Como Caracter
	//Definir acumCemento, acumArena, acumLadrillos, acumPiedras, acumHierro8, acumHierro4, acumHierro10, acumPiedrasVol, acumHierro6, acumPintura, acumIluminacion Como Real
	//Definir a, b, c Como Real
	Definir number,i,tamanho,vectorA,vectorB,vectorC Como Real
	Definir salir Como Logico
	
	Dimension vectorUnidimensional[20]
	salir = Falso
	Repetir
		Limpiar Pantalla
		Escribir "Opciones "
		Escribir "0- Ingresar frase"
		Escribir "1- Llenar Vector con la frase"
		Escribir "2- Modificar el Vector"
		Escribir "3- Mostrar el vector"
		Escribir "4- Salir"
		Escribir sin saltar "Selecciona alguna de las opciones anteriores "
		Leer choice
		Segun choice Hacer
			"0":
				Repetir
					Escribir Sin Saltar "Escribir una frase de maximo 20 caracteres "
					Leer frase
				Mientras Que Longitud(frase)>20
			"1":
				llenarArreglo(Longitud(frase),frase,vectorUnidimensional)
			"2":
				operarArreglo(20, vectorUnidimensional)
			"3":
				mostrarVector( vectorUnidimensional, 20, "Frase" )
			"4":
				salir = Verdadero
				Escribir "Hasta la vista baby"
			De Otro Modo:
				Escribir "del 1 al 6 boludo"
		Fin Segun
		Si choice <> "4"
			Escribir 'Presione enter para volver al menu principal'
		SiNo
			Escribir 'Presione enter para salir'
		FinSi
		Esperar Tecla	
	Mientras Que salir = Falso
FinSubProceso

Algoritmo fraseVector
	menu	
FinAlgoritmo
