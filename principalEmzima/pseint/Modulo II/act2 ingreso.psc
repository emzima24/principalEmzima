// Actividad 2
// Diseña un programa que solicite al usuario ingresar su nombre de usuario y contraseña. 
// El programa debe verificar si el nombre de usuario es "admin" y si la contraseña es "1234". 
// Si ambos son correctos, el programa debe imprimir un mensaje de bienvenida. Recuerda nombrar y guardar tu algoritmo.



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
