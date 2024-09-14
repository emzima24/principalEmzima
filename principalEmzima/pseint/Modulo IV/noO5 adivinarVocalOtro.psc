// Complementario 5
// En esta ocasión, repetirás una de las actividades anteriores para comparar cómo difiere el
// comportamiento del programa. Utiliza la estructura repetitiva hacer-mientras para resolver 
// esta actividad. Crea un programa que almacene una vocal secreta en una variable. Solicita 
// al usuario que intente adivinar la vocal secreta, permitiéndole intentar tantas veces como
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
