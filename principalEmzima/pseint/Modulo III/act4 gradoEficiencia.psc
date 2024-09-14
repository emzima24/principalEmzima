// Actividad 4
// Escribe un programa para obtener el grado de eficiencia de un operario de una f�brica de tornillos, 
// de acuerdo a las siguientes dos condiciones que se le imponen para un per�odo de prueba:
//
// Producir menos de 200 tornillos defectuosos.
//
// Producir m�s de 10000 tornillos sin defectos.
//
// El grado de eficiencia se determina de la siguiente manera:
//	
// GRADO 5: Si no cumple ninguna de las condiciones.
//		
// GRADO 6: Si s�lo cumple la primera condici�n
//			
// GRADO 7: Si s�lo cumple la segunda condici�n.
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
		Escribir sin saltar "Est� todo mal sos GRADO 5"
	SiNo
		Si (tornillosDefecutosos < 200) Y (tornillosSinDefectos > 10000) Entonces
			Escribir sin saltar "Est� todo bien sos GRADO 8"
		SiNo
			Si (tornillosDefecutosos >= 200) Y (tornillosSinDefectos > 10000) Entonces
				Escribir sin saltar "Est� bien la cantidad sin defectos. est� mal la cantidad con defectos sos GRADO 7"
			SiNo
				Escribir sin saltar "Est� mal la cantidad sin defectos, est� bien la cantidad con defectos sos GRADO 6"
			Fin Si	
		FinSi
	FinSi
	
FinAlgoritmo


