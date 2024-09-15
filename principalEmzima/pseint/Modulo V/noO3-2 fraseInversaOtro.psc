// Complementario 3 OTRO CASO SIN GUARDAR EL RESULTADO
// Crea un programa que solicite al usuario ingresar una frase y luego la muestre en pantalla  al revés. Por ejemplo, si tenemos la cadena "Hola", se mostrará como "a l o H".



Algoritmo fraseInversaOtro
	// Se define real por costumbre mas que por otra razon cuando la memoria importe lo consideraremos distinto
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


