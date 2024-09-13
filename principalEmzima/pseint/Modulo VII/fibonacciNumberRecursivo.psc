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
	Definir num Como Real
	Escribir "Escribe el numero "
	//Leer num
	num = 3
	Escribir "Con f(" num ") " fibonacci(num)
	
FinAlgoritmo
