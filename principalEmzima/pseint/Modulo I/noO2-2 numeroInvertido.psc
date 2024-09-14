// Complementario 2 OTRA FROMA CON ALGO NO VISTO HASTA AHORA POR JODER NADA MAS AUN SIN TRABAJAR EL NUMERO 
// Diseña un algoritmo que permita obtener el número invertido de un número de dos cifras. Ejemplo, si se introduce 23 que muestre 32.


	
Algoritmo numeroInvertido
	// hay dos formas la que se muestra aca no se acumula 
	// si se quiere almacenar el numero invertido se debe descomentar  las lineas 15, 19 y 21 y comentar la linea 18
	// como hay que trabajar con enteros que no operan entre ellos entonces se toma caracter
	// Si el codigo es mas largo y luego si operan matematicamente entonces se
	// toma decimal por ser mas amplio para no romper el codigo
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
