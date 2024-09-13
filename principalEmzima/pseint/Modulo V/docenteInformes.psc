Algoritmo docenteInformes
	Definir studentQty,element,numberEntryTwo,numberEntryThree,sum,mark,sumRepro,qtyRepro,qtyInte75,max,qtyParcial Como Real
	Definir studentName, studentAge,quality,markText Como Caracter
	Escribir Sin Saltar"Introduce el número de estudiantes "
	Leer studentQty
	//studentQty = 0
	qtyRepro = 0
	sumRepro = 0
	qtyInte75 = 0
	max = 0
	qtyParcial = 0
	Para element<- 1 Hasta studentQty Con Paso 1 Hacer
		sum = 0
		Escribir Sin Saltar "Introduce el Nombre del estudiante (",element,")"
		Leer studentName
		//studentName = "a"
		Para numberEntryTwo<- 1 Hasta 3 Con Paso 1 Hacer
			Segun numberEntryTwo Hacer
				1:
					markText = "Integrador"
				2:
					markText = "Exposicion"
				De Otro Modo:
					markText = "Parcial"
			Fin Segun
			Escribir Sin Saltar "Introduce la nota (",markText,") del estudiante"
			Leer mark
			Si (mark > 10) O  (mark < 0) Entonces
				Escribir "Che sos boludo te puse o en la nota que metiste avispate "
				mark = 0
				sum = mark +sum
			SiNo
				sum = mark +sum
			FinSi
			Segun numberEntryTwo Hacer
				1:
					Si mark > 7.5
						qtyInte75 = qtyInte75 +1 
					FinSi
				2:
					Si mark > max Entonces
						max = mark
					FinSi
				De Otro Modo:
					Si (mark >= 4.0) Y (mark <= 7.5)
						qtyParcial = qtyParcial +1 
					FinSi
			Fin Segun
		Fin Para
		Si sum/3 > 6 Entonces
			quality = "Aprobado"
		SiNo
			quality = "Reprobado"
			sumRepro = sumRepro + sum/3
			qtyRepro = qtyRepro + 1 
		FinSi
	Fin Para
	Si qtyRepro = 0 Entonces
		Escribir "No hay estudiantes reprobados"
	SiNo
		Escribir "El promedio de los estudiantes reprobados es ",sumRepro/qtyRepro
	FinSi
	Escribir "El porcentaje de los estudiantes con integradores mayores a 7.5 es ",qtyInte75*100/studentQty
	Escribir "La nota maxima de las exposiciones es ",max
	Escribir "La cantidad de los estudiantes con notas parciales entre 4.0 y 7.5 es ",qtyParcial
FinAlgoritmo
