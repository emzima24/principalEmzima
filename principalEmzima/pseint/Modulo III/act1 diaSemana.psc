// Actividad 1
// Solicita al usuario que ingrese un valor del 1 al 7. El programa mostrar� un mensaje 
// que indique a qu� d�a de la semana corresponde dicho valor. Por ejemplo, el n�mero 1 
// corresponde al "Lunes", el n�mero 2 al "Martes" y as� sucesivamente. Recuerda nombrar y guardar tu algoritmo.



Algoritmo diaSemana
	// Se define caracter porque es menos probable que se rompa en ejecucion en el ingreso de los dias
	Definir diaNumero Como Caracter
	Escribir "Escribe un n�mero del 1 al 7"
	Leer diaNumero
	Segun diaNumero Hacer
		"1":
			Escribir "Lunes"
		"2":
			Escribir "Martes"
		"3":
			Escribir "Mi�rcoles"
		"4":
			Escribir "Jueves"
		"5":
			Escribir "Viernes"
		"6":
			Escribir "Sabado"
		"7":
			Escribir "Domingo"
		De Otro Modo:
			Escribir  "che, del 1 al 7..."
	Fin Segun
FinAlgoritmo
