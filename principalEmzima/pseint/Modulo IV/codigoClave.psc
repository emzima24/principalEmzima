Algoritmo codigoClave
	Definir codigo,codigoSecreto,clave,claveSecreta Como Caracter
	codigoSecreto = "1024"
	claveSecreta = "4567"
	Repetir
		Escribir sin saltar "Escribe el codigo"
		Leer codigo
		//codigo = "1025"
		Escribir sin saltar "Escribe la clave"
		Leer clave
		//clave = "4560"
		//Escribir "primero",(codigo <> codigoSecreto)
		//Escribir "segundo",(clave <> claveSecreta)	
	Mientras Que ((codigo <> codigoSecreto) O (clave <> claveSecreta))
	Escribir "Ingresaste al sistema correctamente"
FinAlgoritmo
