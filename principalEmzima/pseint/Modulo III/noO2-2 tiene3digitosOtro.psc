// Complementario 2 Hecho sin trampa pero se puede romper con cualquier cosa
// Crea un algoritmo que lea un número desde el teclado y determine si tiene tres dígitos.



Algoritmo tiene3digitosOtro
	// Se define real porque es menos probable que se rompa en ejecucion 
	Definir numeroIngresado Como Real
	Definir numeroIngresadoTexto Como Caracter

	Escribir sin saltar "Escribe un numero "
	//Leer dia
	numeroIngresado = 123
	numeroIngresadoTexto = ConvertirATexto(numeroIngresado)
	// Se hace trampa convirtiendolo a texto mas adelante lo practicamos con un bucle
	// en el modulo IV https://github.com/emzima24/principalEmzima/blob/main/principalEmzima/pseint/Modulo%20IV/digitosSinConvertir.psc
	Si Longitud(numeroIngresadoTexto)=3 Entonces
		Escribir sin saltar "Tiene 3 digitos"
	SiNo
		Escribir sin saltar "No tiene 3 digitos"
	FinSi
FinAlgoritmo
