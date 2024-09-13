Algoritmo equipoLetraIgual
	Definir equipoIngresado,equipoIngresado_comp Como Caracter
	Escribir "Escribe, el nombre de un equipo "
	Leer equipoIngresado
	equipoIngresado_comp = Mayusculas(equipoIngresado)
	Si SubCadena(equipoIngresado_comp,0,0) = SubCadena(equipoIngresado_comp,(Longitud(equipoIngresado_comp)-1),(Longitud(equipoIngresado_comp)-1)) Entonces
		Escribir "Es CORRECTO. El equipo ",equipoIngresado," inicia con la misma letra ", SubCadena(equipoIngresado_comp,0,0)
	SiNo
	    Escribir "Es INCORRECTO. El equipo ",equipoIngresado," inicia con la letra ",SubCadena(equipoIngresado_comp,0,0)," y termina con la letra ",SubCadena(equipoIngresado_comp,(Longitud(equipoIngresado_comp)-1),(Longitud(equipoIngresado_comp)-1))
	Fin Si
FinAlgoritmo
