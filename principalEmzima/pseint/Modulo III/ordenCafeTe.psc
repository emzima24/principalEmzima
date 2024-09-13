Algoritmo ordenCafeTe
	Definir bebidaSeleccion,mezcla,lecheTipo,limonSeleccion Como Caracter
	Escribir sin saltar "Escribe la inicial de una de las bebidas (C)afé o (T)é que deseas  "
	Leer bebidaSeleccion
	bebidaSeleccion = Mayusculas(bebidaSeleccion)
	Segun bebidaSeleccion Hacer
		"C":
			Escribir sin saltar "Escribe la inicial de (S)olo o (C)ortado "
			Leer mezcla
			mezcla = Mayusculas(mezcla)
			Si mezcla = "C" Entonces
				Escribir sin saltar "Escribe la inicial de si deseas leche (A)nimal o (V)egetal "
				Leer lecheTipo
				lecheTipo = Mayusculas(lecheTipo)				
				Si lecheTipo = "A" Entonces
					Escribir "Usted selecciono Café cortado con leche de tipo Animal" 
				SiNo
					Escribir  "Usted selecciono Café cortado con leche de tipo Vegetal"
				Fin Si
			SiNo
				Escribir  "Usted selecciono café sólo"
			Fin Si
		"T":
			Escribir sin saltar "Escribe la inicial de (S)i o (N)o deseas limón "
			Leer limonSeleccion
			limonSeleccion = Mayusculas(limonSeleccion)
			Si limonSeleccion = "S" Entonces
				Escribir "Usted selecciono Té con rodajas de limón" 
			SiNo
				Escribir  "Usted selecciono Té sin rodajas de limón"
			Fin Si
			
		De Otro Modo:
			Escribir  "che, escribir C o T, en serio..."
	Fin Segun
FinAlgoritmo
