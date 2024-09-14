// Complementario 2 HECHO CON TRAMPA DE METER CARACTER COMO NUMERO
// Crea un algoritmo que lea un número desde el teclado y determine si tiene tres dígitos.



Algoritmo tiene3digitos
	// Se define caracer porque es menos probable que se rompa en ejecucion en el ingreso del numero
	// y el dino-usuario no  lo sabe jejeje jejejej
	Definir numeroIngresado Como Caracter
	Escribir sin saltar "Escribe un numero "
	Leer numeroIngresado
	//numeroIngresado = "1234"
	Si Longitud(numeroIngresado)=3 Entonces
		Escribir sin saltar "Tiene 3 digitos"
	SiNo
		Escribir sin saltar "No tiene 3 digitos"
	FinSi
FinAlgoritmo
