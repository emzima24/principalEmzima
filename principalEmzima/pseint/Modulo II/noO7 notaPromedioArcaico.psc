Algoritmo producPromedioArcaico
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
