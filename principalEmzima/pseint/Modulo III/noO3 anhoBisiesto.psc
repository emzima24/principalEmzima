// Complementario 1 
// Desarrolla un programa que, dado un a�o, determine si es bisiesto o no. Un a�o es bisiesto si 
// cumple las siguientes condiciones: debe ser divisible por 4 pero no por 100, a menos que 
// tambi�n sea divisible por 400. Utiliza la funci�n mod de PseInt para esta tarea.

// La acitividad complementaria 7 es igual


Algoritmo anhoBisiesto
	// programa valido desde el a�o 1952
	// Se define real porque es menos probable que se rompa en ejecucion con el ingreso de los a�os
	Definir anho Como Real
	Escribir sin saltar "Escribe el numero a�o "
	Leer anho
	//anho = 1900
	Si anho >= 1952 Entonces
		Si (anho mod 4 = 0) Y ((anho mod 100 <> 0) O (anho mod 400 = 0)) Entonces
			Escribir "El a�o ",anho," es Bisiesto"
		SiNo
			Escribir "El a�o ",anho," no es Bisiesto"
		FinSi
	SiNo
		Escribir "El a�o ",anho," corresponde al calendario Juliano no aplica"
	FinSi
FinAlgoritmo
