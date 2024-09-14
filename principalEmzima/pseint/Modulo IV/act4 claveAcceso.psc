// Actividad 4
// Considerando que la clave de acceso a un sistema es "EUREKA", desarrolla un programa que solicite 
// al usuario ingresar una clave. Se cuenta con tres intentos para adivinarla; si se fallan los 
// tres intentos, se mostrará un mensaje indicando que se han agotado los intentos. En caso de acertar 
// la clave, se mostrará un mensaje indicando que se ha ingresado al sistema correctamente. Recuerda nombrar y guardar tu algoritmo.



Algoritmo claveAcceso
	Definir clave,claveSecreta Como Caracter
	Definir control Como Entero
	control=1
	Repetir
		Escribir sin saltar "Escribe la clave, intento (",control,")"
		Leer clave
		//clave = "e"
		claveSecreta = "EUREKA"
		control = control+ 1
	Mientras Que (clave <> claveSecreta) Y (control<=3)
	Si clave = claveSecreta Entonces 
		Escribir "Ingresaste al sistema correctamente"
	SiNo
		Escribir "Sos un turro, te olvidaste la clave"
	FinSi
FinAlgoritmo
