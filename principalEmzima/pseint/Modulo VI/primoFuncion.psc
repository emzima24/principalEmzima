Funcion count <- esPrimo (numberEntry)
	Definir element,count Como Real
	count = 0
	Para element<- 1 Hasta numberEntry Con Paso 1 Hacer
		Si ((numberEntry MOD element) = 0) Entonces
			count = 1 + count
		FinSi
	FinPara
Fin Funcion

Algoritmo primoFuncion
	Definir numberEntry Como Real
	Escribir Sin Saltar"Introduce un n�mero "
	Leer numberEntry
	
	Si numberEntry > 1 Entonces
		Si esPrimo(numberEntry) = 2 Entonces
			Escribir "El n�mero ",numberEntry," es primo"
		SiNo
			Escribir "El n�mero ",numberEntry," NO es primo"
		FinSi
	SiNo
		Escribir "El n�mero ",numberEntry," no es ni primo ni compuesto"
	FinSi
FinAlgoritmo
