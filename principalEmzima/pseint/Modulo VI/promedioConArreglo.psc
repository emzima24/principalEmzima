Funcion prom <- promedio ( arreglo, n )
	Definir i, suma, prom como Real
	
	suma <- 0
	Para i<-0 Hasta n-1 Hacer
		suma <- suma + arreglo[i]
	FinPara
	prom <- suma/n
FinFuncion

Algoritmo promedioConArreglo
	Definir i,n,arreglo,prom como Reales
	Dimension arreglo[100]
	Escribir "Ingrese la cantidad de datos:"
	Leer n
	
	Para i<-0 Hasta n-1 Hacer
		Escribir "Ingrese el dato ",i+1,":"
		Leer arreglo[i]
	FinPara
	
	Escribir "El promedio es: ",promedio(arreglo,n)
	
FinAlgoritmo
