Algoritmo notasCategorias
	Definir notas,deficientes,regulares, buenos, excelentes,qtyDef,qtyReg,qtyBue,qtyExc,i Como Real
	Dimension notas[100],deficientes[100],regulares[100], buenos[100], excelentes[100]
	qtyDef = 0
	qtyReg = 0
	qtyBue = 0 
	qtyExc = 0
	Para i <- 0 Hasta 100 -1 Hacer
		notas[i] = Aleatorio(0,10)
		Si notas[i] <= 3 Entonces
			deficientes[i] = notas[i]
			qtyDef = qtyDef + 1
		SiNo
			Si notas[i] <= 6 Entonces
				regulares[i] = notas[i]
				qtyReg = qtyReg + 1
			SiNo
				Si notas[i] <= 8 Entonces
					buenos[i] = notas[i]
					qtyBue = qtyBue + 1
				SiNo
					excelentes[i] = notas[i]
					qtyExc = qtyExc + 1
				FinSi
			FinSi
		FinSi
	FinPara
	Escribir "Los estudiantes categorizados como deficientes son " qtyDef
	Escribir "Los estudiantes categorizados como regulares son " qtyReg
	Escribir "Los estudiantes categorizados como buenos son " qtyBue
	Escribir "Los estudiantes categorizados como excelentes son " qtyExc
FinAlgoritmo
