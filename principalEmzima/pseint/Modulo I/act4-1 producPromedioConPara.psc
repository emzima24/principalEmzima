// Actividad 2 VERSION CON PRECURSOS NO VISTOS HASTA ACA (PARA) EN REALIDAD ES POR JODER NADA MAS
// Escribe un programa que calcule el precio promedio de un producto. El precio promedio se debe calcular a partir del precio del mismo producto en tres establecimientos distintos.
//
// Nota: Aseg�rate de solicitar al usuario que ingrese tres valores del producto, los cuales ser�n almacenados en tres variables previamente definidas.
// Posteriormente, podr�s llevar a cabo la operaci�n correspondiente.
//	
// Recuerda nombrar y guardar tu algoritmo.



Algoritmo producPromedioConPara
	// como hay el precio es real se usa ese criterio para definir la variable
	// pero para ahorrar codigo i tambien se administra como real aunque no sea necesario 
	// pero cuando ya se un tema la administraci�n de memoria entoces el codigo sera mas largo
	// y podras definir como entero algunas y otras como reales etc etc
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
