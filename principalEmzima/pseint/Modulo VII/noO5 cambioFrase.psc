// Complementario 5
//  Diseña un procedimiento que reciba una frase y elimine todas las vocales repetidas. El procedimiento, en caso de encontrar una vocal repetida, mantendrá en la frase solamente la primera aparición y eliminará las siguientes. Al final, el procedimiento mostrará la frase resultante. Por ejemplo:
//
// Entrada: "Había una vez un barco"
// Salida: "Habi un vez n brco"
//	
// Las vocales repetidas se marcan solo para explicar la consigna. 
// Las vocales e, i y o, este caso, se conservan al no estar repetidas.



Funcion cambioResultado <- cambio ( ctd,letra )
	Definir cambioResultado Como Caracter
	Si ctd > 1 Entonces
		cambioResultado = "" 
	SiNo
		cambioResultado = letra 
	FinSi
Fin Funcion

SubProceso codificacion ( frase Por Valor,fraseCambiada Por Referencia )
	// Se define real por costumbre mas que por otra razon cuando la memoria importe lo consideraremos distinto
	Definir i,ctdA,ctdE,ctdI,ctdO,ctdU Como Real
	Definir fraseNormalizada Como Caracter
	fraseNormalizada = Minusculas(frase)
	fraseCambiada = ""
	ctdA = 0
	ctdE = 0
	ctdI = 0
	ctdO = 0
	ctdU = 0
	Para i <- 0 hasta Longitud(frase)-1 Hacer
		Segun Subcadena(fraseNormalizada,i,i) Hacer
			"a":
				ctdA = ctdA + 1
				fraseCambiada = fraseCambiada + cambio( ctdA,"a" )
			"e":
				ctdE = ctdE + 1
				fraseCambiada = fraseCambiada + cambio( ctdE,"e" )
			"i":
				ctdI = ctdI + 1
				fraseCambiada = fraseCambiada + cambio( ctdI,"i" )
			"o":
				ctdO = ctdO + 1
				fraseCambiada = fraseCambiada + cambio( ctdO,"o" )
			"u":
				ctdU = ctdU + 1
				fraseCambiada = fraseCambiada + cambio( ctdU,"u" )
			De Otro Modo:
				fraseCambiada = fraseCambiada + Subcadena(frase,i,i)
		FinSegun
		
	FinPara
FinSubProceso

Algoritmo cambioFrase
	Definir frase,fraseCambiada Como Caracter
	Escribir "Escribe la frase "
	Leer frase
	codificacion(frase,fraseCambiada)
	Escribir "Con la frase (" frase ") se codifica (" fraseCambiada ")"
	//Habi un vez n brco
	//Habi un vez n brco
	//Prueba de varias letras si subo las manos miercoles
	//Prueba d_ v_ri_s l_tr_s s_ s_bo l_s m_n_s m__rc_l_s
	//Prueba d vris ltrs s sbo ls mns mrcls
FinAlgoritmo