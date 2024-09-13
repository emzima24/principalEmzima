Algoritmo remuneracionTotalSinCiclo
	//lo malo en este caso es que no se piden cada una de las ventas
	Definir salarioBase, totalVentas, salarioTotal Como Real
	Escribir "Cuanto es el salario base en dolares"
	Leer salarioBase
	Escribir "Cuanto fue el total de las ventas"
	Leer totalVentas
	salarioTotal = salarioBase + totalVentas*.1
	Escribir "La remuneración total es ", salarioTotal, " dolares"
FinAlgoritmo
