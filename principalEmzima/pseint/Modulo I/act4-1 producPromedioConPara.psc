Algoritmo producPromedioConPara
	Definir i, prod, total, promedio Como Real
	total = 0
	Para i =1 Hasta 3 Hacer
		Escribir "Cuanto vale producto numero ",i
		Leer prod
		total = total+ prod
	FinPara
	promedio = (total)/3
	Escribir "El promedio es de ", promedio
FinAlgoritmo
