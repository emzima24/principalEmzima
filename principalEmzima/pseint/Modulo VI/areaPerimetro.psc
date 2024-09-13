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
