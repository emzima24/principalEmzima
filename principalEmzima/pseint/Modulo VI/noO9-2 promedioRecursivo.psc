// Complementario 9 EN REALIDAD NO PODIA HACERSE SIN ARREGLO O RECURSIVA QUE NO SE HAN VISTO
// Crea una función que calcule el promedio de una lista de números. En el programa principal, solicita 
// al usuario una serie de números , usa la función para calcular el promedio y muestra el resultado.



Funcion suma <- sumar ( n )
	Definir i, number, suma, acumular,prom como Real
	
	Si n = 0 Entonces
		suma = 0
	SiNo
		Escribir "Ingresar numero : "
		Leer number
		suma = number + sumar(n - 1)
	FinSi
FinFuncion

Algoritmo promedioRecursivo
	//Se define real porque es menos probable que se rompa en ejecucion en el ingreso de la variable y se mantiene para todos los casos por economia de codigo
	Definir n,suma,prom como Reales
	Escribir "Ingrese la cantidad de datos:"
	Leer n
	
	Si n = 0 Entonces
		Escribir "La cantidad de datos para obtener un promedio debe ser mayor que cero, che en serio "
	SiNo
		prom = sumar(n)/n
		Escribir "El promedio es: "  prom
	FinSi
FinAlgoritmo