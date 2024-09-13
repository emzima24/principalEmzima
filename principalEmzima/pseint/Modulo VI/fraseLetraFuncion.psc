Funcion qtyLetrasFrase <- letrasFrase ( frase,letra )
	Definir qtyLetrasFrase, i Como Real
	qtyLetrasFrase = 0
	frase = Minusculas(frase)
	letra = Minusculas(letra)
	Para i<-0 Hasta (Longitud(frase)-1) Hacer
		Si letra = Subcadena(frase,i,i) Entonces
			qtyLetrasFrase = qtyLetrasFrase + 1
		FinSi
	FinPara
	
Fin Funcion

Algoritmo fraseLetraFuncion
	Definir frase,letra Como Caracter
	Definir qtyLetrasFrase Como Real
	Escribir "introduce una frase "
	Leer frase
	Escribir "introduce una letra "
	Leer letra
	
	qtyLetrasFrase = letrasFrase ( frase,letra )
	Escribir "La frase (" frase ") tiene " qtyLetrasFrase " letras " letra 
FinAlgoritmo
