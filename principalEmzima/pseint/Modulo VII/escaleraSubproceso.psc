//Funcion escaleraNum <- escalera ( num )
//	
//Fin Funcion
//SubProceso <NOMBRE>( <ARGUMENTOS>)
//	<SENTENCIAS<
//FinSubProceso

SubProceso escalera( num Por Valor)
	Definir i Como Real
	Definir figura Como Caracter
	figura = ""
	Si num = 0 Entonces
		Escribir "Con 0 no hay escaleras"
	SiNo
		Para i <- 1 Hasta num Hacer
			figura = figura + ConvertirATexto(i)
			Escribir figura
		FinPara
	FinSi
FinSubProceso

Algoritmo escaleraSubproceso
	Definir num Como Real
	Escribir "Escribe el numero "
	//Leer num
	num = 0
	escalera(num)
FinAlgoritmo
