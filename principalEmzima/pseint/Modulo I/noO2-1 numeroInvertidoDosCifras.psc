// Complementario 2 COMO PUEDE HACERSE MAS FACIL
// Dise�a un algoritmo que permita obtener el n�mero invertido de un n�mero de dos cifras. Ejemplo, si se introduce 23 que muestre 32.


	
Algoritmo numeroInvertidoDosCifras
	// hay dos formas la que se muestra aca no se acumula 
	// si se quiere almacenar el numero invertido se debe descomentar  las lineas 16 y 17 y comentar la linea 15
	// como hay que trabajar con enteros que no operan entre ellos entonces se toma caracter
	// Si el codigo es mas largo y luego si operan matematicamente entonces se
	// toma decimal por ser mas amplio para no romper el codigo
	Definir numeroUsuario,numeroUsuarioInvertido,numeroUsuarioUno,numeroUsuarioDos Como Caracter
	Escribir "Escribir un n�mero entero de dos cifras"
	Leer numeroUsuario
	Escribir SubCadena(numeroUsuario ,1, 1),SubCadena(numeroUsuario ,0, 0)
	//numeroUsuarioInvertido = Concatenar(SubCadena(numeroUsuario ,1, 1),SubCadena(numeroUsuario ,0, 0))
	//Escribir "El n�mero ",numeroUsuario," al ser invertido es ", numeroUsuarioInvertido
FinAlgoritmo
