// Complementario 2 OTRA FROMA CON ALGO NO VISTO HASTA AHORA POR JODER NADA MAS AUN SIN TRABAJAR EL NUMERO 
// Dise�a un algoritmo que permita obtener el n�mero invertido de un n�mero de dos cifras. Ejemplo, si se introduce 23 que muestre 32.


	
Algoritmo numeroInvertido
	// hay dos formas la que se muestra aca no se acumula 
	// si se quiere almacenar el numero invertido se debe descomentar  las lineas 15, 19 y 21 y comentar la linea 18
	// como hay que trabajar con enteros que no operan entre ellos entonces se toma caracter
	// Si el codigo es mas largo y luego si operan matematicamente entonces se
	// toma decimal por ser mas amplio para no romper el codigo
	Definir numeroUsuario,numeroUsuarioInvertido Como Caracter
	Definir posi Como Entero
	Escribir "Escribir un n�mero entero de m�nimo dos cifras"
	//numeroUsuarioInvertido = ""
	Leer numeroUsuario
	Para posi Desde Longitud(numeroUsuario) Hasta 0 Hacer
		Escribir sin saltar SubCadena(numeroUsuario ,posi , posi)
		//numeroUsuarioInvertido = Concatenar(numeroUsuarioInvertido,SubCadena(numeroUsuario ,posi , posi))
	FinPara
	//Escribir "El n�mero ",numeroUsuario," al ser invertido es ", numeroUsuarioInvertido
FinAlgoritmo
