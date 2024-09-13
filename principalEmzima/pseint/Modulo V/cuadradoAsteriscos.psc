Algoritmo cuadradoAsteriscos
	Definir numberEntryOne,numberEntryTwo,numberEntryThree  Como Real
	Escribir Sin Saltar"Introduce un número de lado "
	Leer numberEntryTwo 
	Para numberEntryOne<- 1 Hasta numberEntryTwo Con Paso 1 Hacer
		Para numberEntryThree<- 1 Hasta  (numberEntryTwo) Con Paso 1 Hacer
			Si (numberEntryOne = 1) O (numberEntryOne = numberEntryTwo) Entonces
				Escribir sin saltar "*"
			SiNo
				Si (numberEntryThree = 1) O (numberEntryThree = numberEntryTwo) Entonces
					Escribir sin saltar "*"
				SiNo
					Escribir sin saltar " "
				FinSi
			FinSi
		Fin Para
		Escribir ""
	Fin Para
FinAlgoritmo
