Funcion  fraseInvertido <- invertirFrase( frase, canChar)
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
	Escribir "La frase (" frase ") invertida es (" invertirFrase(frase,Longitud(frase)) ")"
FinAlgoritmo