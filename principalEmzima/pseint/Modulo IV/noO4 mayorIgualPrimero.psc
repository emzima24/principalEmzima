// Complementario 4
// Desarrolla un programa que solicite al usuario ingresar n�meros decimales mientras que cada
// n�mero ingresado sea mayor que el primer n�mero ingresado. Por ejemplo, si el primer n�mero 
// ingresado es 3.1 y luego se ingresa un 4, el programa solicitar� un tercer n�mero. Este proceso 
// continuar� mientras los valores ingresados sean mayores que 3.1. El programa finalizar� cuando 
// se ingrese un valor menor o igual a 3.1.Utiliza la estructura repetitiva mientras para resolver esta actividad.



Algoritmo mayorIgualPrimero
	Definir minimo,numeroEntry Como Real
	Escribir sin saltar "Escribe un numero decimal"
	Leer minimo
	//minimo = 0
	Repetir
		Escribir sin saltar "Escribe un numero  decimal"
		Leer numeroEntry
	Mientras Que (minimo < numeroEntry)
	Escribir "Terminamos"
FinAlgoritmo
