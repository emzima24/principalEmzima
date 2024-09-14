// Actividad 4
// Escribe un programa para obtener el grado de eficiencia de un operario de una fábrica de tornillos, 
// de acuerdo a las siguientes dos condiciones que se le imponen para un período de prueba:
//
// Producir menos de 200 tornillos defectuosos.
//
// Producir más de 10000 tornillos sin defectos.
//
// El grado de eficiencia se determina de la siguiente manera:
//	
// GRADO 5: Si no cumple ninguna de las condiciones.
//		
// GRADO 6: Si sólo cumple la primera condición
//			
// GRADO 7: Si sólo cumple la segunda condición.
//				
// GRADO 8: Si cumple las dos condiciones.
//					
// Muestra un mensaje acorde al grado de eficiencia de un operario, luego de evaluar las condiciones.  Recuerda nombrar y guardar tu algoritmo.



Algoritmo GradoEficiencia
	// Se define real porque es menos probable que se rompa en ejecucion en el ingreso de los tornillos
	Definir tornillosDefecutosos, tornillosSinDefectos Como Real

	Escribir sin saltar "Escribe la cantidad de tornillos defectuosos "
	//Leer tornillosDefecutosos
	tornillosDefecutosos =201
	Escribir sin saltar "Escribe la cantidad de tornillos sin defectos "
	//Leer tornillosSinDefectos
	tornillosSinDefectos = 1000
	Si (tornillosDefecutosos >= 200) Y (tornillosSinDefectos <= 10000) Entonces
		Escribir sin saltar "Está todo mal sos GRADO 5"
	SiNo
		Si (tornillosDefecutosos < 200) Y (tornillosSinDefectos > 10000) Entonces
			Escribir sin saltar "Está todo bien sos GRADO 8"
		SiNo
			Si (tornillosDefecutosos >= 200) Y (tornillosSinDefectos > 10000) Entonces
				Escribir sin saltar "Está bien la cantidad sin defectos. está mal la cantidad con defectos sos GRADO 7"
			SiNo
				Escribir sin saltar "Está mal la cantidad sin defectos, está bien la cantidad con defectos sos GRADO 6"
			Fin Si	
		FinSi
	FinSi
	
FinAlgoritmo


