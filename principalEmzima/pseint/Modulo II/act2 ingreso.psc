Algoritmo Ingreso
	// se prueba porque es mas conveniente usar caracter que real o entero
	Definir username,password Como Caracter //,password
	//Definir password Como Entero
	Escribir "Escribe, tu nombre de usuario "
	Leer username
	Escribir "Escribe, tu contraseña "
	Leer password
	Si username = "admin" Y password ="1234" Entonces
		Escribir "Bien, ya estas adentro"
	SiNo
		Escribir "El nombre de usuario y/o la contraseña no corresponden"
	Fin Si
FinAlgoritmo
