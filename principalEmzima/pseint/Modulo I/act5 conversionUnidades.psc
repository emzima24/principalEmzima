// Actividad 3
// A partir de una conocida cantidad de metros que el usuario ingresa a trav�s del teclado se debe obtener su equivalente en cent�metros, en mil�metros y en pulgadas.
//
// Equivalencias: 
//	
// 1 metro equivale a 100 cent�metros.
//	
// 1 metro equivale a 1000 mil�metros.
//	
// 1 pulgada equivale a 2.54 cent�metros.
//	
// Recuerda nombrar y guardar tu algoritmo.

	
	
Algoritmo conversionUnidades
	// como la distancia medida puede tener decimales entonces se toma real para todo
	Definir medida, enCentimetros, enMilimetros, enPulgadas Como Real
	Escribir "Cuanto vale la medida en metros"
	Leer medida
	enCentimetros = medida *100
	enMilimetros = medida *1000
	enPulgadas = medida *100/2.54
	Escribir "La medida ",medida," en metros es equivalente a ",enCentimetros, " cm"
	Escribir "La medida ",medida," en metros es equivalente a ",enMilimetros, " mm"
	Escribir "La medida ",medida," en metros es equivalente a ",enPulgadas, " in"
FinAlgoritmo
