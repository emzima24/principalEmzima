// Complementario 1 COMO PUEDE HACERSE SIN ALGO QUE NO SE HA VISTO
// Desarrolla un programa que permita calcular la remuneración total que recibirá un vendedor al finalizar el mes. 
// El vendedor recibe un salario base más un 10% adicional por comisión sobre sus ventas.  
// El programa debe solicitar al usuario el salario base del vendedor y luego pedir el valor de cada una de las ventas realizadas en el mes. 
// Después, calculará y mostrará el monto total que recibirá el vendedor, considerando tanto su salario base como las comisiones por las ventas realizadas en el período.


	
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
	Escribir "La remuneración total es ", salarioTotal, " dolares"
FinAlgoritmo
