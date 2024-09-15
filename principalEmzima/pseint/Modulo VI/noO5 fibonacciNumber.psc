// Complementario 5
// Crea una funci�n que devuelva el t�rmino n de la sucesi�n de Fibonacci. 
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



Funcion numFibonacci <- fibonacci ( num )
	// Se define real por costumbre mas que por otra razon cuando la memoria importe lo consideraremos distinto
	Definir numFibonacci,i,num4,num2,num3 Como Real
	num3 = 1
	num2 = 1
	Para i <- -1 hasta num Hacer
		Segun num Hacer
			0:
				num3 = 0
			1:	
				num3 = 1
			2:
				num3 = 1
			De Otro Modo:
				Si i>=3 Entonces
					num4 = num2 + num3
					num2 = num3
					num3 = num4
				FinSi
		FinSegun
		
	FinPara
	numFibonacci = num3
Fin Funcion

Algoritmo fibonacciNumber
	// Se define real porque es menos probable que se rompa en ejecucion en el ingreso de la variable
	Definir num Como Real
	Escribir "Escribe el numero "
	Leer num
	num = 8
	Escribir "Con f(" num ") " fibonacci(num)
	
FinAlgoritmo
