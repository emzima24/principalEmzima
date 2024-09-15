// Complementario 3 OTRA VERSIO
// Crea un programa que dibuje una escalera de números, donde cada línea comience en uno y termine 
// en el número de la línea. Solicita al usuario la altura de la escalera al comenzar. Ejemplo: si se ingresa el número 3:
// 1
// 12
// 123

// Se define real porque es menos probable que se rompa en ejecucion en el ingreso de la variable
// Se define real porque es menos probable que se rompa en ejecucion en el ingreso de la variable y se mantiene para todos los casos por economia de codigo
// Se define real por costumbre mas que por otra razon cuando la memoria importe lo consideraremos distinto



Funcion acum <-funcionSuma(num)
	Definir acum Como Caracter
	acum = ""
    Si num = 0 Entonces
        acum= "Terminamos" 	// funcion base que detiene la recursion
    Sino
		acum= ConvertirATexto(num) + funcionSuma(num - 1) // invocacion recursiva 
		//          acum = 5 + f(5-1)
		//f(5-1) =  acum = 4 + f(4-1)
		//f(4-1) =  acum = 3 + f(3-1)
		//f(3-1) =  acum = 2 + f(2-1)
		//f(2-1) =  acum = 1 + f(1-1)
		//f(1-1) =  acum = 0
		Escribir ""
    FinSi
	
FinFuncion
//SubProceso escalera( num Por Valor)
//	Definir i Como Real
//	Definir figura Como Caracter
//	figura = ""
//	Si num = 0 Entonces
//		Escribir "Con 0 no hay escaleras"
//	SiNo
//		Para i <- 1 Hasta num Hacer
//			figura = figura + ConvertirATexto(i)
//			Escribir figura
//		FinPara
//	FinSi
//FinSubProceso

Algoritmo escaleraSubproceso
	Definir num Como Real
	Escribir "Escribe el numero "
	//Leer num
	num = 5
	Escribir funcionSuma(num)
FinAlgoritmo
