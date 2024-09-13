SubProceso anhoBisiesto ( anho por Valor, isBisiesto Por Referencia)
	// programa valido desde el año 1952
	isBisiesto = Falso
	Si anho >= 1952 Entonces
		Si (anho mod 4 = 0) Y ((anho mod 100 <> 0) O (anho mod 400 = 0)) Entonces
			isBisiesto = Verdadero
		FinSi
	FinSi
FinSubProceso

SubProceso escribirMensaje ( dia por Valor, max por Valor, mes por Valor, mesLetra por Valor, anho por Valor)
	// programa valido desde el año 1952
	SI dia <= max Y dia >= 1 Entonces
		Escribir "La fecha es ",dia,"/",mes,"/",anho,", es equivalente a ",dia," de ",mesLetra, " de ",anho
	SiNo
		Escribir "La fecha es ",dia,"/",mes,"/",anho,", esta mal la cantidad de dias debe estar entre 1 y " max
	FinSi
FinSubProceso

SubProceso mesTexto ( mes por Valor, mesLetra por Referencia)
	Segun mes Hacer
		"1":
			mesLetra = "enero"
		"2":
			mesLetra = "febrero"
		"3":
			mesLetra = "marzo"
		"4":
			mesLetra = "abril"
		"5":
			mesLetra = "mayo"
		"6":
			mesLetra = "junio"
		"7":
			mesLetra = "julio"
		"8":
			mesLetra = "agosto"
		"9":
			mesLetra = "septiembre"
		"10":
			mesLetra = "octubre"
		"11":
			mesLetra = "noviembre"
		"12":
			mesLetra = "diciembre"
		De Otro Modo:
			mesLetra= "Ninguno"
	Fin Segun
FinSubProceso

Algoritmo fechaConBisiestos
	// considera a febrero de 29 dias
	Definir dia, anho Como Real
	Definir mes,mesLetra Como Caracter
	Definir isBisiesto Como Logico
	
    Escribir sin saltar "Escribe la cantidad de dias "
	Leer dia
	//dia =30
	Escribir sin saltar "Escribe el numero correspondiente al mes "
	Leer mes
	//mes = "2"
	Escribir sin saltar "Escribe el numero año "
	Leer anho
	//anho = 2023
	mesTexto(mes,mesLetra)
	Segun mes Hacer
		"1" O "3" O "5" O "7" O "8" O "10" O "12":
			escribirMensaje( dia, 31, mes, mesLetra, anho )
			
		"2":
			anhoBisiesto( anho, isBisiesto )
			SI isBisiesto Entonces
				escribirMensaje( dia, 29, mes, mesLetra, anho )
			SiNo
				escribirMensaje( dia, 28, mes, mesLetra, anho )
			FinSi
		"4" O "6" O "9" O "11":
			escribirMensaje( dia, 30, mes, mesLetra, anho )
		De Otro Modo:
			Escribir "che, escribir el mes entre 1 y 12 no es tan dificil, en serio..."
	Fin Segun
FinAlgoritmo
