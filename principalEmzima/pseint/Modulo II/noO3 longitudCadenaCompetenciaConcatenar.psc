// Complementario 3
// Desarrolla un programa que solicite al usuario ingresar un nombre para su competencia, 
// el cual puede ser una frase o palabra. Si la frase o palabra tiene una longitud de 4 caracteres, 
// el programa concatenará un signo de exclamación al final de la cadena; de lo contrario, 
// añadirá un signo de interrogación. Posteriormente, el programa mostrará la frase final resultante. 
// Se recomienda investigar las funciones Longitud() y Concatenar() de PSeInt para realizar esta tarea de manera eficiente.



Algoritmo longitudCadenaCompetenciaConcatenar
	Definir cadenaIngresado Como Caracter
	Escribir "Escribe, una cadena de texto de 4 caracteres "
	Leer cadenaIngresado
	Si Longitud(cadenaIngresado) = 4 Entonces
		// se usan las dos foras de concatenar con la funcion y con la funcion
		Escribir "El texto ",(cadenaIngresado+"!")," tiene ahora 5 caracteres"
	SiNo
	    Escribir "El texto ",Concatenar(cadenaIngresado,"?")," tiene ahora ",Longitud(Concatenar(cadenaIngresado,"?")), " caracteres" 
	Fin Si
FinAlgoritmo
