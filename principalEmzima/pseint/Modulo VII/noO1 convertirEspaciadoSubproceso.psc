// Complementario 1
// Crea un procedimiento llamado "convertirEspaciado" que reciba como argumento un texto y 
// muestre una cadena con un espacio adicional tras cada letra. Por ejemplo, "Hola, tú" debería 
// devolver "H o l a , t ú". Desarrolla un programa principal que utilice este procedimiento.



SubProceso convertirEspaciado( frase Por Valor, fraseEspaciado Por Referencia )
	// Se define real por costumbre mas que por otra razon cuando la memoria importe lo consideraremos distinto
	Definir i Como Real
	Definir fraseNormalizada Como Caracter
	fraseNormalizada = Minusculas(frase)
	fraseEspaciado = ""
	Para i <- 0 hasta Longitud(frase)-1 Hacer
		Si (Subcadena(fraseNormalizada,i,i) <>  " ") Entonces
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