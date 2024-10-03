// Complementario 9 EN REALIDAD NO PODIA HACERSE SIN ARREGLO O RECURSIVA QUE NO SE HAN VISTO
// Crea una función que calcule el promedio de una lista de números. En el programa principal, solicita 
// al usuario una serie de números , usa la función para calcular el promedio y muestra el resultado.



Funcion prom <- promedio ( arreglo, n )
	Definir i, suma, prom como Real
	
	suma <- 0
	Para i<-0 Hasta n-1 Hacer
		suma <- suma + arreglo[i]
	FinPara
	prom <- suma/n
FinFuncion

Algoritmo promedioConArreglo
	//Se define real porque es menos probable que se rompa en ejecucion en el ingreso de la variable y se mantiene para todos los casos por economia de codigo
	Definir i,n,arreglo,prom como Reales
	Escribir "Ingrese la cantidad de datos:"
	Leer n
	Dimension arreglo[n]
	
	Para i<-0 Hasta n-1 Hacer
		Escribir "Ingrese el dato ",i+1,":"
		Leer arreglo[i]
	FinPara
	
	Escribir "El promedio es: ",promedio(arreglo,n)
	
FinAlgoritmo
