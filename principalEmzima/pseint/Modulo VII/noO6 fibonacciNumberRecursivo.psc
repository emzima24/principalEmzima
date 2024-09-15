// Complementario 6
// Crea una funci�n RECURSIVA que devuelva el t�rmino n de la sucesi�n de Fibonacci. 
// La sucesi�n de Fibonacci es: 1, 1, 2, 3, 5, 8, 13, 21, 34, ... 
// donde cada n�mero se calcula sumando los dos anteriores. Por ejemplo:
//
// Fibonacci(2) = 1 + 1
//
// Fibonacci(3) = 1 + 2
//
// Fibonacci(5) = 2 + 3
//
// La sucesi�n de Fibonacci se define como:
//	
// Fibonacci(n) = Fibonacci(n-1) + Fibonacci(n-2) para todo n > 1
//		
// Fibonacci(n) = 1 para todo n <= 1
//			
// Crea una funci�n que reciba el valor de n y calcule la serie hasta llegar a ese valor. Para m�s informaci�n sobre la sucesi�n de Fibonacci, consulte wikipedia

// Se define real porque es menos probable que se rompa en ejecucion en el ingreso de la variable
// Se define real porque es menos probable que se rompa en ejecucion en el ingreso de la variable y se mantiene para todos los casos por economia de codigo
// Se define real por costumbre mas que por otra razon cuando la memoria importe lo consideraremos distinto



Funcion numFibonacci <- fibonacci ( num )
	Definir numFibonacci Como Real
	Si num = 0 Entonces
		numFibonacci = 0
	SiNo
		Si num = 1 O num = 2 Entonces
			numFibonacci = 1
		SiNo
			numFibonacci = fibonacci(num-1)+fibonacci(num-2)
		FinSi
	FinSi
Fin Funcion

Algoritmo fibonacciNumberRecursivo
	// Se define real porque es menos probable que se rompa en ejecucion en el ingreso de la variable y se mantiene para todos los casos por economia de codigo
	Definir num Como Real
	Escribir "Escribe el numero "
	Leer num
//	num = 3
	Escribir "Con f(" num ") " fibonacci(num)
	
FinAlgoritmo
