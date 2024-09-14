// Complementario 5
// Escribe un programa que solicite el nombre de un equipo de fútbol y valide 
// si la primera letra de ese nombre es una 'A'. Si la primera letra es una 'A', 
// se imprimirá un mensaje que diga "CORRECTO"; de lo contrario, se imprimirá "INCORRECTO". 
// Se sugiere investigar la función Subcadena de PSeInt para realizar esta tarea de manera eficiente.
// Se define real porque es menos probable que se rompa en ejecucion



Algoritmo equipoLetraA
	Definir equipoIngresado,equipoIngresado_comp Como Caracter
	Escribir "Escribe, el nombre de un equipo "
	Leer equipoIngresado
	equipoIngresado_comp = Mayusculas(equipoIngresado)
	Si SubCadena(equipoIngresado_comp,0,0) = "A" Entonces
		Escribir "Es CORRECTO. El equipo ",equipoIngresado," inicia con A"
	SiNo
	    Escribir "Es INCORRECTO. El equipo ",equipoIngresado," no inicia con A"
	Fin Si
FinAlgoritmo
