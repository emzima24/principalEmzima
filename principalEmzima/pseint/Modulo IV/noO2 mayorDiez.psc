// Complementario 2
// Escribe un programa que solicite al usuario ingresar un n�mero. Mientras ese n�mero 
// sea mayor que 10, se le pedir� al usuario que ingrese el n�mero nuevamente. 
// Utiliza la estructura repetitiva mientras para resolver esta actividad.



Algoritmo mayorDiez
	Definir numeroEntry Como Real
	Escribir sin saltar "Escribe un numero "
	Leer numeroEntry
//	numeroEntry = 11
	Mientras (numeroEntry > 10) Hacer
		Escribir sin saltar "Escribe un numero (cuando sea menor que 10 se detiene) "
		Leer numeroEntry
		//numeroEntry = 10
	Fin Mientras
	Escribir "Terminamos "
FinAlgoritmo
