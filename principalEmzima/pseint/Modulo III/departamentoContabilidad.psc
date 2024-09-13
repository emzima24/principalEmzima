Algoritmo departamentoContabilidad
	Definir totalVentas,valorHora,cantidadHoras,cantidadHorasAdicionales Como Real
	Definir categoria,seleccion Como Caracter
	Escribir "Escribe la opcion de modalidad de salario  A) Por comisión B) Mixto C) Fijo"
	//Leer seleccion
	//seleccion = Mayusculas(seleccion)
	seleccion = "C"
	
	Segun seleccion Hacer
		"A":
			Escribir "Escribe el total de las ventas "
			//Leer totalVentas
			totalVentas = 1000
			Escribir "El salario por esta semana segun tu opcion por comisión es de ",1000*.40 
		"B":
			Escribir "Escribe el valor de la hora "
			//Leer valorHora
			valorHora = 20
			Escribir "Escribe la cantidad de horas "
			//Leer cantidadHoras
			cantidadHoras = 40
			Si cantidadHoras >40 Entonces
				cantidadHoras = 40
			FinSi
			Escribir "Escribe el total de las ventas "
			//Leer totalVentas
			totalVentas = 1000
			Escribir "El salario por esta semana segun tu opcion mixta es de ",1000*.25+valorHora*cantidadHoras 
		"C":
			cantidadHorasAdicionales = 0
			Escribir "Escribe el valor de la hora "
			//Leer valorHora
			valorHora = 20
			Escribir "Escribe la cantidad de horas "
			//Leer cantidadHoras
			cantidadHoras = 100
			
			Si cantidadHoras > 40 Entonces
				cantidadHorasAdicionales = cantidadHoras - 40
				cantidadHoras = 40
			FinSi
			Escribir "El salario por esta semana segun tu opcion por salario fijo es de ", valorHora*cantidadHoras+valorHora*cantidadHorasAdicionales*1.50 
			//Escribir valorHora*cantidadHorasAdicionales*.50 
			
		De Otro Modo:
			Escribir  "che, escribir A, B o T, en serio..."
	Fin Segun
FinAlgoritmo
