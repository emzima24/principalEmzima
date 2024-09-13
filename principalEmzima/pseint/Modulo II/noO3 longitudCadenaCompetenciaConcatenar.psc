Algoritmo longitudCadenaCompetenciaConcatenar
	Definir cadenaIngresado Como Caracter
	Escribir "Escribe, una cadena de texto de 4 caracteres "
	Leer cadenaIngresado
	Si Longitud(cadenaIngresado) = 4 Entonces
		Escribir "El texto ",(cadenaIngresado+"!")," tiene ahora 5 caracteres"
	SiNo
	    Escribir "El texto ",Concatenar(cadenaIngresado,"?")," tiene ahora ",Longitud(Concatenar(cadenaIngresado,"?")), " caracteres" 
	Fin Si
FinAlgoritmo
