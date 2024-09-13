Algoritmo alumnosNotas
	Definir alumno Como Caracter
	Definir notaPractica,notaProblemas,notaTeoria Como Real
	alumno = "a"
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
