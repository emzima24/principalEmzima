Funcion cadaLinea(i)
	Definir  j Como Entero
	Para j = 0 Hasta 11-1 Con Paso 1 Hacer
		Si (j>=i Y j<=i+2) Entonces
			Escribir sin Saltar 6
		SiNo
			Si no (j>=10-2 Y j<=10) Entonces
				Escribir Sin Saltar " "
			SiNo
				Escribir Sin Saltar 9
			FinSi
		FinSi
	FinPara
	Escribir ""
FinFuncion

Algoritmo sin_titulo
	Definir i, j Como Entero
	Para i = 0 Hasta 6 Con Paso 1 Hacer
		Segun i Hacer
			0:
				Para j = 0 Hasta 11-1 Con Paso 1 Hacer
					Si (j>=i Y j<=i+2) Entonces
						Escribir sin Saltar 6
					SiNo
						Si no (j>=10-2 Y j<=10) Entonces
							Escribir Sin Saltar " "
						SiNo
							Escribir Sin Saltar 9
						FinSi
					FinSi
				FinPara
				Escribir ""
			1:
				Para j = 0 Hasta 11-1 Con Paso 1 Hacer
					Si (j>=i-i Y j<=i+2) Entonces
						Escribir sin Saltar 6
					SiNo
						Si no (j>=10-2-i Y j<=10) Entonces
							Escribir Sin Saltar " "
						SiNo
							Escribir Sin Saltar 9
						FinSi
					FinSi
				FinPara
				Escribir ""
			2:
				Para j = 0 Hasta 11-1 Con Paso 1 Hacer
					Si (j>=3-i Y j<=i+2) Entonces
						Escribir sin Saltar 6
					SiNo
						Si j = 5 Entonces
							Escribir Sin Saltar 0
						SiNo
							Si no (j>=10-2-i Y j<=10-1) Entonces
								Escribir Sin Saltar " "
							SiNo
								Escribir Sin Saltar 9
							FinSi
						FinSi
					FinSi
				FinPara
				Escribir ""
			3:
				Para j = 0 Hasta 11-1 Con Paso 1 Hacer
					Si (j>=5-i Y j<=i+1) Entonces
						Escribir sin Saltar 6
					SiNo
						Si j = 5 Entonces
							Escribir Sin Saltar 0
						SiNo
							Si no (j>=10-2-i Y j<=10-2) Entonces
								Escribir Sin Saltar " "
							SiNo
								Escribir Sin Saltar 9
							FinSi
						FinSi
					FinSi
				FinPara
				Escribir ""	
			4:
				Para j = 0 Hasta 11-1 Con Paso 1 Hacer
					Si (j>=7-i Y j<=i) Entonces
						Escribir sin Saltar 6
					SiNo
						Si j = 5 Entonces
							Escribir Sin Saltar 0
						SiNo
							Si no (j>=10-2-i Y j<=10-3) Entonces
								Escribir Sin Saltar " "
							SiNo
								Escribir Sin Saltar 9
							FinSi
						FinSi
					FinSi
				FinPara
				Escribir ""
			5:
				Para j = 0 Hasta 11-1 Con Paso 1 Hacer
					Si (j>=9-i Y j<=i-2) Entonces
						Escribir sin Saltar 6
					SiNo
						Si j = 5 Entonces
							Escribir Sin Saltar 0
						SiNo
							Si no (j>=10-1-i Y j<=10-4) Entonces
								Escribir Sin Saltar " "
							SiNo
								Escribir Sin Saltar 9
							FinSi
						FinSi
					FinSi
				FinPara
				Escribir ""		
			6:
				Para j = 0 Hasta 11-1 Con Paso 1 Hacer
					Si (j>=11-i Y j<=i-3) Entonces
						Escribir sin Saltar 6
					SiNo
						Si j = 5 Entonces
							Escribir Sin Saltar 0
						SiNo
							Si no (j>=10 Y j<=10-5) Entonces
								Escribir Sin Saltar " "
							SiNo
								Escribir Sin Saltar 9
							FinSi
						FinSi
					FinSi
				FinPara
				Escribir ""		
		FinSegun
        
    FinPara
FinAlgoritmo
