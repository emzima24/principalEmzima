Funcion numFibonacci <- fibonacci ( num )
	Definir numFibonacci,i,num4,num2,num3 Como Real
	num3 = 1
	num2 = 1
	Para i <- -1 hasta num Hacer
		Segun num Hacer
			0:
				num3 = 0
			1:	
				num3 = 1
			2:
				num3 = 1
			De Otro Modo:
				Si i>=3 Entonces
					num4 = num2 + num3
					num2 = num3
					num3 = num4
				FinSi
		FinSegun
		
	FinPara
	numFibonacci = num3
Fin Funcion

Algoritmo fibonacciNumber
	Definir num Como Real
	Escribir "Escribe el numero "
	Leer num
	num = 8
	Escribir "Con f(" num ") " fibonacci(num)
	
FinAlgoritmo
