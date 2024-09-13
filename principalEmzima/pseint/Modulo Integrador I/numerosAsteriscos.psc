Algoritmo numerosAsteriscos
	Definir i,j,number Como Real
	Definir ast Como Caracter
	Para i<-1 Hasta 5 Con Paso 1 Hacer
		ast = ""
		Escribir "Numero (" i ")"
		Leer number
		Para j<-1 Hasta number Con Paso 1 Hacer
			ast = ast +"*"
		Fin Para
		Escribir "Para el número (" number "), imprimir: " number ast
	Fin Para
FinAlgoritmo
