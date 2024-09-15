// Complementario 10
// Crea dos funciones: una para calcular el �rea y otra para calcular el per�metro de un rect�ngulo dado su ancho y su alto. En el programa principal, solicita al usuario el ancho y el alto del rect�ngulo, utiliza las funciones para calcular el �rea y el per�metro, y muestra los resultados.
//
// F�rmula del �rea: A = ancho * alto
//	
// F�rmula del per�metro: P = 2 * (ancho + alto)



Funcion perimetroCal <- perimetro ( ancho,altura )
	Definir perimetroCal Como Real
	perimetroCal = 2*(ancho + altura)
Fin Funcion

Funcion areaCal <- area ( ancho,altura )
	Definir areaCal Como Real
	areaCal = ancho * altura
Fin Funcion

Algoritmo areaPerimetro
	Definir  ancho,altura Como Real
	Escribir 'Escribe, el ancho '
	Leer ancho
	Escribir 'Escribe, la altura '
	Leer altura
	
	Escribir 'Con este ancho ' ancho ' y esta altura ' altura ' el area es ' area(ancho,altura)
	Escribir 'Con este ancho ' ancho ' y esta altura ' altura ' el perimetro es ' perimetro(ancho,altura)
FinAlgoritmo
