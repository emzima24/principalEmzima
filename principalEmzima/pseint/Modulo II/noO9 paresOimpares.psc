Algoritmo paresOimpares
	Definir numeroIngresadoUno,numeroIngresadoDos Como Entero
	Escribir "Escribe, el primer numero entero "
	Leer numeroIngresadoUno
	Escribir "Escribe, el segundo numero entero "
	Leer numeroIngresadoDos
	Si ((numeroIngresadoUno MOD 2) = 0) Y ((numeroIngresadoDos MOD 2) = 0) Entonces
		Escribir "Los números ",numeroIngresadoUno, " y ",numeroIngresadoDos," son pares ambos"
	SiNo
	    Escribir "Los números ",numeroIngresadoUno, " y ",numeroIngresadoDos," al menos uno de ellos es impar, o ambos son impares"
	Fin Si
FinAlgoritmo
