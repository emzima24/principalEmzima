// Actividad 7
// Desarrolla un programa que solicite al usuario ingresar un nombre para su competencia, 
// el cual debe constar de una frase o palabra de exactamente 6 caracteres. Si el usuario 
// ingresa una frase o palabra de 6 caracteres, el programa imprimirá por pantalla el mensaje "LONGITUD  CORRECTA". 
// En caso contrario, se imprimirá "LONGITUD INCORRECTA". Se sugiere investigar la función Longitud() de PSeInt 
// para realizar esta verificación de manera eficiente. Recuerda nombrar y guardar tu algoritmo.



Algoritmo longitudCadena
	Definir cadenaIngresado Como Caracter
	Escribir "Escribe, una cadena de texto de 6 caracteres "
	Leer cadenaIngresado
	Si Longitud(cadenaIngresado) = 6 Entonces
		Escribir "Es CORRECTA. El texto ",cadenaIngresado," tiene exactamente 6 caracteres"
	SiNo
	    Escribir "Es INCORRECTA. El texto ",cadenaIngresado," no tiene 6 caracteres tiene ", Longitud(cadenaIngresado)
	Fin Si
FinAlgoritmo
