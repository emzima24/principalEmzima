// Integrador IV (falta algo para darlo por terminado)
// Trabajando con una frase
// Diseña un algoritmo que permita al usuario ingresar una frase.  Deberás asegurarte 
// de que la longitud de la frase no exceda los 100 caracteres; en caso de superar este límite,
// se solicitará al usuario que vuelva a ingresar la frase hasta que cumpla con esta condición. 
// 
// Una vez ingresada la frase, el programa separará los caracteres en dos vectores: 
// uno  para almacenar exclusivamente las vocales (A-E-I-O-U) y otro para las 
// consonantes, así como para los caracteres especiales y los espacios. 
// 
// Los elementos en cada vector se acomodarán inicialmente por orden de aparición en 
// la frase. Además, se requiere la implementación de un subprograma que permita mostrar
// los vectores creados, así como el recuento total de elementos en cada uno de ellos.
// 
// Se usan del modulo VIII noO1 vectoresMenu.psc
// El diagrama de flujo se realizó como un mapa mental en Miro puede verse en https://miro.com/app/board/uXjVLdm-dIU=/?share_link_id=662231495089
// Una explicacion de la forma de como avanzar en la siguiente tabla https://docs.google.com/spreadsheets/d/1XZUC2BzjYaTDcOBipbDeZIlfXTtfCCvNFRDJzELJEUg/edit?gid=236092997#gid=236092997&range=B2:AB12
//A los efectos del codigo se consideraron vocales a las acentuadas o con dieresis
// Frase de 101 caracteres "Yo disculpar que le perdone. No por haberme abandonado lo cual es en esencia falso. Le agradezco todo" vocales 39
// Frase de 99 caracteres "El rara avis que fui siempre se sintió un tanto pérdido en esa familia pero quizás era parte de mi." vocales 41
// Frase de 99 caracteres "Hasta donde percibo llegamos a la etapa del sálvese quien pueda. No soy sociólogo pero la formación!" vocales 41


SubProceso controlLongitud (valUno Por Referencia)
	Definir mensaje Como Caracter
	Definir count,i Como Real
	mensaje = ""
	count = 0
	Repetir
		Si count > 0 Entonces
			mensaje = ", che boludo en serio MAS DE 1 MENOS DE 100 dale!!!"
			Escribir ""
		FinSi
		Escribir "Introduce frase con 1 hasta 100 caracteres" + mensaje
		Leer valUno
		count = count +1
	Mientras Que Longitud(valUno) > 100 O Longitud(valUno) < 1 
FinSubProceso

Funcion mostrarVector( vector, tamanho,letter )
	Definir i Como Real
	Escribir Sin Saltar"El arreglo (" letter ") es "
	Para i <- 0 Hasta tamanho-1 Hacer
		Escribir Sin Saltar vector[i] ", "
	FinPara
	Escribir ""
Fin Funcion

SubProceso  llenarArreglo(tamanhoA por Referencia, tamanhoB por Referencia,  vectorA Por Referencia, vectorB Por Referencia, valores Por Valor, valUno Por Referencia )
	Definir i Como Entero
	Definir valDos Como Caracter
	Definir isExpres1,isExpres2,isExpres3 Como Logico
	Si valores = " " Entonces
		Para i <- 0 Hasta tamanhoA -1 Hacer
			vectorA[i] = " "
		FinPara
		Para i <- 0 Hasta tamanhoB -1 Hacer
			vectorB[i] = " "
		FinPara
	SiNo
		tamanhoA = 0
		tamanhoB = 0
		controlLongitud(valUno)
		valDos = Minusculas(valUno)
		Para i <- 0 Hasta Longitud(valUno) -1 Hacer
			isExpres1 <- Subcadena(valDos,i,i) = "a" O Subcadena(valDos,i,i) = "e" O Subcadena(valDos,i,i) = "i" O Subcadena(valDos,i,i) = "o" O Subcadena(valDos,i,i) = "u"
			isExpres2 <- Subcadena(valDos,i,i) = "á" O Subcadena(valDos,i,i) = "é" O Subcadena(valDos,i,i) = "í" O Subcadena(valDos,i,i) = "ó" O Subcadena(valDos,i,i) = "ú"
			isExpres3 <- Subcadena(valDos,i,i) = "ü"
			Si isExpres1 O isExpres2 O isExpres3 Entonces
				vectorA[tamanhoA] = Subcadena(valUno,i,i)
				tamanhoA = tamanhoA + 1
			SiNO
				vectorB[tamanhoB] = Subcadena(valUno,i,i)
				tamanhoB = tamanhoB + 1
			FinSi
		FinPara
	FinSi
FinSubProceso


Algoritmo trabajandoFrase
	// Se define real porque es menos probable que se rompa en ejecucion en el ingreso de la variable y se mantiene para otros de los casos por economia de codigo
	Definir letter, vectorA,vectorB,vectorC,type, frase  Como Caracter
	Definir tamanho,tamanhoA,tamanhoB Como Real
	tamanho = 100
	Dimension vectorA[tamanho]
	Dimension vectorB[tamanho]
	Dimension vectorC[tamanho]
	
	llenarArreglo(tamanho,tamanho,vectorA,vectorB, " ", frase)
	type = "frase"
	
	llenarArreglo(tamanhoA,tamanhoB,vectorA,vectorB, type,frase)
	Limpiar Pantalla
	Escribir "**************"
	Escribir "Crear vectores"
	Escribir "**************"
	Escribir ""
//	Esperar Tecla
	Escribir "La frase " 
	Escribir "(" frase ")"
	Escribir ""
	Si tamanhoA = 0 Entonces
		Escribir "No hay ninguna vocal"
	SiNo
		Escribir "Para " tamanhoA " Vocales en total "
		mostrarVector( vectorA, tamanhoA,"Vocales" )
	FinSi
	Escribir ""
	Si tamanhoB = 0 Entonces
		Escribir "No hay ninguna consonante"
	SiNo
		Escribir "Para " tamanhoB " Consonantes y otros en total "
		mostrarVector( vectorB, tamanhoB,"Consonantes" )
	FinSi

FinAlgoritmo



