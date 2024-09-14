// Complementario 9
// Pide al usuario que ingrese dos n�meros enteros y determina si ambos son pares o impares. 
// Si ambos n�meros son pares, el programa imprimir� "Ambos n�meros son pares"; de lo contrario, 
// imprimir� "Los n�meros no son pares, o uno de ellos no es par".
// Se define real porque es menos probable que se rompa en ejecucion



Algoritmo paresOimpares
	// Se define real porque es menos probable que se rompa en ejecucion por error en el ingreso
	Definir numeroIngresadoUno,numeroIngresadoDos Como Real
	Escribir "Escribe, el primer numero entero "
	Leer numeroIngresadoUno
	Escribir "Escribe, el segundo numero entero "
	Leer numeroIngresadoDos
	Si ((numeroIngresadoUno MOD 2) = 0) Y ((numeroIngresadoDos MOD 2) = 0) Entonces
		Escribir "Los n�meros ",numeroIngresadoUno, " y ",numeroIngresadoDos," son pares ambos"
	SiNo
	    Escribir "Los n�meros ",numeroIngresadoUno, " y ",numeroIngresadoDos," al menos uno de ellos es impar, o ambos son impares"
	Fin Si
FinAlgoritmo
