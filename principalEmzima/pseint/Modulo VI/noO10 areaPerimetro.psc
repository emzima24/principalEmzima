// Complementario 10
// Crea dos funciones: una para calcular el área y otra para calcular el perímetro de un rectángulo dado su ancho y su alto. En el programa principal, solicita al usuario el ancho y el alto del rectángulo, utiliza las funciones para calcular el área y el perímetro, y muestra los resultados.
//
// Fórmula del área: A = ancho * alto
//	
// Fórmula del perímetro: P = 2 * (ancho + alto)



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
