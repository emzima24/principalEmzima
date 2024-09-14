// Actividad 5
// Elabora un programa que solicite al usuario ingresar un día de la semana y, tras un análisis, 
// determine si es un día de entrenamiento o no (los días de entrenamiento son de lunes a jueves). 
// Por ahora, no es necesario considerar validaciones de entrada de datos, como mayúsculas o minúsculas, 
// asumiendo que el usuario ingresará el día de la semana en mayúsculas(cada uno de sus caracteres). Recuerda nombrar y guardar tu algoritmo.



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
