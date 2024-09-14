// Complementario 7
// Escribe un programa que solicite al usuario ingresar tres notas y determine si un alumno 
//aprueba o reprueba un curso. El criterio para aprobar es que el promedio de las tres notas 
// sea igual o mayor a 70. Si el promedio cumple con este criterio, el programa imprimirá "
// El alumno aprueba el curso"; de lo contrario, imprimirá "El alumno reprueba el curso".



Algoritmo producPromedioArcaico
	// Se define real porque es menos probable que se rompa en ejecucion
	Definir priNota, segNota, terNota, promedio Como Real
	Escribir "Escribe, Cuanto la primera nota"
	Leer priNota
	Escribir "Escribe, Cuanto vale la segunda nota"
	Leer segNota
	Escribir "Escribe, Cuanto vale la tercera nota"
	Leer terNota
	promedio = (priNota+segNota+terNota)/3
	Si promedio >= 70 Entonces
		Escribir "El alumno aprueba el curso, felicitaciones"
	SiNo
	    Escribir "El alumno reprueba el curso, lo sentimos"
	Fin Si
FinAlgoritmo
