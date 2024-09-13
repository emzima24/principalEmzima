Algoritmo capicuaFutbol
	Definir posicionTactica Como Caracter
	Escribir "Escribe, los numeros de la posicion t�ctica "
	Leer posicionTactica
	Si SubCadena(posicionTactica,0,0) = SubCadena(posicionTactica,(Longitud(posicionTactica)-1),(Longitud(posicionTactica)-1)) Entonces
		Escribir "Es CAPICUA."
	SiNo
	    Escribir "NO ES CAPICUA" 
	Fin Si
FinAlgoritmo
