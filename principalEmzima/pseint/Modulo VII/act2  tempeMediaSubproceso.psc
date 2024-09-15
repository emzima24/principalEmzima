// Actividad 2
// Crea un procedimiento que calcule la temperatura media de un día a partir de la temperatura máxima 
// y mínima. Luego, desarrolla un programa principal que, utilizando este procedimiento, solicite 
// la temperatura máxima y mínima de n días y muestre la media de cada día. El programa pedirá al 
// usuario el número de días a introducir. Recuerda nombrar y guardar tu algoritmo.



SubProceso media( cantidadDias Por valor, dia Por Referencia, tempMinima Por Referencia,tempMaxima Por Referencia, tempMedia Por Referencia )
	Definir temp Como Real
	Escribir "Escribe la temperatura mínima "
	Leer tempMinima
	Escribir "Escribe la temperatura máxima "
	Leer tempMaxima
	tempMedia = (tempMinima + tempMaxima)/2
FinSubProceso

Algoritmo tempeMediaSubproceso
	// Se define real porque es menos probable que se rompa en ejecucion en el ingreso de la variable y se mantiene para todos los casos por economia de codigo
	Definir cantidadDias,dia, tempMinima,tempMaxima, tempMedia Como Real
	Escribir "Escribe la cantidad de dias "
	Leer cantidadDias
	Para dia = 1 Hasta cantidadDias Hacer
		media(cantidadDias, dia, tempMinima,tempMaxima,tempMedia)
		Escribir "Para la temperatura mínima de " tempMinima "°C y máxima de " tempMaxima "°C. La media es de " tempMedia "°C, el dia " dia
	FinPara
FinAlgoritmo