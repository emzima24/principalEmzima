// Complementario 8
// Escribe un programa que solicite al usuario su edad y determine su categor�a: ni�o, adolescente, adulto o adulto mayor, seg�n los siguientes rangos:
//
// Ni�o: menor de 13 a�os. Si el usuario es ni�o, preg�ntale si le gusta hacer deportes o jugar a los videojuegos.
//			
// Adolescente: entre 13 y 17 a�os
//			
// Adulto: entre 18 y 64 a�os. Si el usuario es adulto, preg�ntale si es estudiante o trabajador.
//				
// Adulto mayor: 65 a�os o m�s.



Algoritmo edadCategoria
	// Se define real porque es menos probable que se rompa en ejecucion en el ingreso de la edad
	Definir edad Como Real
	Definir categoria,seleccion Como Caracter
	Escribir sin saltar "Escribe la edad "
	Leer edad
//	edad = 65
	Si edad < 13 Entonces
		Escribir sin saltar "Escribe la inicial de la opci�n que te gusta  A) hacer deportes B) jugar videojuegos"
		Leer seleccion
		seleccion = Mayusculas(seleccion)
		Si seleccion = "A" Entonces
			Escribir "Categoria ni�o, y le gusta hacer deportes" 
		SiNo
			Escribir "Categoria ni�o, y le gusta jugar videosjuegos"
		Fin Si
	Fin Si
	Si (edad >= 13) Y (edad <= 17) Entonces
		Escribir "Categoria adolescentes" 
	Fin Si
	Si (edad >= 18) Y (edad <= 64) Entonces
		Escribir sin saltar "Escribe la inicial de la opci�n de tu situacion actual A) Estudiante B) Trabajador"
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
