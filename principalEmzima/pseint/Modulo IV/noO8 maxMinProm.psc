// Complementario 8
// Escribe un programa que solicite al usuario ingresar n�meros enteros hasta que se 
// introduzca el n�mero 0 (cero). Al finalizar, el programa deber� mostrar el 
// n�mero m�ximo ingresado, el m�nimo y el promedio de todos ellos.
// Para encontrar el n�mero m�ximo, inicializa una variable llamada "numeroMaximo" en cero
// y compara cada n�mero ingresado con esta variable. Si el n�mero ingresado es mayor que "
// numeroMaximo", se actualiza el valor de "numeroMaximo" con el nuevo n�mero.
//
// Para encontrar el n�mero m�nimo, puedes seguir una l�gica similar. Inicializa 
// la variable "numeroMinimo" con un valor muy alto o con el primer n�mero ingresado 
// por el usuario. Luego, compara cada n�mero ingresado con "numeroMinimo" y actualiza 
// su valor si el n�mero ingresado es menor que "numeroMinimo".
//		
// Finalmente, calcula el promedio de todos los n�meros ingresados dividiendo la suma
// total de los n�meros por la cantidad de n�meros ingresados. Recuerda nombrar y guardar tu algoritmo.



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
