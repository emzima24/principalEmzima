// Complementario 2
// Se requiere desarrollar un programa que maneje un vector unidimensional de 20 
// elementos de tipo carácter. El programa debe realizar las siguientes tareas:
//
// 		1. Solicita al usuario una frase y luego ingresa cada una de sus letras en el arreglo, 
// 		asegurándote de que se consideren los espacios en blanco como caracteres. Para facilitar 
// 		esta tarea, puedes utilizar la función Subcadena de PSeInt. Asegúrate también de 
// 		validar que la frase tenga como máximo 20 caracteres.
//	
//		2. Posteriormente, solicitar al usuario un carácter y una posición dentro del arreglo. 
//		El programa debe intentar insertar el carácter en la posición indicada, siempre y cuando 
//		haya espacio disponible (es decir, la posición esté vacía o contenga un espacio en blanco). 
//		Si la operación es exitosa, se mostrará el vector con la frase y el carácter ingresado. 
//		En caso contrario, se emitirá un mensaje al usuario indicando que la posición está ocupada.
//		
//		Por ejemplo, suponiendo la siguiente frase y los subíndices del vector:
//			B	i	e	n	v	e	n	i	d	o	 	u	s	u	a	r	i	o	!	 
//			0	1	2	3	4	5	6	7	8	9	10	11	12	13	14	15	16	17	18	19
//		
//		Si se desea ingresar el carácter "%" en la posición 10, entonces el resultado sería:
//			B	i	e	n	v	e	n	i	d	o	%	u	s	u	a	r	i	o	!	 
//			0	1	2	3	4	5	6	7	8	9	10	11	12	13	14	15	16	17	18	19
// Se define real porque es menos probable que se rompa en ejecucion en el ingreso de la variable
// Se define real por costumbre mas que por otra razon cuando la memoria importe lo consideraremos distinto



Funcion mostrarVector( frase, number, tamanho,letter )
	Definir i Como Real
	Si Longitud(frase)<> 0 Entonces
		Escribir Sin Saltar"El arreglo (" letter ") es "
		Para i <- 0 Hasta tamanho-1 Hacer
			Escribir Sin Saltar number[i] ", "
		FinPara
		Escribir ""
	SiNo
		Escribir "Esta vacia la frase boludo"
	FinSi
Fin Funcion

SubProceso  llenarArreglo(tamanho por Valor, frase Por Referencia, vector Por Referencia)
	//Definir vector Como Caracter
	Definir i Como Entero
	Si Longitud(frase)<> 0 Entonces
		Para i <- 0 Hasta tamanho-1 Hacer
			vector[i] = Subcadena(frase,i,i)
		FinPara
		Si tamanho<19 Entonces
			Para i <- tamanho Hasta 19 Hacer
				vector[i] = " "
			FinPara
		FinSi
	SiNo
		Escribir "Esta vacia la frase boludo"
	FinSi
FinSubProceso

SubProceso  operarArreglo( frase Por Valor, tamanho por Valor, vector Por Referencia)
	Definir i, posicion Como Entero
	Definir char Como Caracter
	
	Si Longitud(frase)<> 0 Entonces
		Escribir "Indica un caracter "
		Leer char
		Repetir
			Escribir "En que posición deseas colocarlo entre 0 y " tamanho-1 
			Leer posicion
		Mientras Que posicion < 0 O posicion > tamanho-1
		Si vector[posicion] = " " Entonces
			vector[posicion] = char
			mostrarVector( frase, vector, tamanho,"Cambiada" )
		SiNo
			Escribir "La posición (" posicion ") está ocupada"
		FinSi
	SiNo
		Escribir "Esta vacia la frase boludo"
	FinSi
	
FinSubProceso

SubProceso  menu
	Definir choice,choiceVector,letter,frase,vectorUnidimensional Como Caracter
	// Se define real porque es menos probable que se rompa en ejecucion en el ingreso de la variable y se mantiene para todos los casos por economia de codigo
	Definir number,i,tamanho,vectorA,vectorB,vectorC Como Real
	Definir salir Como Logico
	
	Dimension vectorUnidimensional[20]
	salir = Falso
	frase = ''
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
				operarArreglo(frase, 20, vectorUnidimensional)
			"3":
				mostrarVector( frase, vectorUnidimensional, 20, "Frase" )
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
