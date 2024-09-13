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
