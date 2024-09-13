Funcion f <-funcionFactorial(n)
	Definir f Como Entero
    Si n = 0 O n = 1 Entonces
        f=1	// funcion base que detiene la recursion
    Sino
		f= n * funcionFactorial(n - 1) // invocacion recursiva 
    FinSi
FinFuncion

Algoritmo FactorialRecursivo
    Definir num Como Entero
	
    Escribir "Ingrese un número:"
    Leer num
	
    Escribir "El factorial de ", num, " es ", funcionFactorial(num)	
FinAlgoritmo