Algoritmo anhoBisiesto
	// programa valido desde el a�o 1952
	Definir anho Como Real
	Escribir sin saltar "Escribe el numero a�o "
	//Leer anho
	anho = 1900
	Si anho >= 1952 Entonces
		Si (anho mod 4 = 0) Y ((anho mod 100 <> 0) O (anho mod 400 = 0)) Entonces
			Escribir "El a�o ",anho," es Bisiesto"
		SiNo
			Escribir "El a�o ",anho," no es Bisiesto"
		FinSi
	SiNo
		Escribir "El a�o ",anho," corresponde al calendario Juliano no aplica"
	FinSi
FinAlgoritmo
