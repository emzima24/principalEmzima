Algoritmo numeroInvertido
	// hay dos formas la que se muestra aca no se acumula 
	// si se quiere almacenar el numero invertido se debe descomentar  las lineas 7, 11 y 13 y comentar la linea 10
	Definir numeroUsuario,numeroUsuarioInvertido Como Caracter
	Definir posi Como Entero
	Escribir "Escribir un número entero de mínimo dos cifras"
	//numeroUsuarioInvertido = ""
	Leer numeroUsuario
	Para posi Desde Longitud(numeroUsuario) Hasta 0 Hacer
		Escribir sin saltar SubCadena(numeroUsuario ,posi , posi)
		//numeroUsuarioInvertido = Concatenar(numeroUsuarioInvertido,SubCadena(numeroUsuario ,posi , posi))
	FinPara
	//Escribir "El número ",numeroUsuario," al ser invertido es ", numeroUsuarioInvertido
FinAlgoritmo
