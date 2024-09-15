// Actividad 1
// 
// Se define real porque es menos probable que se rompa en ejecucion en el ingreso de la variable
// Se define real porque es menos probable que se rompa en ejecucion en el ingreso de la variable y se mantiene para todos los casos por economia de codigo
// Se define real por costumbre mas que por otra razon cuando la memoria importe lo consideraremos distinto



SubProceso codificacion ( frase Por Valor,fraseCodificada Por Referencia )
	Definir i Como Real
	Definir fraseNormalizada Como Caracter
	fraseNormalizada = Minusculas(frase)
	fraseCodificada = ""
	Para i <- 0 hasta Longitud(frase)-1 Hacer
		Segun Subcadena(fraseNormalizada,i,i) Hacer
			"a":
				fraseCodificada = fraseCodificada + "@"
			"e":	
				fraseCodificada = fraseCodificada + "#"
			"i":
				fraseCodificada = fraseCodificada + "$"
			"o":
				fraseCodificada = fraseCodificada + "%"
			"u":
				fraseCodificada = fraseCodificada + "*"
			De Otro Modo:
				fraseCodificada = fraseCodificada + Subcadena(frase,i,i)
		FinSegun
		
	FinPara
FinSubProceso

Algoritmo codificarFrase
	Definir frase,fraseCodificada Como Caracter
	Escribir "Escribe la frase "
	Leer frase
	codificacion(frase,fraseCodificada)
	Escribir "Con la frase (" frase ") se codifica (" fraseCodificada ")"
	//@y#r, l*n#s, s@l$m%s @ l@s %nc# y 10.
	//@y#r, l*n#s, s@l$m%s @ l@s %nc# y 10.
FinAlgoritmo