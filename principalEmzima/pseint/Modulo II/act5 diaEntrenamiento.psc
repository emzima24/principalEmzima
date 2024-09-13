Algoritmo diaEntrenamiento
	Definir diaIngresado Como Caracter
	Escribir "Escribe, día para saber si entrenas "
	Leer diaIngresado
	diaIngresado = Mayusculas(diaIngresado)
	Si diaIngresado ="LUNES" O diaIngresado ="MARTES" O diaIngresado ="MIÉRCOLES" O diaIngresado ="JUEVES" Entonces
		Escribir "Si el ",diaIngresado," es un día de entrenamiento"
	SiNo
		Escribir "No el ",diaIngresado," no es de entrenamienyo, es un día de reposición"
	Fin Si
FinAlgoritmo
