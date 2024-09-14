// Actividad 4
// Escribe un programa que calcule cuántos litros de combustible consumió un automóvil. 
// El usuario ingresará una cantidad de litros de combustible cargados en la estación 
// y una cantidad de kilómetros recorridos, después, el programa calculará el consumo (km/lt) 
// y se lo mostrará al usuario. Recuerda nombrar y guardar tu algoritmo.
	
	
	
Algoritmo consumoAutomovil
	// como la distancia y el volumen puede tener decimales entonces se toma real para todo
	Definir volumen, distancia,consumo Como Real
	Escribir "Indica el volumen de combustible cargado (en L)"
	Leer volumen
	Escribir "Indica la distancia recorrida (en Km)"
	Leer distancia
	consumo = distancia/volumen
	Escribir "El consumo para estas condiciones es ", consumo," Km/L"
FinAlgoritmo
