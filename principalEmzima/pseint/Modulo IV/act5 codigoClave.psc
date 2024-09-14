// Actividad 5
// Desarrolla un programa que solicite al usuario su código de usuario (un número entero mayor que cero)
// y su contraseña numérica (otro número entero positivo). El programa no permitirá continuar hasta que 
// el usuario introduzca el código 1024 y la contraseña 4567. El programa finaliza cuando se  
// ingresan los datos correctos. Recuerda nombrar y guardar tu algoritmo.




Algoritmo codigoClave
	// Se define real porque es menos probable que se rompa en ejecucion en el ingreso de las variables
	Definir codigo,codigoSecreto,clave,claveSecreta Como Caracter
	codigoSecreto = "1024"
	claveSecreta = "4567"
	Repetir
		Escribir sin saltar "Escribe el codigo (un entero mayor que cero)"
		Leer codigo
		//codigo = "1025"
		Escribir sin saltar "Escribe la clave (un entero mayor que cero)"
		Leer clave
		//clave = "4560"
		//Escribir "primero",(codigo <> codigoSecreto)
		//Escribir "segundo",(clave <> claveSecreta)	
	Mientras Que ((codigo <> codigoSecreto) O (clave <> claveSecreta))
	Escribir "Ingresaste al sistema correctamente"
FinAlgoritmo
