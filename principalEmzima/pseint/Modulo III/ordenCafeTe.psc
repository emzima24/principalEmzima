Algoritmo ordenCafeTe
	Definir bebidaSeleccion,mezcla,lecheTipo,limonSeleccion Como Caracter
	Escribir sin saltar "Escribe la inicial de una de las bebidas (C)af� o (T)� que deseas  "
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
					Escribir "Usted selecciono Caf� cortado con leche de tipo Animal" 
				SiNo
					Escribir  "Usted selecciono Caf� cortado con leche de tipo Vegetal"
				Fin Si
			SiNo
				Escribir  "Usted selecciono caf� s�lo"
			Fin Si
		"T":
			Escribir sin saltar "Escribe la inicial de (S)i o (N)o deseas lim�n "
			Leer limonSeleccion
			limonSeleccion = Mayusculas(limonSeleccion)
			Si limonSeleccion = "S" Entonces
				Escribir "Usted selecciono T� con rodajas de lim�n" 
			SiNo
				Escribir  "Usted selecciono T� sin rodajas de lim�n"
			Fin Si
			
		De Otro Modo:
			Escribir  "che, escribir C o T, en serio..."
	Fin Segun
FinAlgoritmo
