SubProceso convertirEspaciado( frase Por Valor, fraseEspaciado Por Referencia )
	Definir i Como Real
	Definir fraseNormalizada Como Caracter
	fraseNormalizada = Minusculas(frase)
	fraseEspaciado = ""
	Para i <- 0 hasta Longitud(frase)-1 Hacer
		Si (Subcadena(fraseNormalizada,i,i) =  " ") Entonces
			fraseEspaciado = fraseEspaciado
		SiNo
			Si (Subcadena(fraseNormalizada,i,i) =  Subcadena(fraseNormalizada,Longitud(frase)-1,Longitud(frase)-1)) Entonces
				fraseEspaciado = fraseEspaciado + Subcadena(frase,i,i)
			SiNo
				fraseEspaciado = fraseEspaciado + Subcadena(frase,i,i) + " "
			FinSi
		FinSi
	FinPara
FinSubProceso

Algoritmo convertirEspaciadoSubproceso
	Definir frase, fraseEspaciado,temp Como Caracter
	Escribir "Escribe la frase "
	Leer frase
	convertirEspaciado(frase,fraseEspaciado)
	Escribir "La frase (" frase ") con espacios entre las letras queda (" fraseEspaciado ")"
FinAlgoritmo