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

