Algoritmo cantidadDigitosNew
	Definir numeroIngresadoOriginal,numeroIngresado,cantidadDigitos, control Como Real
	Escribir sin saltar "Escribe un numero entero "
	//Leer numeroIngresadoOriginal
	numeroIngresadoOriginal = 0
	numeroIngresado = numeroIngresadoOriginal
	cantidadDigitos = 1
	control = trunc(numeroIngresado/10)
	Mientras control <> 0 Hacer
		numeroIngresado = numeroIngresado/10
		cantidadDigitos = cantidadDigitos + 1
		control = trunc(numeroIngresado/10)
	FinMientras
	Escribir "El numero " numeroIngresadoOriginal " tiene " cantidadDigitos " dígitos "
FinAlgoritmo
