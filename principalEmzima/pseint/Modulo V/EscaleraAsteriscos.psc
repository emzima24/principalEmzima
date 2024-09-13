Algoritmo EscaleraAsteriscos
	Definir textEntrySave Como Caracter
	Definir numberEntryOne,numberEntryTwo,numberEntryThree  Como Real
	Escribir Sin Saltar"Introduce un número "
	Leer numberEntryTwo 
	Para numberEntryOne<- 1 Hasta numberEntryTwo Con Paso 1 Hacer
		textEntrySave = ""
		Para numberEntryThree<- 1 Hasta  (numberEntryTwo- numberEntryOne+1) Con Paso 1 Hacer
			textEntrySave = textEntrySave+"*"
		Fin Para
		Escribir textEntrySave
	Fin Para
FinAlgoritmo
