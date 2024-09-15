// Complementario 3
//Crea un programa que dibuje una escalera de números, donde cada línea comience en uno y termine 
// en el número de la línea. Solicita al usuario la altura de la escalera al comenzar. Ejemplo: si se ingresa el número 3:
// 1
// 12
// 123



SubProceso escalera( num Por Valor)
	Definir i Como Real
	Definir figura Como Caracter
	figura = ""
	Si num = 0 Entonces
		Escribir "Con 0 no hay escaleras"
	SiNo
		Para i <- 1 Hasta num Hacer
			figura = figura + ConvertirATexto(i)
			Escribir figura
		FinPara
	FinSi
FinSubProceso

Algoritmo escaleraSubproceso
	// Se define real porque es menos probable que se rompa en ejecucion en el ingreso de la variable y se mantiene para todos los casos por economia de codigo
	Definir num Como Real
	Escribir "Escribe el numero "
	Leer num
//	num = 0
	escalera(num)
FinAlgoritmo
