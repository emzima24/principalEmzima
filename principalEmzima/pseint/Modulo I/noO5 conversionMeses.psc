// Complementario 5 
// Escribe un programa que permita calcular la edad de una persona en meses. 
// Para ello, deber�s solicitar la edad actual al usuario y realizar el c�lculo correspondiente. 
// Muestra en pantalla un mensaje con la equivalencia. 



Algoritmo conversionMeses
	// como hay que trabajar con enteros que si operan matematicamente entonces se
	// prefiere el valor real aunque a�os no tiene connotaci�n l�gica que lo sea
	// que ciertamente si puede serlo solo que no es nuestra costumbre de uso...
	// en fin es mas generico real
	Definir cantidadAnhos, enMeses  Como Real
	Escribir "Introduce la cantidad de a�os "
	Leer cantidadAnhos
	enMeses = cantidadAnhos*12
	Escribir cantidadAnhos," a�os es equivalente a ",enMeses, " meses"
FinAlgoritmo
