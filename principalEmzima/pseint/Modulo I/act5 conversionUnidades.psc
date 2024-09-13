Algoritmo conversionUnidades
	Definir medida, enCentimetros, enMilimetros, enPulgadas Como Real
	Escribir "Cuanto vale la medida en metros"
	Leer medida
	enCentimetros = medida *100
	enMilimetros = medida *1000
	enPulgadas = medida *100/2.54
	Escribir "La medida ",medida," en metros es equivalente a ",enCentimetros, " cm"
	Escribir "La medida ",medida," en metros es equivalente a ",enMilimetros, " mm"
	Escribir "La medida ",medida," en metros es equivalente a ",enPulgadas, " in"
FinAlgoritmo
