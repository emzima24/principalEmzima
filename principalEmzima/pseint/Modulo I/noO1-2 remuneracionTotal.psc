Algoritmo remuneracionTotal
	//lo malo en este caso es que se usa el ciclo for para la ejecucion dada la incertidumbre en el numero de ventas
	Definir i, cantidadVentas, ventasParcial, salarioBase, totalVentas, salarioTotal Como Real
	totalVentas = 0
	Escribir "Cuanto es el salario base en dolares"
	Leer salarioBase
	Escribir "Cuantas ventas fueron realizadas, numero entero"
	Leer cantidadVentas
	Para i =1 Hasta cantidadVentas Hacer
		Escribir "Cuanto fue la venta numero ", i
		Leer ventasParcial
		totalVentas = totalVentas + ventasParcial*.1
	FinPara
	salarioTotal = salarioBase + totalVentas
	Escribir "La remuneración total es ", salarioTotal, " dolares"
FinAlgoritmo
