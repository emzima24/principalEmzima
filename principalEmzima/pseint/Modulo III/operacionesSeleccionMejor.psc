Algoritmo operacionesSeleccionMejor
	Definir operacionSeleccion Como Caracter
	Definir numeroUno, numeroDos Como Real
	Escribir sin saltar "Escribe la inicial de una de las operaciones (S)uma, (R)esta, (M)ultiplicaci�n y (D)ivisi�n que desees que se ejecute "
	Leer operacionSeleccion
	operacionSeleccion = Mayusculas(operacionSeleccion)
	Escribir sin saltar "Escribe un n�mero entero "
	Leer numeroUno
	Escribir sin saltar "Escribe un n�mero entero "
	Leer numeroDos
	Segun operacionSeleccion Hacer
		"S":
			Escribir "La suma de ",numeroUno," m�s ",numeroDos, " es ", numeroUno+numeroDos
		"R":
			Escribir "La resta de ",numeroUno," menos ",numeroDos, " es ", numeroUno-numeroDos
		"M":
			Escribir "La multiplicaci�n de ",numeroUno," por ",numeroDos, " es ", numeroUno*numeroDos
		"D":
			Si numeroDos <> 0 Entonces
				Escribir "La divisi�n de ",numeroUno," entre ",numeroDos, " es " , numeroUno/numeroDos
			SiNo
				Escribir  "che en serio dividir entre 0?"
			Fin Si
			
		De Otro Modo:
			Escribir  "che, escribir S, R, M o D..."
	Fin Segun
FinAlgoritmo
