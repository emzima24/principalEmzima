// Complementario 1 COMO PUEDE HACERSE CON ALGO QUE NO SE HA VISTO POR JODER NADA MAS
// Desarrolla un programa que permita calcular la remuneración total que recibirá un vendedor al finalizar el mes. 
// El vendedor recibe un salario base más un 10% adicional por comisión sobre sus ventas.  
// El programa debe solicitar al usuario el salario base del vendedor y luego pedir el valor de cada una de las ventas realizadas en el mes. 
// Después, calculará y mostrará el monto total que recibirá el vendedor, considerando tanto su salario base como las comisiones por las ventas realizadas en el período.


	
Algoritmo remuneracionTotal
	//lo malo en este caso es que se usa el ciclo for para la ejecucion dada la incertidumbre en el numero de ventas
	// como hay que se definen como reales y en el caso de i y cantidades de ventas solo tiene que ver con economia de codigo
	// lo demas es real y se explica por si solo
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
