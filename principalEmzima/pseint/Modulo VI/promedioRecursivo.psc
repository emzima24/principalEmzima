Funcion suma <- sumar ( n )
	Definir i, number, suma, acumular,prom como Real
	
	Si n = 0 Entonces
		suma = 0
	SiNo
		Escribir "Ingresar numero : "
		Leer number
		suma = number + sumar(n - 1)
	FinSi
FinFuncion

Algoritmo promedioRecursivo
	Definir n,suma,prom como Reales
	Escribir "Ingrese la cantidad de datos:"
	Leer n
	
	Si n = 0 Entonces
		Escribir "La cantidad de datos para obtener un promedio debe ser mayor que cero, che en serio "
	SiNo
		prom = sumar(n)/n
		Escribir "El promedio es: "  prom
	FinSi
FinAlgoritmo