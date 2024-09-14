// Complementario 4 NO SE PUEDE HACER PORQUE NO HAY LA TABLA QUE INDICA EL ENUNCIADO
// En una verdulería, el precio de las manzanas varía según la cantidad comprada, siguiendo una tabla de descuentos.(¿¿¿¿????) 
// Calcula el monto total que una persona debe pagar por las manzanas que compre en esta verdulería.

// Complementario 5 
// En un curso, el promedio de los trabajos prácticos se obtiene eliminando 
// la nota más baja de cuatro y promediando las tres más altas. Desarrolla 
// un programa que determine cuál es la nota eliminada y el promedio de los trabajos prácticos de un estudiante.



Algoritmo eliminarNota
	// Se define real porque es menos probable que se rompa en ejecucion en el ingreso de las notas
	Definir notaUno, notaDos, notaTres, notaCuatro, minimo Como Real
	Escribir sin saltar "Escribe la nota uno "
	Leer notaUno
//	notaUno =70
	Escribir sin saltar "Escribe la nota dos "
	Leer notaDos
//	notaDos = 71
	Escribir sin saltar "Escribe la nota tres "
	Leer notaTres
//	notaTres = 100
	Escribir sin saltar "Escribe la nota cuatro "
	Leer notaCuatro
//	notaCuatro = 99
	// como no hay un bucle debo probarlas todas
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
