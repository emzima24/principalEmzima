// Complementario 5 
// Escribe un programa que permita calcular la edad de una persona en meses. 
// Para ello, deberás solicitar la edad actual al usuario y realizar el cálculo correspondiente. 
// Muestra en pantalla un mensaje con la equivalencia. 



Algoritmo conversionMeses
	// como hay que trabajar con enteros que si operan matematicamente entonces se
	// prefiere el valor real aunque años no tiene connotación lógica que lo sea
	// que ciertamente si puede serlo solo que no es nuestra costumbre de uso...
	// en fin es mas generico real
	Definir cantidadAnhos, enMeses  Como Real
	Escribir "Introduce la cantidad de años "
	Leer cantidadAnhos
	enMeses = cantidadAnhos*12
	Escribir cantidadAnhos," años es equivalente a ",enMeses, " meses"
FinAlgoritmo
