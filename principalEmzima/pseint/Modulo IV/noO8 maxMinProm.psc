// Complementario 8
// Escribe un programa que solicite al usuario ingresar números enteros hasta que se 
// introduzca el número 0 (cero). Al finalizar, el programa deberá mostrar el 
// número máximo ingresado, el mínimo y el promedio de todos ellos.
// Para encontrar el número máximo, inicializa una variable llamada "numeroMaximo" en cero
// y compara cada número ingresado con esta variable. Si el número ingresado es mayor que "
// numeroMaximo", se actualiza el valor de "numeroMaximo" con el nuevo número.
//
// Para encontrar el número mínimo, puedes seguir una lógica similar. Inicializa 
// la variable "numeroMinimo" con un valor muy alto o con el primer número ingresado 
// por el usuario. Luego, compara cada número ingresado con "numeroMinimo" y actualiza 
// su valor si el número ingresado es menor que "numeroMinimo".
//		
// Finalmente, calcula el promedio de todos los números ingresados dividiendo la suma
// total de los números por la cantidad de números ingresados. Recuerda nombrar y guardar tu algoritmo.



Algoritmo maxMinProm
	// Se define real porque es menos probable que se rompa en ejecucion en el ingreso de la variable
	Definir maximo,numeroIngresado,minimo,cantidad, acumulado Como Real
	Escribir sin saltar "Escribe un numero "
	Leer numeroIngresado
	maximo = numeroIngresado
	acumulado = numeroIngresado
	minimo = numeroIngresado
	cantidad = 1
	Mientras numeroIngresado <> 0 Hacer
		Escribir sin saltar "Escribe un numero "
		Leer numeroIngresado
		//numeroIngresado = 0
		Si (numeroIngresado > 0) Entonces		
			Si numeroIngresado > maximo Entonces
				maximo = numeroIngresado
			FinSi
			Si numeroIngresado < minimo Entonces
				minimo = numeroIngresado
			FinSi
			acumulado = acumulado +numeroIngresado
			cantidad = cantidad + 1
		FinSi
		Si (numeroIngresado < 0) Entonces
			Escribir "No vale numeros negativos, turro"
		FinSi
	FinMientras
	Escribir "De los numeros positivos que escribiste el maximo es ",maximo
	Escribir "De los numeros positivos que escribiste el minimo es ",minimo
	Escribir "De los numeros positivos que escribiste el promedio es ",acumulado/cantidad
FinAlgoritmo
