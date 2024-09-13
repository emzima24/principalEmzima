Funcion diaAnterior <- fechaAnterior ( dia,mes, anho )
	Definir mesNumber Como Real
	Definir diaAnterior Como Caracter
	Si dia -1 = 0 Entonces
		anho = anho
		mesNumber = ConvertirANumero(mes) - 1
		Si mesNumber = 0 Entonces
			mes = "12"
		SiNo
			mes = ConvertirATexto(mesNumber)
		FinSi
		mesCheck(dia,mes,anho)
	SiNo
		dia = dia -1
		mes = mes
		anho = anho
	FinSi
	diaAnterior = ConvertirATexto(dia) + "/" + mes + "/" + ConvertirATexto(anho)
Fin Funcion

SubProceso mesCheck ( dia Por Referencia, mes Por Valor, anho Por Valor )
	Definir isBisiesto Como Logico 
	Segun mes Hacer
		"1" O "3" O "5" O "7" O "8" O "10" O "12":
			dia = 31
		"2":
			dia = 28
			isBisiesto = Falso
			anhoBisiesto(anho,isBisiesto)
			SI isBisiesto Entonces
				dia = 29
			FinSi
		"4" O "6" O "9" O "11":
			dia = 30
		De Otro Modo:
			Escribir "che, escribir el mes entre 1 y 12 no es tan dificil, en serio..."
	Fin Segun
FinSubProceso

SubProceso anhoBisiesto ( anho por Valor, isBisiesto Por Referencia)
	// programa valido desde el año 1952
	isBisiesto = Falso
	Si anho >= 1952 Entonces
		Si (anho mod 4 = 0) Y ((anho mod 100 <> 0) O (anho mod 400 = 0)) Entonces
			isBisiesto = Verdadero
		FinSi
	FinSi
FinSubProceso


Algoritmo fechaAnteriorCompleto
	Definir dia, anho Como Real
	Definir mes Como Caracter
	Definir isBisiesto Como Logico 
	
    //Escribir sin saltar "Escribe la cantidad de dias "
	//Leer dia
	dia =1
	//Escribir sin saltar "Escribe el numero correspondiente al mes "
	//Leer mes
	mes = "3"
	//mes = Mayusculas(mes)
	//Escribir sin saltar "Escribe el numero año "
	//Leer anho
	anho = 2024
	Escribir "La fecha anterior a la fecha " dia "/" mes "/" anho " es (" fechaAnterior( dia,mes, anho )  ")" 
FinAlgoritmo
