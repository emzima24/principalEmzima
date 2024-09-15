// Actividad 4
// Diseña una función que reciba una frase y una letra proporcionadas por el usuario y devuelva 
// la cantidad de veces que la letra aparece en la frase. Recuerda nombrar y guardar tu algoritmo.



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
	// Se define real por costumbre mas que por otra razon cuando la memoria importe lo consideraremos distinto
	Definir frase,letra Como Caracter
	Definir qtyLetrasFrase Como Real
	Escribir "introduce una frase "
	Leer frase
	Escribir "introduce una letra "
	Leer letra
	
	qtyLetrasFrase = letrasFrase ( frase,letra )
	Escribir "La frase (" frase ") tiene " qtyLetrasFrase " letras " letra 
FinAlgoritmo
