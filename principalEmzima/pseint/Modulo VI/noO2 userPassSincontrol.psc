// Complementario 2
// Crea una funci�n llamada Login que reciba un nombre de usuario y una contrase�a, devolviendo True 
// si el nombre de usuario es "usuario1" y la contrase�a es "asdasd". La funci�n tambi�n debe contar
// los intentos de inicio de sesi�n, permitiendo solo 3 intentos. Si se superan los intentos permitidos,
// la funci�n debe devolver False. Recuerda nombrar y guardar tu algoritmo.




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
	// Se define real por costumbre mas que por otra razon cuando la memoria importe lo consideraremos distinto
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
