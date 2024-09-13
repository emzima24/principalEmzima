Funcion suma <- calcularSuma ( num1,num2 )
	Definir suma Como Real
	suma = num1 + num2
Fin Funcion

Algoritmo sumaFuncion
	Definir num1,num2,suma Como Real
	Escribir "introduce un numero "
	Leer num1
	Escribir "introduce otro numero "
	Leer num2
	suma = calcularSuma(num1,num2)
	Escribir "La suma de " num1 " y " num2 " es " suma
FinAlgoritmo
