// Complementario 1
// Dise�a un algoritmo que lea un n�mero de tres cifras correspondiente a la posici�n t�ctica del equipo 
// (433, 343, 253, etc.) y determine si es o no capic�a. Un n�mero es capic�a cuando se lee igual 
// de izquierda a derecha que de derecha a izquierda.Recuerda nombrar y guardar tu algoritmo.


Algoritmo capicuaFutbol
	// Se define caracter porque al no operar con el numero es mas facil hacerlo
	// mas adelante en el modulo VI es capicua https://github.com/emzima24/principalEmzima/blob/main/principalEmzima/pseint/Modulo%20VI/esCapicuaNumero.psc
	Definir posicionTactica Como Caracter
	Escribir "Escribe, los numeros de la posicion t�ctica "
	Leer posicionTactica
	Si SubCadena(posicionTactica,0,0) = SubCadena(posicionTactica,(Longitud(posicionTactica)-1),(Longitud(posicionTactica)-1)) Entonces
		Escribir "Es CAPICUA."
	SiNo
	    Escribir "NO ES CAPICUA" 
	Fin Si
FinAlgoritmo
