Algoritmo eliminarNota
	Definir notaUno, notaDos, notaTres, notaCuatro, minimo Como Real
	//Escribir sin saltar "Escribe la nota uno "
	//Leer notaUno
	notaUno =70
	//Escribir sin saltar "Escribe la nota dos "
	//Leer notaDos
	notaDos = 71
	//mes = Mayusculas(mes)
	//Escribir sin saltar "Escribe la nota tres "
	//Leer notaTres
	notaTres = 100
	//Escribir sin saltar "Escribe la nota cuatro "
	//Leer notaCuatro
	notaCuatro = 99
	minimo = notaUno
	Si notaDos < minimo Entonces
		minimo = notaDos
	FinSi
	Si notaTres < minimo Entonces
		minimo = notaTres
	FinSi
	Si notaCuatro < minimo Entonces
		minimo = notaCuatro
	FinSi
	Escribir  "Se eliminará la nota ", minimo
	Escribir  "La nota promedio de esas notas sacando el minimo es ", (notaUno+notaDos+notaTres+notaCuatro-minimo)/3
FinAlgoritmo
