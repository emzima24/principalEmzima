Algoritmo anhoBisiesto
	// programa valido desde el año 1952
	Definir anho Como Real
	Escribir sin saltar "Escribe el numero año "
	//Leer anho
	anho = 1900
	Si anho >= 1952 Entonces
		Si (anho mod 4 = 0) Y ((anho mod 100 <> 0) O (anho mod 400 = 0)) Entonces
			Escribir "El año ",anho," es Bisiesto"
		SiNo
			Escribir "El año ",anho," no es Bisiesto"
		FinSi
	SiNo
		Escribir "El año ",anho," corresponde al calendario Juliano no aplica"
	FinSi
FinAlgoritmo
