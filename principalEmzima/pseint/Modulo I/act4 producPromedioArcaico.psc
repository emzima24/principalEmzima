// Actividad 2
// Escribe un programa que calcule el precio promedio de un producto. El precio promedio se debe calcular a partir del precio del mismo producto en tres establecimientos distintos.
//
// Nota: Aseg�rate de solicitar al usuario que ingrese tres valores del producto, los cuales ser�n almacenados en tres variables previamente definidas.
// Posteriormente, podr�s llevar a cabo la operaci�n correspondiente.
//	
// Recuerda nombrar y guardar tu algoritmo.

	
	
Algoritmo producPromedioArcaico
	// el precio es una variable real no que mas que aplciar ese criterio
	Definir firstProd, secundProd, thirdProd, mean Como Real
	Escribir "Cuanto vale el primer producto"
	Leer firstProd
	Escribir "Cuanto vale el segundo producto"
	Leer secundProd
	Escribir "Cuanto vale el tercer producto"
	Leer thirdProd
	mean = (firstProd + secundProd + thirdProd)/3
	Escribir "El promedio de ",firstProd,", ",secundProd," y ",thirdProd," es de ", mean
FinAlgoritmo
