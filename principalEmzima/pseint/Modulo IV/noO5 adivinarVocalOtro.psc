// Complementario 5
// En esta ocasi�n, repetir�s una de las actividades anteriores para comparar c�mo difiere el
// comportamiento del programa. Utiliza la estructura repetitiva hacer-mientras para resolver 
// esta actividad. Crea un programa que almacene una vocal secreta en una variable. Solicita 
// al usuario que intente adivinar la vocal secreta, permiti�ndole intentar tantas veces como
// sea necesario hasta que la adivine.  Recuerda nombrar y guardar tu algoritmo.



Algoritmo adivinarVocalOtro
	//Hacer Mientras Que  no opera aca
	Definir vocal,vocalSecreta Como Caracter
	vocalSecreta = "a"
	Repetir
		Escribir sin saltar "Escribe una vocal "
		Leer vocal
		//vocal = "a"
		//vocal = Minusculas(vocal)
	Mientras Que vocal <> vocalSecreta 
	Escribir "Ya encontraste la vocal, era la letra ", vocalSecreta
FinAlgoritmo
