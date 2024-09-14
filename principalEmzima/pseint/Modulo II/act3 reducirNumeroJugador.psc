// Actividad 3
// Crea un programa que permita ingresar un número de jugador, si el número es mayor de 10, 
// se debe calcular y mostrar en pantalla el 18% de este. Recuerda nombrar y guardar tu algoritmo.



Algoritmo reducirNumeroJugador
	// Se define real porque tiene decimales al operar
	Definir numeroJugador Como Real
	Escribir "Escribe, tu numero de jugador "
	Leer numeroJugador
	Si numeroJugador > 10 Entonces
		Escribir "Bueno tu número es en realidad ",numeroJugador*.18
	SiNo
		Escribir "No piden hacer nada pero bueno en fin no me gusta dejarlo vacio tu numero es ", numeroJugador
	Fin Si
FinAlgoritmo
