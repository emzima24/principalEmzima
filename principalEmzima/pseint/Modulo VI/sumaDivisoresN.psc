Funcion sumaDiv <- sumaDivisores ( numberEntry )
	Definir element,sumaDiv Como Real
	sumaDiv = 0
	Para element<- 1 Hasta numberEntry -1 Con Paso 1 Hacer
		Si ((numberEntry MOD element) = 0) Entonces
			sumaDiv = 1 + sumaDiv
		FinSi
	FinPara
Fin Funcion

Algoritmo sumaDivisoresN
	Definir numberEntry Como Real
	Escribir Sin Saltar"Introduce un n�mero "
	Leer numberEntry
	
	Si numberEntry > 1 Entonces
		Escribir "La suma de los divisores del n�mero " numberEntry " da como resultado " sumaDivisores(numberEntry)
	SiNo
		Escribir "El n�mero ",numberEntry," no aplica para el concepto"
	FinSi
FinAlgoritmo
