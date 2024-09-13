Algoritmo multiploDosTresDeCien
	Definir numberEntry,cantidadDos,CantidadTres Como Real
	cantidadDos = 0
	CantidadTres = 0
	Para numberEntry<- 1 Hasta 100 Con Paso 1 Hacer
		Si ((numberEntry MOD 2) = 0) Entonces
			cantidadDos = cantidadDos + 1
		FinSi
		Si ((numberEntry MOD 3) = 0) Entonces
			CantidadTres = CantidadTres + 1
		FinSi
	Fin Para
	Escribir "La cantidad de números divisibles entre 2 los números del 1 al 100 es ",cantidadDos
	Escribir "La cantidad de números divisibles entre 3 los números del 1 al 100 es ",CantidadTres
FinAlgoritmo
