Algoritmo GradoEficiencia
	//Definir operacionSeleccion Como Caracter
	Definir tornillosDefecutosos, tornillosSinDefectos Como Real
	//Escribir sin saltar "Escribe la inicial de una de las operaciones (S)uma, (R)esta, (M)ultiplicación y (D)ivisión que desees que se ejecute "
	//Leer operacionSeleccion
	//operacionSeleccion = Mayusculas(operacionSeleccion)
	Escribir sin saltar "Escribe la cantidad de tornillos defectuosos "
	Leer tornillosDefecutosos
	//tornillosDefecutosos =199
	Escribir sin saltar "Escribe la cantidad de tornillos sin defectos "
	Leer tornillosSinDefectos
	//tornillosSinDefectos = 10001
	Si (tornillosDefecutosos >= 200) Y (tornillosSinDefectos<= 10000) Entonces
		Escribir sin saltar "Esta todo mal sos GRADO 5"
	Fin Si
	Si (tornillosDefecutosos >= 200) Y (tornillosSinDefectos > 10000) Entonces
		Escribir sin saltar "esta bien la cantidad sin defectos esta mal la cantidad con defectos sos GRADO 7"
	Fin Si
	Si (tornillosDefecutosos < 200) Y (tornillosSinDefectos <= 10000) Entonces
		Escribir sin saltar "esta mal la cantidad sin defectos esta bien la cantidad con defectos sos GRADO 6"
	Fin Si	
	Si (tornillosDefecutosos < 200) Y (tornillosSinDefectos > 10000) Entonces
		Escribir sin saltar "esta todo bien sos GRADO 8"
	Fin Si
FinAlgoritmo


