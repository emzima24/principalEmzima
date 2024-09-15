// Actividad 4
// Escribe un programa que procese una secuencia de caracteres ingresada por teclado y 
// terminada en punto, y luego codifique la palabra o frase ingresada de la siguiente 
// manera: cada vocal se reemplaza por un carácter según la tabla:
//
//a -> @
//e -> #
//i -> $
//o -> %
//u -> *
//
// Realiza un subprograma que reciba una secuencia de caracteres y retorne la codificación 
// correspondiente, utilizando la estructura "según" para la transformación. Por ejemplo, 
// si el usuario ingresa: "Ayer, lunes, salimos a las once y 10.", la salida del programa 
// debería ser: "@y#r, l*n#s, s@l$m%s @ l@s %nc# y 10." Considera repasar el uso de la función 
// concatenar de PSeInt para armar la palabra/frase. Recuerda nombrar y guardar tu algoritmo.



SubProceso codificacion ( frase Por Valor,fraseCodificada Por Referencia )
	// Se define real por costumbre mas que por otra razon cuando la memoria importe lo consideraremos distinto
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
				fraseCodificada = fraseCodificada + Subcadena(fraseNormalizada,i,i)
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