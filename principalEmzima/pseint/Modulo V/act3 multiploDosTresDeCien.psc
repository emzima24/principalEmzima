// Actividad 3
// Dise�a un programa que cuente la cantidad de n�meros entre 1 y 100 que son m�ltiplos de 2 o de 3. Recuerda nombrar y guardar tu algoritmo.
// Nota: Si un n�mero cumple ambas condiciones, debe ser contabilizado en ambos casos. Por ejemplo, el n�mero 18 es m�ltiplo de 2 y, a su vez, es m�ltiplo de 3.



Algoritmo multiploDosTresDeCien
	// Se define real por costumbre mas que por otra razon cuando la memoria importe lo consideraremos distinto
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
	Escribir "La cantidad de n�meros divisibles entre 2 los n�meros del 1 al 100 es ",cantidadDos
	Escribir "La cantidad de n�meros divisibles entre 3 los n�meros del 1 al 100 es ",CantidadTres
FinAlgoritmo
