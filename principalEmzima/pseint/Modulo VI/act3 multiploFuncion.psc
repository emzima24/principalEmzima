// Actividad 3
// Crea una función esMultiplo que reciba dos números proporcionados por el usuario y valide si el 
// primer número es múltiplo del segundo. La función debe devolver True si el primer número es 
// múltiplo del segundo, y False en caso contrario. Recuerda nombrar y guardar tu algoritmo.



Funcion isMultiplo <- esMultiplo ( num1,num2 )
	Definir isMultiplo Como Logico
	Si (num2 MOD num1) = 0 Entonces
		isMultiplo = Verdadero
	SiNo
		isMultiplo = Falso
	FinSi
Fin Funcion

Algoritmo multiploFuncion
	// Se define real porque es menos probable que se rompa en ejecucion en el ingreso de la variable
	Definir num1,num2,suma Como Real
	Escribir "introduce un numero para saber si es "
	Leer num1
	Escribir "multiplo del numero que ahora introduces "
	Leer num2
	
	Si esMultiplo(num1,num2) Entonces
		Escribir "El numero " num1 " es multiplo de " num2
	SiNo
		Escribir "El numero " num1 " no es multiplo de " num2
	FinSi
	
FinAlgoritmo
