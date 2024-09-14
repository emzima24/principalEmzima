// Actividad 1
// Solicita al usuario que ingrese un valor del 1 al 7. El programa mostrará un mensaje 
// que indique a qué día de la semana corresponde dicho valor. Por ejemplo, el número 1 
// corresponde al "Lunes", el número 2 al "Martes" y así sucesivamente. Recuerda nombrar y guardar tu algoritmo.



Algoritmo diaSemana
	// Se define caracter porque es menos probable que se rompa en ejecucion en el ingreso de los dias
	Definir diaNumero Como Caracter
	Escribir "Escribe un número del 1 al 7"
	Leer diaNumero
	Segun diaNumero Hacer
		"1":
			Escribir "Lunes"
		"2":
			Escribir "Martes"
		"3":
			Escribir "Miércoles"
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
