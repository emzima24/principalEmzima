Funcion acum <-funcionSuma(num)
	Definir acum Como Entero
    Si num = 0 Entonces
        acum=0	// funcion base que detiene la recursion
    Sino
		acum= num + funcionSuma(num - 1) // invocacion recursiva 
		//          acum = 5 + f(5-1)
		//f(5-1) =  acum = 4 + f(4-1)
		//f(4-1) =  acum = 3 + f(3-1)
		//f(3-1) =  acum = 2 + f(2-1)
		//f(2-1) =  acum = 1 + f(1-1)
		//f(1-1) =  acum = 0
    FinSi
	// Escribir acum
FinFuncion

Algoritmo sumaRecursiva
    Definir num Como Real
	
    Escribir "Ingrese un número:"
    Leer num
	
    //Escribir "La suma de todos los numeros hasta ", num, " es ", funcionSuma(num)
	Escribir funcionSuma(num)
FinAlgoritmo