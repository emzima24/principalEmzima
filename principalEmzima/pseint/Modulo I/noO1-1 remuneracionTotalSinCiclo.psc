// Complementario 1 COMO PUEDE HACERSE SIN ALGO QUE NO SE HA VISTO
// Desarrolla un programa que permita calcular la remuneraci�n total que recibir� un vendedor al finalizar el mes. 
// El vendedor recibe un salario base m�s un 10% adicional por comisi�n sobre sus ventas.  
// El programa debe solicitar al usuario el salario base del vendedor y luego pedir el valor de cada una de las ventas realizadas en el mes. 
// Despu�s, calcular� y mostrar� el monto total que recibir� el vendedor, considerando tanto su salario base como las comisiones por las ventas realizadas en el per�odo.


	
Algoritmo remuneracionTotalSinCiclo
	//lo malo en este caso es que no se piden cada una de las ventas
	// como hay qu trabajar con variables que son decimales y operan matematicamente
	// es obligatorio Real
	Definir salarioBase, totalVentas, salarioTotal Como Real
	Escribir "Cuanto es el salario base en dolares"
	Leer salarioBase
	Escribir "Cuanto fue el total de las ventas"
	Leer totalVentas
	salarioTotal = salarioBase + totalVentas*.1
	Escribir "La remuneraci�n total es ", salarioTotal, " dolares"
FinAlgoritmo
