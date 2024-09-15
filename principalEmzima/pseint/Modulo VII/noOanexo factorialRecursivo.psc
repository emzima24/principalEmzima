// Complementario ANEXO NO FUE SOLICITADO PERO SE REFERENCIA CON LA VERSION "NORMAL" EN EL MODULO V noO4 factorialNumeros
// La función RECURSIVA factorial se aplica a números enteros positivos. El factorial de un número
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



Funcion f <-funcionFactorial(n)
	Definir f Como Real
    Si n = 0 O n = 1 Entonces
        f=1	// funcion base que detiene la recursion
    Sino
		f= n * funcionFactorial(n - 1) // invocacion recursiva 
    FinSi
FinFuncion

Algoritmo FactorialRecursivo
	// Se define real porque es menos probable que se rompa en ejecucion en el ingreso de la variable
    Definir num Como Real
	
    Escribir "Ingrese un número:"
    Leer num
	
    Escribir "El factorial de ", num, " es ", funcionFactorial(num)	
FinAlgoritmo