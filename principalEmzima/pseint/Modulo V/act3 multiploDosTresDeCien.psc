// Actividad 3
// Diseña un programa que cuente la cantidad de números entre 1 y 100 que son múltiplos de 2 o de 3. Recuerda nombrar y guardar tu algoritmo.
// Nota: Si un número cumple ambas condiciones, debe ser contabilizado en ambos casos. Por ejemplo, el número 18 es múltiplo de 2 y, a su vez, es múltiplo de 3.



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
	Escribir "La cantidad de números divisibles entre 2 los números del 1 al 100 es ",cantidadDos
	Escribir "La cantidad de números divisibles entre 3 los números del 1 al 100 es ",CantidadTres
FinAlgoritmo
