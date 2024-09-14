// Actividad 2
// Desarrolla un programa que simule un menú de opciones para realizar las cuatro 
// operaciones aritméticas básicas (suma, resta, multiplicación y división) con dos 
// valores numéricos enteros. El usuario deberá especificar la operación deseada 
// utilizando el primer carácter de la operación: 'S' para suma, 'R' para resta, 
// 'M' para multiplicación, y 'D'  para división. Recuerda nombrar y guardar tu algoritmo.



Algoritmo operacionesSeleccionMejor
	Definir operacionSeleccion Como Caracter
	// Se define real porque es menos probable que se rompa en ejecucion en el ingreso de los enteros
	Definir numeroUno, numeroDos Como Real
	Escribir sin saltar "Escribe la inicial de una de las operaciones (S)uma, (R)esta, (M)ultiplicación y (D)ivisión que desees que se ejecute "
	Leer operacionSeleccion
	operacionSeleccion = Mayusculas(operacionSeleccion)
	Escribir sin saltar "Escribe un número entero "
	Leer numeroUno
	Escribir sin saltar "Escribe un número entero "
	Leer numeroDos
	Segun operacionSeleccion Hacer
		"S":
			Escribir "La suma de ",numeroUno," más ",numeroDos, " es ", numeroUno+numeroDos
		"R":
			Escribir "La resta de ",numeroUno," menos ",numeroDos, " es ", numeroUno-numeroDos
		"M":
			Escribir "La multiplicación de ",numeroUno," por ",numeroDos, " es ", numeroUno*numeroDos
		"D":
			Si numeroDos <> 0 Entonces
				Escribir "La división de ",numeroUno," entre ",numeroDos, " es " , numeroUno/numeroDos
			SiNo
				Escribir  "che en serio dividir entre 0?"
			Fin Si
			
		De Otro Modo:
			Escribir  "che, escribir S, R, M o D..."
	Fin Segun
FinAlgoritmo
