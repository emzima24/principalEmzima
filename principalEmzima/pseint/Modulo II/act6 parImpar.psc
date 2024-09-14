// Actividad 6
// Crea un programa que solicite al usuario un número entero y determine si es par o impar. 
// Luego, mostrar en pantalla un mensaje indicando si el número es par o impar. Para determinar si un número es par, 
// se debe dividir entre dos y verificar que el resto sea igual a 0. Se recomienda investigar la función mod de PSeInt 
// para lograr esta verificación de manera eficiente. Recuerda nombrar y guardar tu algoritmo.



Algoritmo parImpar
	// Se define real porque ser más amplio
	Definir numeroIngresado Como Real
	Escribir "Escribe, un numero entero "
	Leer numeroIngresado
	Si (numeroIngresado MOD 2) = 0 Entonces
		Escribir "El ",numeroIngresado," es Par"
	SiNo
	    Escribir "El ",numeroIngresado," es Impar"
	Fin Si
FinAlgoritmo
