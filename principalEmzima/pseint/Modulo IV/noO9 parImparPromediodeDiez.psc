// Complementario 9
// Realiza un algoritmo para calcular la media de los números pares e impares. Se 
// ingresarán diez números. Utiliza la estructura repetitiva repetir-mientras para resolver esta actividad.



Algoritmo parImparPromediodeDiez
	// Se define real porque es menos probable que se rompa en ejecucion en el ingreso de la variable
	Definir numeroIngresado,acumuladoImpar,cantidad, acumuladoPar,cantidadPar,cantidadImpar Como Real
	cantidad = 10
	acumuladoImpar = 0
	acumuladoPar = 0
	cantidadPar = 0
	cantidadImpar = 0
	Repetir
		Escribir sin saltar "Escribe el numero "
		Leer numeroIngresado
		Si (numeroIngresado < 0) Entonces
			Escribir "No vale numeros negativos, turro, no sera tomado en cuenta para nada"
		SiNo
			Si ((numeroIngresado MOD 2) = 0) Entonces
				acumuladoPar = acumuladoPar + numeroIngresado
				cantidadPar = cantidadPar + 1
			SiNo
				acumuladoImpar = acumuladoImpar + numeroIngresado
				cantidadImpar = cantidadImpar + 1
			FinSi
			cantidad = cantidad -1
		FinSi
		
	Mientras Que cantidad > 0 
	Si cantidadPar <> 0 Entonces
		Escribir "De los numeros positivos pares que escribiste el promedio es ",acumuladoPar/cantidadPar
	SiNo
		Escribir "No hubo numeros pares"
	FinSi
	Si cantidadImpar <> 0 Entonces
		Escribir "De los numeros positivos impares que escribiste el promedio es ",acumuladoImpar/cantidadImpar
	SiNo
		Escribir "No hubo numeros impares"	
	FinSi
	
FinAlgoritmo
