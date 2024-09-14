// Actividad 5 OTRA VERSION POR JODER
// Escribe un programa que permita al usuario ingresar el valor de dos variables numéricas de tipo entero. 
// Posteriormente, el programa debe intercambiar los valores de ambas variables y mostrar el resultado final por pantalla.
//
// Por ejemplo, si el usuario ingresa los valores num1 = 9 y num2 = 3, la salida a del programa deberá mostrar: num1 = 3 y num2 = 9.
//		
// Ayuda: Para intercambiar los valores de dos variables se debe utilizar una variable auxiliar.


	
Algoritmo intercambioConDosAuxiliar
	// como hay que trabajar con enteros que no operan entre ellos entonces se toma caracter
	// Si el codigo es mas largo y luego si operan matematicamente entonces se
	// toma decimal por ser mas amplio para no romper el codigo
	Definir variableUno, variableDos,nuevaVariableUno, nuevaVariableDos Como Caracter
	Escribir "Indica la primera variable, recuerda que solo puede ser un numero entero"
	Leer variableUno
	Escribir "Indica la segunda variable, recuerda que solo puede ser un numero entero"
	Leer variableDos
	nuevaVariableDos = variableUno
	nuevaVariableUno = variableDos
	Escribir "Originalmente la primera variable es ", variableUno," y la segunda variable es ", variableDos
	Escribir "Si se intercambian la primera variable es ahora ", nuevaVariableUno," y la segunda variable es ", nuevaVariableDos
FinAlgoritmo
