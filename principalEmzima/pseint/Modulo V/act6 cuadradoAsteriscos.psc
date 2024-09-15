// Actividad 6
// Desarrollar un programa que lea un número entero (que representa el tamaño del lado) 
// y genere un cuadrado de asteriscos con ese tamaño. Los asteriscos sólo se ubicarán en el 
// borde del cuadrado, no en su interior. Por ejemplo, si se ingresa el número 4, se mostrará:
//
// * * * *
// *     *
// *     *
// * * * *
//
// Nota: Recordar el uso del escribir sin saltar en PseInt.



Algoritmo cuadradoAsteriscos
	// Se define real porque es menos probable que se rompa en ejecucion en el ingreso de la variable
	Definir numberEntryOne,numberEntryTwo,numberEntryThree  Como Real
	Escribir Sin Saltar"Introduce un número de lado "
	Leer numberEntryTwo 
	Para numberEntryOne<- 1 Hasta numberEntryTwo Con Paso 1 Hacer
		Para numberEntryThree<- 1 Hasta  (numberEntryTwo) Con Paso 1 Hacer
			Si (numberEntryOne = 1) O (numberEntryOne = numberEntryTwo) Entonces
				Escribir sin saltar "*"
			SiNo
				Si (numberEntryThree = 1) O (numberEntryThree = numberEntryTwo) Entonces
					Escribir sin saltar "*"
				SiNo
					Escribir sin saltar " "
				FinSi
			FinSi
		Fin Para
		Escribir ""
	Fin Para
FinAlgoritmo
