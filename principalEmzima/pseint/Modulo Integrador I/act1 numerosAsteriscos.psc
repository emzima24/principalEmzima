// actividad 1
// 1. Programa de Visualizaci�n de N�meros y Asteriscos:
//
// Realiza un programa que lea cinco n�meros enteros, cada uno comprendido entre 1 y 20, e imprima 
// cada n�mero seguido de una cantidad de asteriscos equivalente a su valor. Por ejemplo:
//	
// Para el n�mero 5, imprimir: 5 *****
//		
// Para el n�mero 3, imprimir: 3 ***
//			
// Para el n�mero 11, imprimir: 11 ***********
//				
// Para el n�mero 2, imprimir: 2 **
//					
// Para el n�mero 9, imprimir: 9 *********



Algoritmo numerosAsteriscos
	// Se define real por costumbre mas que por otra razon cuando la memoria importe lo consideraremos distinto
	Definir i,j,number Como Real
	Definir ast Como Caracter
	Para i<-1 Hasta 5 Con Paso 1 Hacer
		ast = ""
		Escribir "Numero (" i ")"
		Leer number
		Para j<-1 Hasta number Con Paso 1 Hacer
			ast = ast +"*"
		Fin Para
		Escribir "Para el n�mero (" number "), imprimir: " number ast
	Fin Para
FinAlgoritmo
