Algoritmo parAcumulado
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
