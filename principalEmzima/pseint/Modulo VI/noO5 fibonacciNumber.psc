// Complementario 5
// Crea una funci�n que devuelva el t�rmino n de la sucesi�n de Fibonacci. 
// La sucesi�n de Fibonacci es: 1, 1, 2, 3, 5, 8, 13, 21, 34, ... 
// donde cada n�mero se calcula sumando los dos anteriores. Por ejemplo:
//
// Fibonacci(0) = 0
//
// Fibonacci(1) = 1
//
// Fibonacci(2) = Fibonacci(1) + Fibonacci(0) = 1 + 0 = 1
//
// Fibonacci(3) = Fibonacci(2) + Fibonacci(1) = 1 + 1 = 2
//
// Fibonacci(4) = Fibonacci(3) + Fibonacci(2) = 2 + 1 = 3
//
// Fibonacci(5) = Fibonacci(4) + Fibonacci(3) = 3 + 2 = 5
//
// La sucesi�n de Fibonacci se define como:
//	
// Fibonacci(n) = Fibonacci(n-1) + Fibonacci(n-2) para todo n > 1
//		
// Fibonacci(n) = 1 para todo n <= 1
//			
// Crea una funci�n que reciba el valor de n y calcule la serie hasta llegar a ese valor. Para m�s informaci�n sobre la sucesi�n de Fibonacci, consulte wikipedia



Funcion numFibonacci <- fibonacci ( num )
	// Se define real por costumbre mas que por otra razon cuando la memoria importe lo consideraremos distinto
	Definir numFibonacci,i,numfTemp,numf0,numf1 Como Real
	numf1 = 1
	numf0 = 0
	Si num < 3 Entonces
		Si num = 0 Entonces
			numf1 = numf0
		FinSi
	SiNo
			Para i <- 2 hasta num Hacer
				numfTemp = numf0 + numf1
				numf0 = numf1
				numf1 = numfTemp
			FinPara
	FinSi
	
	numFibonacci = numf1
Fin Funcion

Algoritmo fibonacciNumber
	// Se define real porque es menos probable que se rompa en ejecucion en el ingreso de la variable
	Definir num Como Real
	Escribir "Escribe el numero "
	Leer num
	//num = 8
	Escribir "Con f(" num ") " fibonacci(num)
	
FinAlgoritmo
