// Actividad 1
// Dise�a una funci�n calcularSuma que calcule la suma de dos n�meros. En el programa principal, solicita 
// al usuario los dos n�meros y p�salos a la funci�n. La funci�n debe calcular la suma y devolver el resultado
//para que se imprima en el programa principal. Recuerda nombrar y guardar tu algoritmo.



Funcion suma <- calcularSuma ( num1,num2 )
	Definir suma Como Real
	suma = num1 + num2
Fin Funcion

Algoritmo sumaFuncion
	// Se define real porque es menos probable que se rompa en ejecucion en el ingreso de la variable
	Definir num1,num2,suma Como Real
	Escribir "introduce un numero "
	Leer num1
	Escribir "introduce otro numero "
	Leer num2
	suma = calcularSuma(num1,num2)
	Escribir "La suma de " num1 " y " num2 " es " suma
FinAlgoritmo
