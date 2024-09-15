// Actividad 5
// En esta actividad, el objetivo es escribir una función recursiva que calcule la suma de los primeros N enteros. 
// El programa principal solicitará al usuario un número, y la función recursiva se encargará de calcular 
// la suma hasta ese número de manera recursiva. Por ejemplo, si el usuario ingresa 5, 
// el programa calculará la suma de 1 + 2 + 3 + 4 + 5 utilizando recursividad.
// Se define real porque es menos probable que se rompa en ejecucion en el ingreso de la variable
// Se define real porque es menos probable que se rompa en ejecucion en el ingreso de la variable y se mantiene para todos los casos por economia de codigo




Funcion acum <-funcionSuma(num)
	Definir acum Como Entero
    Si num = 0 Entonces
        acum=0	// funcion base que detiene la recursion
    Sino
		acum= num + funcionSuma(num - 1) // invocacion recursiva 
		// En esta tabla se ve la recursion como la funcion(5-1) es exactamente la expresion de la 
		// linea 21 y asi sucesivamente cuando acum se hace 0 se devuelven todos los resultados de la recursion
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
	// Se define real por costumbre mas que por otra razon cuando la memoria importe lo consideraremos distinto
    Definir num Como Real
	
    Escribir "Ingrese un número:"
    Leer num
	
    Escribir "La suma de todos los numeros hasta ", num, " es ", funcionSuma(num)
FinAlgoritmo