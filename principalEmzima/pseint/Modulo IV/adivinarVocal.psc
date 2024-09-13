Algoritmo adivinarVocal
	Definir vocal,vocalSecreta Como Caracter
	//Escribir sin saltar "Escribe una vocal "
	//Leer vocal
	vocal = "e"
	vocalSecreta = "a"
	vocal = Minusculas(vocal)
	Mientras vocal <> vocalSecreta Hacer
		Escribir sin saltar "Escribe una vocal "
		Leer vocal
		//vocal = "a"
		vocal = Minusculas(vocal)
	Fin Mientras
	Escribir "Ya encontraste la vocal, era la letra ", vocalSecreta
FinAlgoritmo
