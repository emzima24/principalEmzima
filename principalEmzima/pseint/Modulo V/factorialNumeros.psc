Algoritmo factorialNumeros
	Definir numberEntry,numberEntryOne,numberEntryTwo,numberEntryThree,factorial Como Real
	Definir seriesText Como Caracter
	Escribir Sin Saltar"Introduce un número "
	Leer numberEntryTwo 
	//numberEntryTwo = 5
	Para numberEntry<- 1 Hasta numberEntryTwo Con Paso 1 Hacer
		factorial = 1
		seriesText = ""
		Para numberEntryThree<- 1 Hasta numberEntry Con Paso 1 Hacer
			factorial = factorial*1* numberEntryThree
			Si numberEntryThree= 1  Entonces
				seriesText = seriesText + ConvertirATexto(numberEntryThree)
			SiNo
				seriesText = seriesText + ","+ConvertirATexto(numberEntryThree)
			FinSi
		Fin Para
		Escribir "!",numberEntry," = ",seriesText," = ",factorial
	Fin Para
FinAlgoritmo
