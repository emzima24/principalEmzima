// actividad 1
// 1. Programa de Visualización de Números y Asteriscos:
//
// Realiza un programa que lea cinco números enteros, cada uno comprendido entre 1 y 20, e imprima 
// cada número seguido de una cantidad de asteriscos equivalente a su valor. Por ejemplo:
//	
// Para el número 5, imprimir: 5 *****
//		
// Para el número 3, imprimir: 3 ***
//			
// Para el número 11, imprimir: 11 ***********
//				
// Para el número 2, imprimir: 2 **
//					
// Para el número 9, imprimir: 9 *********



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
		Escribir "Para el número (" number "), imprimir: " number ast
	Fin Para
FinAlgoritmo
