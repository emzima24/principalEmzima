Funcion isNumImpar <- esImpar ( num1 )
	Definir isNumImpar Como Logico
	Si (num1 MOD 2) = 0 Entonces
		isNumImpar = Falso
	SiNo
		isNumImpar = Verdadero
	FinSi
Fin Funcion

Algoritmo imparFuncion
	Definir num1,isNumImpar Como Real
	Escribir "introduce un numero "
	Leer num1
	Si esImpar(num1) Entonces
		Escribir "El " num1 " es impar"
	SiNo
		Escribir "El " num1 " es par"
	FinSi
FinAlgoritmo
