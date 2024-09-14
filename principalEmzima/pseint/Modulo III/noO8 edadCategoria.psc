// Complementario 8
// Escribe un programa que solicite al usuario su edad y determine su categoría: niño, adolescente, adulto o adulto mayor, según los siguientes rangos:
//
// Niño: menor de 13 años. Si el usuario es niño, pregúntale si le gusta hacer deportes o jugar a los videojuegos.
//			
// Adolescente: entre 13 y 17 años
//			
// Adulto: entre 18 y 64 años. Si el usuario es adulto, pregúntale si es estudiante o trabajador.
//				
// Adulto mayor: 65 años o más.



Algoritmo edadCategoria
	// Se define real porque es menos probable que se rompa en ejecucion en el ingreso de la edad
	Definir edad Como Real
	Definir categoria,seleccion Como Caracter
	Escribir sin saltar "Escribe la edad "
	Leer edad
//	edad = 65
	Si edad < 13 Entonces
		Escribir sin saltar "Escribe la inicial de la opción que te gusta  A) hacer deportes B) jugar videojuegos"
		Leer seleccion
		seleccion = Mayusculas(seleccion)
		Si seleccion = "A" Entonces
			Escribir "Categoria niño, y le gusta hacer deportes" 
		SiNo
			Escribir "Categoria niño, y le gusta jugar videosjuegos"
		Fin Si
	Fin Si
	Si (edad >= 13) Y (edad <= 17) Entonces
		Escribir "Categoria adolescentes" 
	Fin Si
	Si (edad >= 18) Y (edad <= 64) Entonces
		Escribir sin saltar "Escribe la inicial de la opción de tu situacion actual A) Estudiante B) Trabajador"
		Leer seleccion
		seleccion = Mayusculas(seleccion)
		Si seleccion = "A" Entonces
			Escribir "Categoria adulto, y es Estudiante" 
		SiNo
			Escribir "Categoria adulto, y es Trabajador"
		Fin Si
	Fin Si	
	Si edad > 64 Entonces
		Escribir "Categoria adulto mayor"
	Fin Si
FinAlgoritmo
