// Complementario 3 
//A partir de una conocida cantidad de d�as que el usuario ingresa a trav�s del teclado, 
// escribe un programa para convertir los d�as en horas, en minutos y en segundos. 
// Por ejemplo: 1 d�a = 24 horas = 1440 minutos = 86400 segundos.



Algoritmo conversionDias
	// como hay que trabajar con enteros que si operan matematicamente entonces se
	// prefiere el valor real aunque dias no tiene connotaci�n l�gica que lo sea
	// que ciertamente si puede serlo solo que no es nuestra costumbre de uso...
	// en fin es mas generico real
	Definir cantidadDias, enHoras, enminutos, enSegundos Como Real
	Escribir "Introduce la cantidad de dias "
	Leer cantidadDias
	enHoras = cantidadDias*24
	enMinutos = cantidadDias*24*60
	enSegundos = cantidadDias*24*60*60
	Escribir cantidadDias," dias es equivalente a ",enHoras, " horas"
	Escribir cantidadDias," dias es equivalente a ",enMinutos, " minutos"
	Escribir cantidadDias," dias es equivalente a ",enSegundos, " segundos"
FinAlgoritmo
