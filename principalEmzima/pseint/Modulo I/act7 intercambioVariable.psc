// Actividad 5
// Escribe un programa que permita al usuario ingresar el valor de dos variables numéricas de tipo entero. 
// Posteriormente, el programa debe intercambiar los valores de ambas variables y mostrar el resultado final por pantalla.
//
// Por ejemplo, si el usuario ingresa los valores num1 = 9 y num2 = 3, la salida a del programa deberá mostrar: num1 = 3 y num2 = 9.
//		
// Ayuda: Para intercambiar los valores de dos variables se debe utilizar una variable auxiliar.


	
Algoritmo intercambioVariable
	// como hay que trabajar con enteros que no operan entre ellos entonces se toma caracter
	// Si el codigo es mas largo y luego si operan matematicamente entonces se
	// toma decimal por ser mas amplio para no romper el codigo
	Definir VariableUno, VariableDos,intercambio Como Caracter
	Escribir "Indica la primera variable, recuerda que solo puede ser un numero entero"
	Leer VariableUno
	Escribir "Indica la segunda variable, recuerda que solo puede ser un numero entero"
	Leer VariableDos
	intercambio = VariableUno
	VariableUno = VariableDos
	VariableDos = intercambio
	Escribir "Originalmente la primera variable es ", VariableDos," y la segunda variable es ", VariableUno
	Escribir "Si se intercambian la primera variable es ahora ", VariableUno," y la segunda variable es ", VariableDos
FinAlgoritmo
