Algoritmo recorrerTextoComoDice
	Definir element Como Real
	Definir textEntry,textEntrySave Como Caracter
	Escribir Sin Saltar"Introduce un texto "
	Leer textEntry
	//textEntry = "Hola world prueba"
	textEntrySave = ""
	Para element<-0 Hasta Longitud(textEntry)-1 Con Paso 1 Hacer
		Si element <> Longitud(textEntry)-1 Entonces
			Si SubCadena(textEntry,element,element) = " " Entonces
				textEntrySave = textEntrySave + SubCadena(textEntry,element,element)
			SiNo
				textEntrySave = textEntrySave + SubCadena(textEntry,element,element)+"_"
			FinSi
		SiNo
			textEntrySave = textEntrySave + SubCadena(textEntry,element,element) 
		FinSi
	Fin Para
	Escribir "El texto como se solicito es : ",textEntrySave
FinAlgoritmo
