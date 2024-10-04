// Complementario 7
// Implemente de forma recursiva una función que le dé la vuelta a una cadena de caracteres. 
// NOTA: Si la cadena es un palíndromo, la cadena y su inversa coincidirán. 
// ejemplos: reconocer, casa, aca, ressasser



Funcion  fraseInvertido <- invertirFrase( frase, canChar)
	// Se define real por costumbre mas que por otra razon cuando la memoria importe lo consideraremos distinto
	Definir canCharTemp Como Real
	Definir fraseInvertido, fraseTemp Como Caracter
	canCharTemp = canChar - 1
	fraseTemp = Subcadena(frase,0,canCharTemp-1)
	//Escribir "temp" fraseTemp
	Si canChar <= 0 Entonces
		fraseInvertido = ""
	SiNo
		fraseInvertido = Subcadena(frase ,canCharTemp,canCharTemp) + invertirFrase(fraseTemp,Longitud(fraseTemp))
	FinSi
	FinFuncion

Algoritmo invertirCadenaRecursivo
	Definir frase Como Caracter
	Escribir "Escribe la frase "
	Leer frase
	//frase = "reconocer" //, casa, aca, ressasser
	Escribir "La frase (" frase ") invertida es (" invertirFrase(frase,Longitud(frase)) ")"
FinAlgoritmo