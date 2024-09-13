SubProceso entreMyT( letra Por Valor, isTodoOk Por Referencia )
	Definir letraNormalizada Como Caracter
	letraNormalizada = Minusculas(letra)
	isTodoOk = Falso
	Si (letraNormalizada >= "m") Y (letraNormalizada <= "t") Entonces
		isTodoOk = Verdadero
	FinSi
FinSubProceso

Algoritmo entreMyTsubproceso
	Definir letra Como Caracter
	Definir isTodoOk Como Logica
	Escribir "Escribe una letra "
	//Leer letra
	letra = "u"
	entreMyT(letra,isTodoOk)
	Si isTodoOk Entonces
		Escribir "La letra (" letra ") se encuentra entre la M y la T"
	SiNo
		Escribir "La letra (" letra ") NO se encuentra entre la M y la T"
	FinSi
FinAlgoritmo