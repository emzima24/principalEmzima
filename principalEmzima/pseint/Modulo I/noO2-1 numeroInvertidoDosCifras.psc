Algoritmo numeroInvertidoDosCifras
	// hay dos formas la que se muestra aca no se acumula 
	// si se quiere almacenar el numero invertido se debe descomentar  las lineas 8 y 9 y comentar la linea 7
	Definir numeroUsuario,numeroUsuarioInvertido,numeroUsuarioUno,numeroUsuarioDos Como Caracter
	Escribir "Escribir un número entero de dos cifras"
	Leer numeroUsuario
	Escribir SubCadena(numeroUsuario ,1, 1),SubCadena(numeroUsuario ,0, 0)
	//numeroUsuarioInvertido = Concatenar(SubCadena(numeroUsuario ,1, 1),SubCadena(numeroUsuario ,0, 0))
	//Escribir "El número ",numeroUsuario," al ser invertido es ", numeroUsuarioInvertido
FinAlgoritmo
