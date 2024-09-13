Algoritmo tiene3digitosOtro
	Definir numeroIngresado Como Entero
	Definir numeroIngresadoTexto Como Caracter

	Escribir sin saltar "Escribe un numero "
	//Leer dia
	numeroIngresado = 123
	numeroIngresadoTexto = ConvertirATexto(numeroIngresado)
	Si Longitud(numeroIngresadoTexto)=3 Entonces
		Escribir sin saltar "Tiene 3 digitos"
	SiNo
		Escribir sin saltar "No tiene 3 digitos"
	FinSi
FinAlgoritmo
