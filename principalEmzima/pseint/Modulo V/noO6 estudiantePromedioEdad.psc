// Complementario 6
// Desarrolla un programa que solicite al usuario el número de estudiantes en un curso y para cada 
// estudiante, pida su nombre, edad y tres calificaciones. Luego, calcula el promedio de calificaciones 
// de cada estudiante y muestra un mensaje indicando si aprobaron o reprobaron el curso. Emplea 
// estructuras anidadas para manejar los datos de múltiples estudiantes.



Algoritmo estudiantePromedioEdad
	// Se define real porque es menos probable que se rompa en ejecucion en el ingreso de la variable y se mantiene para todos los casos por economia de codigo
	Definir studentQty,element,numberEntryTwo,numberEntryThree,sum,mark Como Real
	Definir studentName, studentAge,quality Como Caracter
	Escribir Sin Saltar"Introduce un número "
	Leer studentQty
	//studentQty = 0
	
	Para element<- 1 Hasta studentQty Con Paso 1 Hacer
		sum = 0
		Escribir Sin Saltar "Introduce el Nombre del estudiante (",element,")"
		Leer studentName
		Escribir Sin Saltar"Introduce la edad del estudiante "
		Leer studentAge 
		Para numberEntryTwo<- 1 Hasta 3 Con Paso 1 Hacer
			Escribir Sin Saltar "Introduce la nota (",numberEntryTwo,") del estudiante"
			Leer mark
			Si (mark > 10) O  (mark < 0) Entonces
				Escribir "Che sos boludo te puse o en la nota que metiste avispate "
				mark = 0
				sum = mark +sum
			SiNo
				sum = mark +sum
			FinSi
		Fin Para
		Si sum/3 > 6 Entonces
			quality = "Aprobado"
		SiNo
			quality = "Reprobado"
		FinSi
		Escribir "El estudiante",studentName," cuya edad es ",studentAge," tiene una nota promedio ",sum/3," y está ",quality
	Fin Para
FinAlgoritmo
