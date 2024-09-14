// Actividad 3
// A partir de una conocida cantidad de metros que el usuario ingresa a través del teclado se debe obtener su equivalente en centímetros, en milímetros y en pulgadas.
//
// Equivalencias: 
//	
// 1 metro equivale a 100 centímetros.
//	
// 1 metro equivale a 1000 milímetros.
//	
// 1 pulgada equivale a 2.54 centímetros.
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
