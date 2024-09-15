// Complementario 3
// Crea una funci�n que calcule la suma de los d�gitos de un n�mero. Ejemplo: 25 = 2 + 5 = 7. 
// Nota: para obtener el �ltimo d�gito de un n�mero de 2 cifras o m�s, utiliza el resto 
// de una divisi�n entre 10. Recuerda el uso de las funciones Mod y Trunc.



Funcion sumDig <- sumaDigitos ( cifra )
	Definir i,sumDig Como Real
	sumDig = 0
	Para i<-0 Hasta Longitud(cifra) Hacer
		sumDig = sumDig + ConvertirANumero(SubCadena(cifra,i,i))
	FinPara
Fin Funcion

Algoritmo sumaDigitosText
	// Se define real por costumbre mas que por otra razon cuando la memoria importe lo consideraremos distinto
	// se usa la cifra ingresada como caracter para trabajarla mas facil posteriormente
	Definir i Como Real
	Definir  cifra Como Caracter
	Escribir 'Escribe, el numero '
	Leer cifra
	Escribir 'La suma de los digitos de ' cifra ' es ' sumaDigitos(cifra)
FinAlgoritmo
