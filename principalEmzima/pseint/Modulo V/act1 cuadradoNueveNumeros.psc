// Actividad 1
// Dise�a un programa que calcule el cuadrado de los primeros 9 n�meros naturales e imprima por pantalla cada n�mero seguido de su cuadrado. Por ejemplo, "2 elevado al cuadrado es igual a 4", y as� sucesivamente. Recuerda nombrar y guardar tu algoritmo.
// Nota: Los primeros 9 n�meros naturales son: 1, 2, 3, 4, 5, 6, 7, 8, 9.



Algoritmo cuadradoNueveNumeros
	// Se define real por costumbre mas que por otra razon cuando la memoria importe lo consideraremos distinto
	Definir numberEntry Como Real
	Para numberEntry<- 1 Hasta 9 Con Paso 1 Hacer
		Escribir "El ",numberEntry," elevado al cuadrado es igual a ",numberEntry^2
	Fin Para
FinAlgoritmo
