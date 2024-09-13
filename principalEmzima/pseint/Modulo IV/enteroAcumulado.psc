Algoritmo enteroAcumulado
	Definir acumulado,numeroEntry Como Real
	Definir seleccionEntry Como Caracter
	acumulado = 0
	Repetir
		Escribir sin saltar "Escribe un numero entero positivo "
		Leer numeroEntry
		//numeroEntry = 1001
		Si numeroEntry < 0 Entonces
			acumulado = acumulado + numeroEntry
		SiNo
			Escribir sin saltar "Que parte de un numero entero positivo no entendes turro"
		FinSi
		Escribir sin saltar "quieres introducir otro numero escribe (S) para si o (N) para no "
		Leer seleccionEntry
		seleccionEntry = Minusculas(seleccionEntry)
		
	Mientras Que seleccionEntry <> "n"
	Escribir "Gracias por participar, el total es ", acumulado
FinAlgoritmo
