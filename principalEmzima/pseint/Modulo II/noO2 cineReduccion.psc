// Complementario 2
// La entrada al cine cuesta 5 d�lares por persona, sin embargo. Si la edad de la persona es menor a 12 a�os
// se le aplica un descuento del 30%. Escribir el algoritmo que calcule y muestre lo que pagar� la entrada al cine seg�n su edad.



Algoritmo cineReduccion
	Definir edad Como Real
	// Se define real porque evita la ruptura del codigo en ejecucion
	Escribir "Escribe, tu edad "
	Leer edad
	Si edad < 12 Entonces
		Escribir "El precio es ",5*.70
	SiNo
		Escribir "El precio es ",5 
	Fin Si
FinAlgoritmo
