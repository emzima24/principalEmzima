// Complementario 4 NO SE PUEDE HACER PORQUE NO HAY LA TABLA QUE INDICA EL ENUNCIADO
// En una verduler�a, el precio de las manzanas var�a seg�n la cantidad comprada, siguiendo una tabla de descuentos.(����????) 
// Calcula el monto total que una persona debe pagar por las manzanas que compre en esta verduler�a.

// Complementario 5 
// En un curso, el promedio de los trabajos pr�cticos se obtiene eliminando 
// la nota m�s baja de cuatro y promediando las tres m�s altas. Desarrolla 
// un programa que determine cu�l es la nota eliminada y el promedio de los trabajos pr�cticos de un estudiante.



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
	Escribir  "Se eliminar� la nota ", minimo
	Escribir  "La nota promedio de esas notas sacando el minimo es ", (notaUno+notaDos+notaTres+notaCuatro-minimo)/3
FinAlgoritmo
