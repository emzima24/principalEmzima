// actividad 2
// 2. Contador de D�gitos:
//
//Escribe un programa que lea un n�mero entero y devuelva la cantidad de d�gitos que lo componen. Por ejemplo, 
// si ingresamos el n�mero 12345, el programa deber� devolver 5. Este c�lculo se realizar� utilizando operaciones 
// matem�ticas, teniendo en cuenta que las variables de tipo entero truncan los n�meros o resultados.



Algoritmo cantidadDigitosNew
	// Se define real porque es menos probable que se rompa en ejecucion en el ingreso de la variable y se mantiene para todos los casos por economia de codigo

	Definir numeroIngresadoOriginal,numeroIngresado,cantidadDigitos, control Como Real
	Escribir sin saltar "Escribe un numero entero "
	Leer numeroIngresadoOriginal
//	numeroIngresadoOriginal = 0
	numeroIngresado = numeroIngresadoOriginal
	cantidadDigitos = 1
	Mientras trunc(numeroIngresado/10) <> 0 Hacer
		numeroIngresado = numeroIngresado/10
		cantidadDigitos = cantidadDigitos + 1
	FinMientras
	Escribir "El numero " numeroIngresadoOriginal " tiene " cantidadDigitos " d�gitos "
FinAlgoritmo
