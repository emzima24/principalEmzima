// Actividad 5
// Elabora un programa que solicite al usuario ingresar un d�a de la semana y, tras un an�lisis, 
// determine si es un d�a de entrenamiento o no (los d�as de entrenamiento son de lunes a jueves). 
// Por ahora, no es necesario considerar validaciones de entrada de datos, como may�sculas o min�sculas, 
// asumiendo que el usuario ingresar� el d�a de la semana en may�sculas(cada uno de sus caracteres). Recuerda nombrar y guardar tu algoritmo.



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
