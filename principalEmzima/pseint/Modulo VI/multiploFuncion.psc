Funcion isMultiplo <- esMultiplo ( num1,num2 )
	Definir isMultiplo Como Logico
	Si (num2 MOD num1) = 0 Entonces
		isMultiplo = Verdadero
	SiNo
		isMultiplo = Falso
	FinSi
Fin Funcion

Algoritmo multiploFuncion
	Definir num1,num2,suma Como Real
	Escribir "introduce un numero para saber si es "
	Leer num1
	Escribir "multiplo del nuero que ahora introduces "
	Leer num2
	
	Si esMultiplo(num1,num2) Entonces
		Escribir "El numero " num1 " es multiplo de " num2
	SiNo
		Escribir "El numero " num1 " no es multiplo de " num2
	FinSi
	
FinAlgoritmo
