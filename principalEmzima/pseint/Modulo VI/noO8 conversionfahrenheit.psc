// Complementario 8
// Crea una función que convierta una temperatura de grados Celsius a grados Fahrenheit. Luego, 
// en el programa principal, solicita al usuario una temperatura en Celsius y utiliza la función 
// para convertirla y mostrar el resultado. Fórmula de conversión: F = C * 9/5 + 32



Funcion fahrenheit <- conversionAfahrenheit ( centigrado )
	Definir fahrenheit Como Real
	fahrenheit = 9*centigrado/5 + 32
Fin Funcion

Algoritmo conversionfahrenheit
	Definir  centigrado Como Real
	Escribir 'Escribe, temperatura en centigrados '
	Leer centigrado
	
	Escribir 'Con temperatura ' centigrado '°C es equivalente a ' conversionAfahrenheit(centigrado) '°F'
FinAlgoritmo

