// Complementario 7
// Los empleados de una fábrica trabajan en dos turnos: diurno y nocturno. 
// Diseña una función para calcular el jornal diario según las siguientes reglas:
//
// La tarifa de horas diurnas es de $90.
//
// La tarifa de horas nocturnas es de $125.
//
// En días festivos, la tarifa se incrementa en un 10% 
// para el turno diurno y en un 15% para el turno nocturno.
//		
// El programa debe solicitar al usuario: el nombre del trabajador, el día de la semana,
// el turno (diurno o nocturno), y la cantidad de horas trabajadas. 
// Además, debe preguntar si el día era festivo para calcular el jornal diario.
// Carlos
// Lunes
// d
// s
// 15


Funcion jornal <- calculoLaboral ( turno, festivo, cantidad )
	Definir jornal Como Real
	Si festivo = "S" Entonces
		Si turno = "D" Entonces
			jornal = 90 * 1.1*cantidad
		SiNo
			jornal = 125 * 1.15*cantidad
		FinSi
	SiNo
		Si turno = "D" Entonces
			jornal = 90*cantidad
		SiNo
			jornal = 125*cantidad
		FinSi
	FinSi
Fin Funcion

Algoritmo jornalCalculo
	// Se define real porque es menos probable que se rompa en ejecucion en el ingreso de la variable
	Definir  nombre, diaSemana, turno, festivo Como Caracter
	Definir  cantidad Como Real
	Escribir 'Escribe, el nombre '
	Leer nombre
	Escribir 'Escribe, el dia de la semana '
	Leer diaSemana
	Escribir 'Escribe, turno (D)iurno o (N)octurno'
	Leer turno
	turno = Mayusculas(turno)
	Escribir 'Escribe, si es festivo (S/N) '
	Leer festivo
	festivo = Mayusculas(festivo) 
	Escribir 'Escribe, la cantidad de horas '
	Leer cantidad
	
	
	Escribir 'Para ' nombre
	Escribir 'el dia ' diaSemana
	Si turno = 'D' Entonces
		Escribir 'En el Turno Diurno'
	SiNo
		Escribir 'En el Turno Nocturno'
	FinSi
	Si festivo = 'S' Entonces
		Escribir 'y como es festivo'
	FinSi
	Escribir 'para esta ' cantidad ' horas '
	Escribir 'Debe cobrar por el jornal ' calculoLaboral(turno, festivo, cantidad) ' pesos '
FinAlgoritmo