Algoritmo maxMinProm
	Definir maximo,numeroIngresado,minimo,cantidad, acumulado Como Real
	Escribir sin saltar "Escribe un numero "
	Leer numeroIngresado
	maximo = numeroIngresado
	acumulado = numeroIngresado
	minimo = numeroIngresado
	cantidad = 1
	Mientras numeroIngresado <> 0 Hacer
		Escribir sin saltar "Escribe un numero "
		Leer numeroIngresado
		//numeroIngresado = 0
		Si (numeroIngresado > 0) Entonces		
			Si numeroIngresado > maximo Entonces
				maximo = numeroIngresado
			FinSi
			Si numeroIngresado < minimo Entonces
				minimo = numeroIngresado
			FinSi
			acumulado = acumulado +numeroIngresado
			cantidad = cantidad + 1
		FinSi
		Si (numeroIngresado < 0) Entonces
			Escribir "No vale numeros negativos, turro"
		FinSi
	FinMientras
	Si cantidad = 0 Entonces
		Escribir "No escribiste ningun numero, turro"
	SiNo
		Escribir "De los numeros positivos que escribiste el maximo es ",maximo
		Escribir "De los numeros positivos que escribiste el minimo es ",minimo
		//Escribir "acumulado ",acumulado," cantidad",cantidad
		Escribir "De los numeros positivos que escribiste el promedio es ",acumulado/cantidad
	FinSi
FinAlgoritmo
