// Complementario 7
// Escribe un programa que calcule cu�ntos d�gitos tiene un n�mero entero positivo sin 
// convertirlo a cadena. Pista: esto se puede lograr dividiendo varias veces entre 10. 
// (Nota: investiga la funci�n trunc()). Utiliza la estructura repetitiva mientras para resolver esta actividad.



Algoritmo digitosSinConvertir
	// Se define real porque es menos probable que se rompa en ejecucion en el ingreso de la variable
	Definir numeroIngresadoOriginal,numeroIngresado,cantidadDigitos, control Como Real
	Escribir sin saltar "Escribe un numero entero "
	Leer numeroIngresadoOriginal
//	numeroIngresadoOriginal = 123456789
	numeroIngresado = numeroIngresadoOriginal
	cantidadDigitos = 1
	control = trunc(numeroIngresado/10)
	Mientras control <> 0 Hacer
		numeroIngresado = numeroIngresado/10
		cantidadDigitos = cantidadDigitos + 1
		control = trunc(numeroIngresado/10)
	FinMientras
	Escribir "El numero ",numeroIngresadoOriginal," tiene ",cantidadDigitos, " cifras"
FinAlgoritmo
