// Actividad 2
// Crea una función esImpar que determine si un número es impar. Si es impar, la función debe 
// devolver True; en caso contrario, debe devolver False. Nota: la función no debe incluir mensajes
// que indiquen si el número es par o impar; esto debe manejarse en el programa principal. Recuerda nombrar y guardar tu algoritmo.



Funcion isNumImpar <- esImpar ( num1 )
	Definir isNumImpar Como Logico
	Si (num1 MOD 2) = 0 Entonces
		isNumImpar = Falso
	SiNo
		isNumImpar = Verdadero
	FinSi
Fin Funcion

Algoritmo imparFuncion
	// Se define real porque es menos probable que se rompa en ejecucion en el ingreso de la variable
	Definir num1,isNumImpar Como Real
	Escribir "introduce un numero "
	Leer num1
	Si esImpar(num1) Entonces
		Escribir "El " num1 " es impar"
	SiNo
		Escribir "El " num1 " es par"
	FinSi
FinAlgoritmo
