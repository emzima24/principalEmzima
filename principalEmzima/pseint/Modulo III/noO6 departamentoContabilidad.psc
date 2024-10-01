// Complementario 6 
// En una empresa, el departamento de contabilidad necesita calcular los sueldos semanales del personal, que varían según tres modalidades de sueldo: 
//
// Salario por Comisión
//
// Salario Fijo + Comisión
//
// Salario Fijo . 
//
// Desarrolla un menú de opciones que permita calcular el sueldo semanal de un empleado según el tipo de contrato que tenga considerando:
//	
// Para la modalidad de salario por comisión, se requiere ingresar el monto total de las ventas realizadas 
// en la semana. El 40% de ese monto total corresponde al salario del empleado.
//		
// En cuanto a la modalidad de salario fijo + comisión, se debe proporcionar el valor que se paga por hora, 
// la cantidad de horas trabajadas semanalmente y el monto total de las ventas en esa semana. 
// En este tipo de contrato, no se consideran las horas extras y el máximo de horas laborales permitidas 
// es de 40 horas por semana. La comisión por las ventas se calcula como el 25% del valor total de las ventas.
//		
// Finalmente, para la modalidad de salario fijo, se debe ingresar el valor que se paga por hora y la cantidad 
// de horas trabajadas en la semana. Si se excede las 40 horas semanales, las horas extras se deben pagar con un adicional del 50% sobre el valor de la hora.



Algoritmo departamentoContabilidad
	// Se define real porque es menos probable que se rompa en ejecucion en el ingreso de las horas
	Definir totalVentas,valorHora,cantidadHoras,cantidadHorasAdicionales Como Real
	Definir categoria,seleccion Como Caracter
	Escribir "Escribe la opcion de modalidad de salario  A) Por comisión B) Mixto C) Fijo"
	Leer seleccion
	seleccion = Mayusculas(seleccion)
//	seleccion = "C"
	
	Segun seleccion Hacer
		"A":
			Escribir "Escribe el total de las ventas "
			Leer totalVentas
//			totalVentas = 1000
			Escribir "El salario por esta semana segun tu opcion por comisión es de ",totalVentas*.40 
		"B":
			Escribir "Escribe el valor de la hora "
			Leer valorHora
//			valorHora = 20
			Escribir "Escribe la cantidad de horas "
			Leer cantidadHoras
//			cantidadHoras = 40
			Si cantidadHoras >40 Entonces
				cantidadHoras = 40
			FinSi
			Escribir "Escribe el total de las ventas "
			Leer totalVentas
//			totalVentas = 1000
			Escribir "El salario por esta semana segun tu opcion mixta es de ",totalVentas*.25+valorHora*cantidadHoras 
		"C":
			cantidadHorasAdicionales = 0
			Escribir "Escribe el valor de la hora "
			Leer valorHora
//			valorHora = 20
			Escribir "Escribe la cantidad de horas "
			Leer cantidadHoras
//			cantidadHoras = 100
			
			Si cantidadHoras > 40 Entonces
				cantidadHorasAdicionales = cantidadHoras - 40
				cantidadHoras = 40
			FinSi
			Escribir "El salario por esta semana segun tu opcion por salario fijo es de ", valorHora*cantidadHoras+valorHora*cantidadHorasAdicionales*1.50 
			//Escribir valorHora*cantidadHorasAdicionales*.50 
			
		De Otro Modo:
			Escribir  "che, escribir A, B o C en serio..."
	Fin Segun
FinAlgoritmo
