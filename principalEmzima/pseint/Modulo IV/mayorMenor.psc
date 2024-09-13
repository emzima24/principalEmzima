Algoritmo mayorMenor
	Definir minimo,maximo,numeroEntry,acumulado Como Real
	Escribir sin saltar "Escribe un entero que sera el valor minimo "
	Leer minimo
	//minimo = 0
	Escribir sin saltar "Escribe un entero que sera el valor maximo"
	Leer maximo
	//maximo = 1000
	Escribir sin saltar "Escribe un numero  "
	Leer numeroEntry
	acumulado = 0
	Mientras ((minimo <= numeroEntry) Y (maximo >= numeroEntry))
		Escribir sin saltar "Escribe un numero  "
		Leer numeroEntry
		acumulado = acumulado + 1
		//Escribir "primero",(minimo >= numeroEntry)
		//Escribir "segundo",(maximo <= numeroEntry)	
	Fin Mientras
	Escribir "Ingresaste en total, dentro de los limites ",acumulado
FinAlgoritmo
