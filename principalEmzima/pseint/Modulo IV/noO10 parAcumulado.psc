// Complementario 10
// Implementa un programa que calcule la suma de los N primeros números pares. Por ejemplo, si se
// ingresa el número 5 como valor de N, el algoritmo sumará los siguientes valores: 2+4+6+8+10. 
// Utiliza la estructura repetitiva repetir-mientras para resolver esta actividad.



Algoritmo parAcumulado
	// Se define real porque es menos probable que se rompa en ejecucion en el ingreso de la variable y para ahorro de codigo en el numero y en acumulador
	Definir numeroIngresado, acumuladoPar,contador Como Real
	Escribir sin saltar "Escribe el numero "
	Leer numeroIngresado
	acumuladoPar = 0
	contador = 0
	Repetir
		Si (numeroIngresado <= 0) Entonces
			Escribir "No vale numeros negativos, turro, no sera tomado en cuenta para nada"
		SiNo
			contador = contador + 1
			acumuladoPar = acumuladoPar + contador*2
		FinSi
		
	Mientras Que (contador  < numeroIngresado) Y (numeroIngresado >= 1)
	Escribir "De los primeros ",numeroIngresado," numeros pares la suma es ",acumuladoPar
	
FinAlgoritmo
