// Complementario 8
// Crea una funci�n que convierta una temperatura de grados Celsius a grados Fahrenheit. Luego, 
// en el programa principal, solicita al usuario una temperatura en Celsius y utiliza la funci�n 
// para convertirla y mostrar el resultado. F�rmula de conversi�n: F = C * 9/5 + 32



Funcion fahrenheit <- conversionAfahrenheit ( centigrado )
	Definir fahrenheit Como Real
	fahrenheit = 9*centigrado/5 + 32
Fin Funcion

Algoritmo conversionfahrenheit
	Definir  centigrado Como Real
	Escribir 'Escribe, temperatura en centigrados '
	Leer centigrado
	
	Escribir 'Con temperatura ' centigrado '�C es equivalente a ' conversionAfahrenheit(centigrado) '�F'
FinAlgoritmo

