Algoritmo fraseInversa
	Definir element Como Real
	Definir textEntry,textEntrySave Como Caracter
	Escribir Sin Saltar"Introduce un texto "
	Leer textEntry
	//textEntry = "Hola world prueba"
	textEntrySave = ""
	Para element<-(Longitud(textEntry)-1) Hasta 0 Con Paso -1 Hacer
		textEntrySave = textEntrySave + SubCadena(textEntry,element,element) 
	Fin Para
	Escribir "El texto (", textEntry,") invertido es : (",textEntrySave,")" 
FinAlgoritmo
