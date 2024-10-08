// Complementario 5
//  Dise�a un procedimiento que reciba una frase y elimine todas las vocales repetidas. El procedimiento, en caso de encontrar una vocal repetida, mantendr� en la frase solamente la primera aparici�n y eliminar� las siguientes. Al final, el procedimiento mostrar� la frase resultante. Por ejemplo:
//
// Entrada: "Hab�a una vez un barco"  otra opcion "Antes que sea tarde, un d�a. Hab�a una vez un barco"
// Salida: "Habi un vez n brco" otra respuesta "Antes qu s trd, n d�. Hb� n vz n brc"
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
	fraseCambiada = ""
	ctdA = 0
	ctdE = 0
	ctdI = 0
	ctdO = 0
	ctdU = 0
	Para i <- 0 hasta Longitud(frase)-1 Hacer
		Segun Subcadena(frase,i,i) Hacer
			"a":
				ctdA = ctdA + 1
				fraseCambiada = fraseCambiada + cambio( ctdA,"a" )
			"A":
				ctdA = ctdA + 1
				fraseCambiada = fraseCambiada + cambio( ctdA,"A" )
			"e":
				ctdE = ctdE + 1
				fraseCambiada = fraseCambiada + cambio( ctdE,"e" )
			"E":
				ctdE = ctdE + 1
				fraseCambiada = fraseCambiada + cambio( ctdE,"E" )
			"i":
				ctdI = ctdI + 1
				fraseCambiada = fraseCambiada + cambio( ctdI,"i" )
			"I":
				ctdI = ctdI + 1
				fraseCambiada = fraseCambiada + cambio( ctdI,"I" )
			"o":
				ctdO = ctdO + 1
				fraseCambiada = fraseCambiada + cambio( ctdO,"o" )
			"O":
				ctdO = ctdO + 1
				fraseCambiada = fraseCambiada + cambio( ctdO,"O" )
			"u":
				ctdU = ctdU + 1
				fraseCambiada = fraseCambiada + cambio( ctdU,"u" )
			"U":
				ctdU = ctdU + 1
				fraseCambiada = fraseCambiada + cambio( ctdU,"U" )
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