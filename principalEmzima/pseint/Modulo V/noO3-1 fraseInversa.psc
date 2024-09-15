// Complementario 3
// Crea un programa que solicite al usuario ingresar una frase y luego la muestre en pantalla  al revés. Por ejemplo, si tenemos la cadena "Hola", se mostrará como "a l o H".



Algoritmo fraseInversa
	// Se define real por costumbre mas que por otra razon cuando la memoria importe lo consideraremos distinto
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
