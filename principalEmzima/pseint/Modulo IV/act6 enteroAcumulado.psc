// Actividad 6
// Escribe un programa que:
//
// Pida por teclado un número entero positivo.
//
// Pregunte al usuario si desea introducir otro número.
//	
// Repita los pasos anteriores mientras el usuario no responda "n" o "N" (no).
//		
// Muestre por pantalla la suma de los números introducidos por el usuario cuando determine NO ingresar más números. 



Algoritmo enteroAcumulado
	// Se define real porque es menos probable que se rompa en ejecucion en el ingreso del numero
	// y el acumulado solo para economia de codigo
	Definir acumulado,numeroEntry Como Real
	Definir seleccionEntry Como Caracter
	acumulado = 0
	Repetir
		Escribir sin saltar "Escribe un numero entero positivo "
		Leer numeroEntry
		//numeroEntry = 1001
		Si numeroEntry > 0 Entonces
			acumulado = acumulado + numeroEntry
		SiNo
			Escribir sin saltar "Que parte de un numero entero positivo no entendes turro"
		FinSi
		Escribir sin saltar "quieres introducir otro numero escribe (s) para si o (n) para no "
		Leer seleccionEntry
		seleccionEntry = Minusculas(seleccionEntry)
		
	Mientras Que seleccionEntry <> "n"
	Escribir "Gracias por participar, el total es ", acumulado
FinAlgoritmo
