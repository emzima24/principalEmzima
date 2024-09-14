// Actividad 1
// Un arquero de fútbol desea saber si su promedio de tapadas es mayor a la media, el programa le pedirá al usuario su promedio actual y el valor de la media actual. Si el promedio del arquero es mayor a la media se debe mostrar un mensaje por pantalla indicándolo. Para ello: 
//
// Crea un nuevo algoritmo llamado "Promedio"
//	
// Define 2 variables llamadas promedioActual y mediaActual del tipo real.
//	
// Solicita al usuario que ingrese su promedio y asigna el valor ingresado en la variable previamente declarada.
//	
// Solicita al usuario que ingrese el valor de la media actual y asigna el valor ingresado en la variable previamente declarada.
//	
// Utilizando una estructura de control condicional simple, compara ambos valores y, en caso de el promedio del arquero ser MAYOR o IGUAL a la media actual, muestra un mensaje en pantalla de felicitaciones.
//	
// Ejecuta el programa y valida que se comporte según lo esperado.
//	
// Guarda  el algoritmo en la carpeta creada previamente para dicho fin. 


Algoritmo promedio
	Definir promedioActual, mediaActual Como Real
	Escribir "Escribe, cuanto es tu promedio "
	Leer promedioActual
	Escribir "Escribe, cuanto es la media de la liga "
	Leer mediaActual
	Si promedioActual >= mediaActual Entonces
		Escribir "Sos, un crac"
	SiNo
		Escribir "Sos, un cracso... perdido"
	Fin Si
FinAlgoritmo
