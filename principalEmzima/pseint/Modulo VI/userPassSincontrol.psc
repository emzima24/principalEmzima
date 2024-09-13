Funcion isLogin <- login ( user,password)
	Definir isLogin Como Logico
	// control
	Si (user = "usuario1") Y (password = "asdasd") Entonces //(control <= 3) Y
		isLogin = Verdadero
	SiNo
		isLogin = Falso
	FinSi

Fin Funcion

Algoritmo userPassSincontrol
	Definir isLogin Como Logico
	Definir control Como Real
	Definir user,password Como Caracter
	control = 1
	
	Repetir 
		Escribir 'Escribe, tu nombre de usuario '
		Leer user
		Escribir 'Escribe la clave, intento (', control, ')' Sin Saltar
		Leer password
		isLogin = login(user,password)
		control = control + 1
	Mientras Que no isLogin Y (control <=3)
	Escribir isLogin
	
FinAlgoritmo
