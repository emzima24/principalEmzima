Algoritmo fraseInversaOtro
	Definir element Como Real
	Definir textEntry,textEntrySave Como Caracter
	Escribir Sin Saltar"Introduce un texto "
	Leer textEntry
	//textEntry = "Hola world prueba"
	Escribir sin saltar "El texto (", textEntry,") invertido es : ("
	Para element<-(Longitud(textEntry)-1) Hasta 0 Con Paso -1 Hacer
		Escribir sin saltar SubCadena(textEntry,element,element) 
	Fin Para
	Escribir ")"
FinAlgoritmo


