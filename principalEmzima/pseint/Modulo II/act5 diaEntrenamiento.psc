Algoritmo diaEntrenamiento
	Definir diaIngresado Como Caracter
	Escribir "Escribe, d�a para saber si entrenas "
	Leer diaIngresado
	diaIngresado = Mayusculas(diaIngresado)
	Si diaIngresado ="LUNES" O diaIngresado ="MARTES" O diaIngresado ="MI�RCOLES" O diaIngresado ="JUEVES" Entonces
		Escribir "Si el ",diaIngresado," es un d�a de entrenamiento"
	SiNo
		Escribir "No el ",diaIngresado," no es de entrenamienyo, es un d�a de reposici�n"
	Fin Si
FinAlgoritmo
