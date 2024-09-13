Algoritmo edadCategoria
	Definir edad Como Real
	Definir categoria,seleccion Como Caracter
	Escribir sin saltar "Escribe la edad "
	//Leer edad
	edad = 65
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
