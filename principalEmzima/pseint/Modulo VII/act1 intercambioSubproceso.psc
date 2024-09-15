// Actividad 1
// Realiza un procedimiento que permita intercambiar el valor de dos variables de tipo entero. 
// La variable A debe terminar con el valor de la variable B, y viceversa. Este cambio debe ser 
// de forma permanente, es decir, los valores deben ser sobre escritos.  Recuerda nombrar y guardar tu algoritmo.
//
// Nota: Ten presente el paso por referencia, el cual te permite modificar los valores de variables declaradas en el algoritmo principal



SubProceso intercambio( num1 Por Referencia, num2 Por Referencia )
	// Se define real porque es menos probable que se rompa en ejecucion en el ingreso de la variable
	Definir temp Como Real
	temp = num1
	num1 = num2
	num2 = temp
FinSubProceso

Algoritmo intercambioSubproceso
	// Se define real porque es menos probable que se rompa en ejecucion en el ingreso de la variable
	Definir num1, num2,temp Como Real
	Escribir "Escribe el numero uno "
	Leer num1
	Escribir "Escribe el numero dos "
	Leer num2
	intercambio(num1,num2)
	Escribir "el numero dos ahora es " num1
	Escribir "el numero uno ahora es " num2
FinAlgoritmo
