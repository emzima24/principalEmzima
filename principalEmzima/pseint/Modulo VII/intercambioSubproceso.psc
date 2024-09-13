SubProceso intercambio( num1 Por Referencia, num2 Por Referencia )
	Definir temp Como Real
	temp = num1
	num1 = num2
	num2 = temp
FinSubProceso

Algoritmo intercambioSubproceso
	Definir num1, num2,temp Como Real
	Escribir "Escribe el numero uno "
	Leer num1
	Escribir "Escribe el numero dos "
	Leer num2
	intercambio(num1,num2)
	Escribir "el numero dos ahora es " num1
	Escribir "el numero uno ahora es " num2
FinAlgoritmo
