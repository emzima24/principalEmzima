// Actividad 4
// Realiza un programa que solicite al usuario un caracter. Si el caracter ingresado es S o N, se deberá de imprimir un mensaje por pantalla que diga "CORRECTO",
// en caso contrario, se deberá imprimir "INCORRECTO". Recuerda nombrar y guardar tu algoritmo



Algoritmo CondicionalDobleCaracter
	Definir caracterIngresado Como Caracter
	Escribir "Escribe, un caracter "
	Leer caracterIngresado
	// Se puede mejorar la linea 13 si descomentan las lineas 11 y 12 y se comenta la 13 
	// ya que se cambia el formato del ingreso para permitir que sea independiente de mayusculas y minusculas
	// a menos que sea restrictivo como en un password
	//caracterIngresado = Mayusculas(caracterIngresado)
	//Si caracterIngresado ="S" O caracterIngresado ="N" Entonces
	Si caracterIngresado ="S" O caracterIngresado ="N" O caracterIngresado ="s" O caracterIngresado ="n" Entonces
		Escribir "CORRECTO"
	SiNo
		Escribir "INCORRECTO"
	Fin Si
FinAlgoritmo
