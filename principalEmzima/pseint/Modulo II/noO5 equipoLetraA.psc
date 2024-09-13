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
