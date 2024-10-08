// Terminado el reto del corazon
Funcion cadaLinea(ini,top, ini2, top2,i)
	Definir  j Como Entero
	Para j = 0 Hasta 11-1 Con Paso 1 Hacer
		Si (j>=ini Y j<=top) Entonces
			Escribir sin Saltar 6
		SiNo
			Si j=5 Y i >= 2 Entonces
				Escribir Sin Saltar 0
			SiNo
				Si no (j>=ini2 Y j<=top2) Entonces
					Escribir Sin Saltar " "
				SiNo
					Escribir Sin Saltar 9
				FinSi
			FinSi
		FinSi
	FinPara
	Escribir ""
FinFuncion

Funcion mostrarArreglo (arreglo)
	Definir  i,j Como Entero
	Para i = 0 hasta 7-1 Hacer
		Escribir Sin Saltar arreglo[i] ", "
	FinPara	
FinFuncion

Algoritmo corazonMostar
	Definir arreglo6ini,arreglo6top,arreglo9ini,arreglo9top,i Como Real
	Dimension arreglo6ini[7],arreglo6top[7],arreglo9ini[7],arreglo9top[7]
	Para i = 0 hasta 7-1 Hacer
		Si i = 0 Entonces
			arreglo6ini[i] = 0
			arreglo6top[i] = i + 3
			arreglo9ini[i] = 7
			arreglo9top[i] = 10
		SiNo
			arreglo6ini[i] = 2*i-1-i
			arreglo9top[i] = 11-i
			Si i = 1 Entonces
				arreglo6top[i] = i + 3
				arreglo9ini[i] = 6
			SiNo
				Si i <= 4 Entonces
					arreglo6top[i] = 4
					arreglo9ini[i] = 8-i
				SiNo
					arreglo6top[i] = 4
					Si i = 5 Entonces
						arreglo9ini[i] = 4
					SiNo
						arreglo9ini[i] = 10
					FinSi
				FinSi
			FinSi
		FinSi
	FinPara
	Para i = 0 hasta 7-1 Hacer
		cadaLinea(arreglo6ini[i],arreglo6top[i],arreglo9ini[i],arreglo9top[i],i)
	FinPara
FinAlgoritmo

//SubProceso originalParaAnalisis ()
//	Definir i, j Como Entero
//	Para i = 0 Hasta 6 Con Paso 1 Hacer
//		Segun i Hacer
//			0:
//				Para j = 0 Hasta 11-1 Con Paso 1 Hacer
//					Si (j>=i Y j<=i+3) Entonces
//						Escribir sin Saltar 6
//					SiNo
//						Si no (j>=10-3 Y j<=10) Entonces
//							Escribir Sin Saltar " "
//						SiNo
//							Escribir Sin Saltar 9
//						FinSi
//					FinSi
//				FinPara
//				Escribir ""
//			1:
//				Para j = 0 Hasta 11-1 Con Paso 1 Hacer
//					Si (j>=i-i Y j<=i+3) Entonces
//						Escribir sin Saltar 6
//					SiNo
//						Si no (j>=10-3-i Y j<=10) Entonces
//							Escribir Sin Saltar " "
//						SiNo
//							Escribir Sin Saltar 9
//						FinSi
//					FinSi
//				FinPara
//				Escribir ""
//			2:
//				Para j = 0 Hasta 11-1 Con Paso 1 Hacer
//					Si (j>=3-i Y j<=i+2) Entonces
//						Escribir sin Saltar 6
//					SiNo
//						Si j = 5 Entonces
//							Escribir Sin Saltar 0
//						SiNo
//							Si no (j>=10-2-i Y j<=10-1) Entonces
//								Escribir Sin Saltar " "
//							SiNo
//								Escribir Sin Saltar 9
//							FinSi
//						FinSi
//					FinSi
//				FinPara
//				Escribir ""
//			3:
//				Para j = 0 Hasta 11-1 Con Paso 1 Hacer
//					Si (j>=5-i Y j<=i+1) Entonces
//						Escribir sin Saltar 6
//					SiNo
//						Si j = 5 Entonces
//							Escribir Sin Saltar 0
//						SiNo
//							Si no (j>=10-2-i Y j<=10-2) Entonces
//								Escribir Sin Saltar " "
//							SiNo
//								Escribir Sin Saltar 9
//							FinSi
//						FinSi
//					FinSi
//				FinPara
//				Escribir ""	
//			4:
//				Para j = 0 Hasta 11-1 Con Paso 1 Hacer
//					Si (j>=7-i Y j<=i) Entonces
//						Escribir sin Saltar 6
//					SiNo
//						Si j = 5 Entonces
//							Escribir Sin Saltar 0
//						SiNo
//							Si no (j>=10-2-i Y j<=10-3) Entonces
//								Escribir Sin Saltar " "
//							SiNo
//								Escribir Sin Saltar 9
//							FinSi
//						FinSi
//					FinSi
//				FinPara
//				Escribir ""
//			5:
//				Para j = 0 Hasta 11-1 Con Paso 1 Hacer
//					Si (j>=9-i Y j<=i-2) Entonces
//						Escribir sin Saltar 6
//					SiNo
//						Si j = 5 Entonces
//							Escribir Sin Saltar 0
//						SiNo
//							Si no (j>=10-1-i Y j<=10-4) Entonces
//								Escribir Sin Saltar " "
//							SiNo
//								Escribir Sin Saltar 9
//							FinSi
//						FinSi
//					FinSi
//				FinPara
//				Escribir ""		
//			6:
//				Para j = 0 Hasta 11-1 Con Paso 1 Hacer
//					Si (j>=11-i Y j<=i-3) Entonces
//						Escribir sin Saltar 6
//					SiNo
//						Si j = 5 Entonces
//							Escribir Sin Saltar 0
//						SiNo
//							Si no (j>=10 Y j<=10-5) Entonces
//								Escribir Sin Saltar " "
//							SiNo
//								Escribir Sin Saltar 9
//							FinSi
//						FinSi
//					FinSi
//				FinPara
//				Escribir ""		
//		FinSegun
//    FinPara
//FinSubProceso

