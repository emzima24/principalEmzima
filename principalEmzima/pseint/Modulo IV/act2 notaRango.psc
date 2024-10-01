// Actividad 2
// Escribe un programa que valide si una nota está entre 0 y 10. Si la nota no está 
// dentro de este rango, se solicitará al usuario que ingrese la nota nuevamente 
// hasta que sea correcta. Recuerda nombrar y guardar tu algoritmo.



Algoritmo notaRango
	Definir nota Como Real
	Escribir sin saltar "Escribe una nota "
	Leer nota
//	nota = 12
	Mientras ((nota < 0) O (nota > 10)) Hacer
		Escribir sin saltar "Escribe una nota entre 0 y 10 "
		Leer nota
		//nota = 10
	Fin Mientras
	Escribir "La nota es ", nota
FinAlgoritmo
