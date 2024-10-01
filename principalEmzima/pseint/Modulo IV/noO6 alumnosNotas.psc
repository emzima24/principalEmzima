// Complementario 6
// Calcula las calificaciones de un grupo de alumnos. La nota final de cada alumno se calcula
// según el siguiente criterio: la parte práctica vale el 10%, la parte de problemas el 50%, 
// y la parte teórica el 40%. El programa solicitará el nombre del alumno y las tres notas obtenidas.
// Mostrará el resultado por pantalla y volverá a solicitar los datos del siguiente alumno hasta 
// que se ingrese un nombre de alumno vacío. Las notas deben estar comprendidas entre 0 y 10; 
// si no cumplen con este rango, no se calculará el promedio y se mostrará un mensaje de error.
// Utiliza la estructura repetitiva mientras para resolver esta actividad.



Algoritmo alumnosNotas
	Definir alumno Como Caracter
	// Se define real porque es menos probable que se rompa en ejecucion en el ingreso de la variable
	Definir notaPractica,notaProblemas,notaTeoria Como Real
	// alumno = "a"
	Escribir sin saltar "Escribe el nombre del alumno "
	Leer alumno
	Mientras alumno <> "" Hacer
		Escribir sin saltar "Escribe la nota en la practica "
		Leer notaPractica
		Escribir sin saltar "Escribe la nota en los problemas "
		Leer notaProblemas
		Escribir sin saltar "Escribe la nota en la teoria "
		Leer notaTeoria
		Si (notaPractica > 10) O (notaProblemas > 10) O (notaTeoria > 10) O (notaPractica < 0) O (notaProblemas < 0) O (notaTeoria < 0) Entonces
			Escribir "Che que boludo con una nota por debajo de 0 o por encima de 10 no se puede calcular el promedio"
		SiNo
			Escribir "El promedio para el alumno ", alumno," es ",notaPractica*.1+notaProblemas*.50+notaTeoria*.40
		FinSi
		Escribir ""
		Escribir sin saltar "Escribe el nombre del alumno "
		Leer alumno
	FinMientras
	Escribir "Terminamos "
FinAlgoritmo
