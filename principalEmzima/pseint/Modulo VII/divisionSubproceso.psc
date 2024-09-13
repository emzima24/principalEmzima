SubProceso division( divisor Por valor, dividendo Por valor,residuo Por Referencia,cociente Por Referencia, isTodoOk Por Referencia )
	Definir count, numTemp Como Real
	isTodoOk = Falso
	count = 0
	numTemp = dividendo
	Si divisor <> 0 Entonces
		isTodoOk = Verdadero
		Si dividendo < divisor Entonces
			residuo = dividendo
			cociente = count
		SiNo
			Repetir
				numTemp = numTemp - divisor
				count = count + 1
			Mientras Que numTemp >= divisor
			residuo = numTemp
			cociente = count 
		FinSi
	FinSi
	
FinSubProceso

Algoritmo divisionSubproceso
	Definir divisor, dividendo,residuo,cociente Como Real
	Definir isTodoOk Como Logico
	Escribir "Escribe numero dividendo "
	Leer dividendo
	Escribir "Escribe numero divisor "
	Leer divisor
	division(divisor, dividendo,residuo,cociente,isTodoOk)
	Si isTodoOk Entonces
		Escribir "El cociente es " cociente
		Escribir "El residuo es " residuo
		Escribir "El divisor es " divisor
	SiNo
		Escribir "El divisor es 0 no se puede hacer la division "
	FinSi
FinAlgoritmo
