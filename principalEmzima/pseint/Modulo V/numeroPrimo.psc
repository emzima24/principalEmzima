Algoritmo numeroPrimo
	Definir numberEntry,element,count Como Real
	Escribir Sin Saltar"Introduce un n�mero "
	//Leer numberEntry
	count = 0
	numberEntry = 7
	Si numberEntry > 1 Entonces
		Para element<- 1 Hasta numberEntry Con Paso 1 Hacer
			Si ((numberEntry MOD element) = 0) Entonces
				count = 1 + count
			FinSi
		FinPara
		Si count = 2 Entonces
			Escribir "El n�mero ",numberEntry," es primo"
		SiNo
			Escribir "El n�mero ",numberEntry," NO es primo"
		FinSi
	SiNo
		Escribir "El n�mero ",numberEntry," no es ni primo ni compuesto"
	FinSi
FinAlgoritmo
