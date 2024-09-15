// Actividad 3
// Realiza un procedimiento que permita realizar la división entre dos números y muestre el 
// cociente y el residuo utilizando el método de restas sucesivas. Este método consiste en  
// restar el divisor del dividendo repetidamente hasta obtener un resultado menor que el divisor. 
// El residuo será el resultado final y el número de restas realizadas será el cociente. Por ejemplo, para 50 / 13:
//
//50 - 13 = 37 (una resta)
//37 - 13 = 24 (dos restas)
//24 - 13 = 11 (tres restas)
//
//Como 11 es menor que 13, el residuo es 11 y el cociente es 3. Recuerda nombrar y guardar tu algoritmo.



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
	// Se define real porque es menos probable que se rompa en ejecucion en el ingreso de la variable y se mantiene para todos los casos por economia de codigo
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
