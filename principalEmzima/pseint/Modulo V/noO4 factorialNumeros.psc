// Complementario 4 (SE PUEDE COMPARAR CON LA VERSION RECURSIVA EN EL MODULO VII noOANEXO factorialRecursivo)
// La función factorial se aplica a números enteros positivos. El factorial de un número
// entero positivo (!n) es igual al producto de todos los enteros positivos desde 1 hasta n:
//
//n! = 1 * 2 * 3 * 4 * 5 * ... * (n-1) * n.
//
// Escribir un programa que calcule el factorial de todos los números enteros desde 1 hasta n
//
// El programa deberá mostrar la siguiente salida:
// !1 = 1
// !2 = 1*2 = 2
// ...
// !5 = 1*2*3*4*5 = 120



Algoritmo factorialNumeros
	// Se define real porque es menos probable que se rompa en ejecucion en el ingreso de la variable
	Definir numberEntry,numberEntryOne,numberEntryTwo,numberEntryThree,factorial Como Real
	Definir seriesText Como Caracter
	Escribir Sin Saltar"Introduce un número "
	Leer numberEntryTwo 
	//numberEntryTwo = 5
	Para numberEntry<- 1 Hasta numberEntryTwo Con Paso 1 Hacer
		factorial = 1
		seriesText = ""
		Para numberEntryThree<- 1 Hasta numberEntry Con Paso 1 Hacer
			factorial = factorial*1* numberEntryThree
			Si numberEntryThree= 1  Entonces
				seriesText = seriesText + ConvertirATexto(numberEntryThree)
			SiNo
				seriesText = seriesText + ","+ConvertirATexto(numberEntryThree)
			FinSi
		Fin Para
		Escribir "!",numberEntry," = ",seriesText," = ",factorial
	Fin Para
FinAlgoritmo
