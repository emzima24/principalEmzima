// Complementario 1
// Lee tres n�meros que representen una fecha (d�a, mes, a�o) y verifica si es una fecha v�lida. 
// Si la fecha no es v�lida, muestra un mensaje de error en pantalla. Si la fecha es v�lida, 
// imprime la fecha cambiando el n�mero que representa el mes por su nombre. 
// Por ejemplo, si se introduce 1 2 2006, se imprimir� "1 de febrero de 2006".



Algoritmo fechaSinBisiestos
	// considera a febrero de 29 dias para no entrar en el tema de bisiesto o no
	// Se define el mes como caracter porque es menos probable que se rompa en ejecucion ademas el operador logico O en el segun responde bien no asi con numero
	Definir dia, anho Como Real
	Definir mes,mesLetra Como Caracter
	
    Escribir sin saltar "Escribe la cantidad de dias "
	Leer dia
	//dia =1
	Escribir sin saltar "Escribe el numero correspondiente al mes "
	Leer mes
	//mes = "1"
	Escribir sin saltar "Escribe el numero a�o "
	Leer anho
	//anho = 2024
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
	Segun mes Hacer
		"1" O "3" O "5" O "7" O "8" O "10" O "12":
			SI dia <= 31 Y dia >= 1 Entonces
				Escribir "La fecha es ",dia,"/",mes,"/",anho,", es equivalente a ",dia," de ",mesLetra, " de ",anho
			SiNo
				Escribir "La fecha es ",dia,"/",mes,"/",anho,", esta mal la cantidad de dias debe estar entre 1 y 31"
			FinSi
		"2":
			SI dia <= 29 Y dia >= 1 Entonces
				Escribir "La fecha es ",dia,"/",mes,"/",anho,", es equivalente a ",dia," de ",mesLetra, " de ",anho
			SiNo
				Escribir "La fecha es ",dia,"/",mes,"/",anho,", esta mal la cantidad de dias debe estar entre 1 y 29, debes revisar ademas si es bisiesto o no"
			FinSi
		"4" O "6" O "9" O "11":
			SI dia <= 30 Y dia >= 1 Entonces
				Escribir "La fecha es ",dia,"/",mes,"/",anho,", es equivalente a ",dia," de ",mesLetra, " de ",anho
			SiNo
				Escribir "La fecha es ",dia,"/",mes,"/",anho,", esta mal la cantidad de dias debe estar entre 1 y 30"
			FinSi
		De Otro Modo:
			Escribir "che, escribir el mes entre 1 y 12 no es tan dificil, en serio..."
	Fin Segun
FinAlgoritmo
