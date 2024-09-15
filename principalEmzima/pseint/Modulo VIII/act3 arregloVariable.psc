// Actividad 3
// Desarrolla un programa que defina un vector de tamaño n, que almacene números,
// determinando por el usuario el tamaño que tendrá dicho arreglo. Este tamaño debe
// ser solicitado al usuario por teclado, y almacenado en una variable para dicho fin. 
//
// Haciendo uso de la variable creada para ese fin, dimensionar el arreglo, 
// y llenar cada una de sus posiciones con valores aleatorios entre 1 y 25. 
//	
// Luego, se solicitará al usuario que ingrese un número para buscar dentro del arreglo. 
// El programa buscará el elemento dentro del arreglo y mostrará la posición donde se encuentra.
//		
// Si el número se encuentra dentro del arreglo, se imprimirán todas las posiciones 
// donde se encuentra ese valor, en caso de que estuviera repetido.
//			
// Si el número a buscar no está dentro del arreglo, se mostrará un mensaje indicándolo.



Funcion mostrarVector( number, tamanho )
	Definir i Como Real
	Escribir Sin Saltar"El arreglo es "
	Para i <- 0 Hasta tamanho-1 Hacer
		Escribir Sin Saltar number[i] ", "
	FinPara
	Escribir ""
Fin Funcion

Algoritmo arregloVariable
	// Se define real porque es menos probable que se rompa en ejecucion en el ingreso de la variable y se mantiene para todos los casos por economia de codigo
	Definir number,i,numberIncog,tamanho,count Como Entero
	Escribir Sin Saltar "Tamaño del arreglo "
	Leer tamanho
	Dimension number[tamanho]
	count = 0
	Para i <- 0 Hasta tamanho- 1 Hacer
		//Escribir Sin Saltar"Valor " i
		//Leer number[i]
		number[i] = Aleatorio(1,25)
		//Escribir i +1
	FinPara
	Escribir ""
	Escribir Sin Saltar "Indique un numero para probar "
	Leer numberIncog
	Para i <- 0 Hasta tamanho-1 Hacer
		Si numberIncog = number[i] Entonces
			count = count + 1
			Escribir "Posicion " i " vez " count
		FinSi
	FinPara
	Si count = 0 Entonces
		Escribir "No estaba en el arreglo"
	FinSi
	mostrarVector( number, tamanho )
FinAlgoritmo