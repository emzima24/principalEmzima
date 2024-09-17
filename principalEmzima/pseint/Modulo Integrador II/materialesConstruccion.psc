// Integrador II
// Calculadora de materiales de construcción
//
// Deberán programar una calculadora de materiales para la construcción.  El algoritmo principal 
// solo debe llamar al subprograma "menu()". Cada subprograma puede subdividirse, 
// si es necesario, en otros subprogramas, según la creatividad del programador.
//		
//	El menú principal debe presentarse de la siguiente manera:
//		
//		1. Calcular muro de ladrillo
//		2. Calcular viga de hormigón
//		3. Calcular columnas de hormigón
//		4. Calcular contrapisos
//		5. Calcular techo
//		6. Calcular pisos
//		7. Calcular pintura
//		8. Calcular iluminación
//		9. Salir  (Hasta que el usuario no elija esta opción, después de calcular algún material, el programa debe regresar al menú principal)
//		
//	Subprogramas sugeridos: 
//		
//		1. calcularSuperficie y calcularVolumen: Ambos se utilizarán dentro de los otros subprogramas. El usuario no podrá acceder a ellos.
//		
//		2. calcularMuro: Este subprograma solicitará al usuario seleccionar si el muro tendrá un espesor de 20 o 30 cm. 
//						Luego, se pedirá el largo y el alto. Con estos datos, se mostrará al usuario la superficie del muro 
//						y la cantidad de materiales necesarios para su construcción. Si el muro tiene 30 cm de espesor, 
// 						se necesitarán 15.2 kg de cemento, 0.115 m3 de arena y 120 ladrillos por metro cuadrado. 
// 						Si es de 20 cm, se necesitarán 10.9 kg de cemento, 0.09 m3 de arena y 90 ladrillos por metro cuadrado. Mostrar el resultado por pantalla.
//					
//		3. calcularViga: Este subprograma pedirá al usuario ingresar el largo de la viga. Se calcularán los materiales 
// 						necesarios para una viga de 1 metro lineal, incluyendo 9 kg de cemento, 0.02 m3 de arena, 0.02 m2 de piedra,
//						4 m de hierro del 8 y 3 m de hierro del 4. Mostrar el resultado por pantalla.
//						
//		4. calcularColumna: Se solicitará al usuario ingresar el largo de la columna. Se calcularán los materiales 
// 						necesarios para una columna de 1 metro lineal, incluyendo 7.5 kg de cemento, 0.016 m3 de arena,
//						0.016 m2 de piedra, 6 m de hierro del 10 y 3 m de hierro del 4. Mostrar el resultado por pantalla.
//							
//		5. calcularContrapisos: Se pedirá al usuario ingresar el espesor, ancho y largo del contrapiso. Se calcularán
//						los materiales necesarios por metro cúbico, incluyendo 105 kg de cemento, 0.45 m3 de 
//						arena y 0.9 m3 de piedra. Mostrar el resultado por pantalla.
//							
//		6. calcularTecho: Se solicitará al usuario ingresar el espesor, ancho y largo del techo. Se calcularán 
//						los materiales necesarios por metro cuadrado, incluyendo 33 kg de cemento, 0.072 m3 de arena, 
//						0.072 m3 de piedra, 7 m de hierro del 8 y 4 m de hierro del 6. Mostrar el resultado por pantalla.
//							
//		7. calcularPisos: Se pedirá al usuario ingresar el ancho y largo del paño de piso. Se calculará la 
//						superficie y se añadirá un 10% extra por recortes. El resultado se mostrará en 
//						metros cuadrados. Mostrar el resultado por pantalla.
//							
//		8. calcularPintura: Se solicitará al usuario ingresar la superficie del muro. Se calculará la cantidad 
//						de pintura necesaria, considerando que rinde 6 m2 por litro. Mostrar el resultado por pantalla.
//							
//		9. calcularIluminacion: Se pedirá al usuario ingresar la superficie de la habitación. La iluminación se 
//						calculará multiplicando la superficie por 0.20. Se mostrará el resultado correspondiente 
//						a la cantidad mínima de superficie para la iluminación natural, 
//						como ventanas y puertas de vidrio. Mostrar el resultado por pantalla.
//								
// Si lo desean, pueden incorporar alguna otra funcionalidad o validación que consideren que optimizará el 
// funcionamiento de su sistema. A su vez, les recomendamos dividir las tareas dentro del equipo. 

// El diagrama de flujo se realizó como un mapa mental en Miro puede verse en https://miro.com/app/board/uXjVKhYx8qs=/?share_link_id=21575831806



SubProceso  menu
	Definir choice Como Caracter
	// Se define real porque es menos probable que se rompa en ejecucion en el ingreso de la variable y se mantiene para todos los casos por economia de codigo
	// las selecciones se definen como caracter como mecanismo mas general para evitar la ruptura de codigo
	Definir acumCemento, acumArena, acumLadrillos, acumPiedras, acumHierro8, acumHierro4, acumHierro10, acumPiedrasVol, acumHierro6, acumPintura, acumIluminacion Como Real
	//Definir a, b, c Como Real
	Definir salir Como Logico
	salir = Falso
	acumCemento = 0
	acumArena = 0
	acumLadrillos = 0
	acumPiedras = 0
	acumHierro8 = 0
	acumHierro4 = 0
	acumHierro10 = 0
	acumPiedrasVol = 0
	acumHierro6 = 0
	acumPintura = 0
	acumIluminacion = 0 
	Repetir
		Limpiar Pantalla
		Escribir "Opciones "
		Escribir "1- Calcular muro de ladrillo"
		Escribir "2- Calcular viga de hormigón"
		Escribir "3- Calcular columnas de hormigón"
		Escribir "4- Calcular contrapisos"
		Escribir "5- Calcular techo"
		Escribir "6- Calcular pisos"
		Escribir "7- Calcular pintura"
		Escribir "8- Calcular iluminación"
		Escribir "9- Mostrar lo acumulado en materiales "
		Escribir "10- Salir"
		Escribir sin saltar "Selecciona alguna de las opciones anteriores "
		Leer choice
		Segun choice Hacer
			"1":
				calcularMuro(acumCemento, acumArena, acumLadrillos, acumPiedras, acumHierro8, acumHierro4, acumHierro10, acumPiedrasVol, acumHierro6, acumPintura, acumIluminacion)
			"2":
				calcularViga(acumCemento, acumArena, acumLadrillos, acumPiedras, acumHierro8, acumHierro4, acumHierro10, acumPiedrasVol, acumHierro6, acumPintura, acumIluminacion)
			"3":
				calcularColumna(acumCemento, acumArena, acumLadrillos, acumPiedras, acumHierro8, acumHierro4, acumHierro10, acumPiedrasVol, acumHierro6, acumPintura, acumIluminacion)
			"4":
				calcularContrapisos(acumCemento, acumArena, acumLadrillos, acumPiedras, acumHierro8, acumHierro4, acumHierro10, acumPiedrasVol, acumHierro6, acumPintura, acumIluminacion)
			"5":
				calcularTecho(acumCemento, acumArena, acumLadrillos, acumPiedras, acumHierro8, acumHierro4, acumHierro10, acumPiedrasVol, acumHierro6, acumPintura, acumIluminacion)
			"6":
				calcularPisos
			"7":
				calcularPintura(acumCemento, acumArena, acumLadrillos, acumPiedras, acumHierro8, acumHierro4, acumHierro10, acumPiedrasVol, acumHierro6, acumPintura, acumIluminacion)
			"8":
				calcularIluminacion(acumCemento, acumArena, acumLadrillos, acumPiedras, acumHierro8, acumHierro4, acumHierro10, acumPiedrasVol, acumHierro6, acumPintura, acumIluminacion)
			"9":
				mostrarAcumulado(acumCemento, acumArena, acumLadrillos, acumPiedras, acumHierro8, acumHierro4, acumHierro10, acumPiedrasVol, acumHierro6, acumPintura, acumIluminacion)
			"10":
				salir = Verdadero
				Escribir 'Hasta la vista baby'
			De Otro Modo:
				Escribir "del 1 al 9 boludo"
		Fin Segun
		Si choice <> "9"
			Escribir 'Presione enter para volver al menu principal'
		SiNo
			Escribir 'Presione enter para salir'
		FinSi
		Esperar Tecla	
	Mientras Que salir = Falso
	
FinSubProceso

SubProceso  calcularSuperficie (a Por Valor, b Por Valor, superficie Por Referencia)
	superficie = a * b
FinSubProceso

SubProceso  calcularVolumen (a por Valor , b Por Valor, c Por Valor, volumen Por Referencia)
	volumen = a * b * c
FinSubProceso

SubProceso  calcularMuro(acumCemento Por Referencia, acumArena Por Referencia, acumLadrillos Por Referencia, acumPiedras Por Referencia, acumHierro8 Por Referencia, acumHierro4 Por Referencia, acumHierro10 Por Referencia, acumPiedrasVol Por Referencia, acumHierro6 Por Referencia, acumPintura Por Referencia, acumIluminacion Por Referencia)
	Limpiar Pantalla
	Definir choiceDos Como Caracter
	Escribir "**********************"
	Escribir "MODULO CALCULO DE MURO"
	Escribir "**********************"
	Escribir "Opciones "
	Escribir "1- Muro de 20 cm"
	Escribir "2- Muro de 30 cm"
	Escribir sin saltar "Selecciona alguna de las opciones anteriores "
	Leer choiceDos
	Mientras (choiceDos <> "1") Y (choiceDos <> "2") Hacer
		Escribir sin saltar "Por favor, Selecciona 1 o 2 "
		Leer choiceDos
	FinMientras
	
	Segun choiceDos Hacer
		"1":
			materialesMuro(10.9,0.09,90,acumCemento, acumArena, acumLadrillos, acumPiedras, acumHierro8, acumHierro4, acumHierro10, acumPiedrasVol, acumHierro6, acumPintura, acumIluminacion)
		"2":
			materialesMuro(15.2,0.115,120,acumCemento, acumArena, acumLadrillos, acumPiedras, acumHierro8, acumHierro4, acumHierro10, acumPiedrasVol, acumHierro6, acumPintura, acumIluminacion)
	Fin Segun
FinSubProceso
	
SubProceso  materialesMuro (masaCemento Por Valor, volumenArena Por Valor, cantidadLadrillos Por Valor, acumCemento Por Referencia, acumArena Por Referencia, acumLadrillos Por Referencia, acumPiedras Por Referencia, acumHierro8 Por Referencia, acumHierro4 Por Referencia, acumHierro10 Por Referencia, acumPiedrasVol Por Referencia, acumHierro6 Por Referencia, acumPintura Por Referencia, acumIluminacion Por Referencia)
	Definir largo, alto, superficie Como Real
	Escribir sin saltar "Cuanto de alto (m) "
	Leer alto
	Escribir sin saltar "Cuanto de largo (m) "
	Leer largo
	Escribir ""
	calcularSuperficie(alto,largo, superficie)
	Escribir "Para un area de (" superficie ") m2"
	Escribir "En cemento se necesita (" masaCemento * superficie ") Kg"
	Escribir "En arena se necesita (" volumenArena * superficie ") m3"
	Escribir "En ladrillos se necesitan (" cantidadLadrillos * superficie ") ladrillos"
	Escribir ""
	acumularMateriales(masaCemento * superficie, volumenArena * superficie, cantidadLadrillos * superficie, 0, 0, 0, 0, 0, 0, 0, 0,acumCemento, acumArena, acumLadrillos, acumPiedras, acumHierro8, acumHierro4, acumHierro10, acumPiedrasVol, acumHierro6, acumPintura, acumIluminacion )
FinSubProceso

SubProceso  calcularViga(acumCemento Por Referencia, acumArena Por Referencia, acumLadrillos Por Referencia, acumPiedras Por Referencia, acumHierro8 Por Referencia, acumHierro4 Por Referencia, acumHierro10 Por Referencia, acumPiedrasVol Por Referencia, acumHierro6 Por Referencia, acumPintura Por Referencia, acumIluminacion Por Referencia)
	Limpiar Pantalla
	Definir vigaLineal Como Real
	Escribir "*************************************"
	Escribir "MODULO CALCULO DE LA VIGA DE HORMIGON"
	Escribir "*************************************"
	Escribir sin saltar "Cuantas vigas de 1 m "
	Leer vigaLineal
	Escribir ""
	Escribir "Para " vigaLineal " vigas de 1 m "
	Escribir "En cemento se necesita (" 9 * vigaLineal ") Kg"
	Escribir "En arena se necesita (" 0.02 * vigaLineal ") m3"
	Escribir "En piedras se necesitan (" 0.02 * vigaLineal ") m2"
	Escribir "En hierro del 8 (" 4 * vigaLineal ") m"
	Escribir "En hierro del 4 (" 3 * vigaLineal ") m"
	Escribir ""
	acumularMateriales(9 * vigaLineal, 0.02 * vigaLineal, 0, 0.02 * vigaLineal, 4 * vigaLineal, 3 * vigaLineal, 0, 0, 0, 0, 0,acumCemento, acumArena, acumLadrillos, acumPiedras, acumHierro8, acumHierro4, acumHierro10, acumPiedrasVol, acumHierro6, acumPintura, acumIluminacion )
FinSubProceso

SubProceso  calcularColumna(acumCemento Por Referencia, acumArena Por Referencia, acumLadrillos Por Referencia, acumPiedras Por Referencia, acumHierro8 Por Referencia, acumHierro4 Por Referencia, acumHierro10 Por Referencia, acumPiedrasVol Por Referencia, acumHierro6 Por Referencia, acumPintura Por Referencia, acumIluminacion Por Referencia)
	Limpiar Pantalla
	Definir columna Como Real
	Escribir "**************************************"
	Escribir "MODULO CALCULO DE COLUMNAS DE HORMIGON"
	Escribir "**************************************"
	Escribir sin saltar "Cuantas columnas de 1 m "
	Leer columna
	Escribir ""
	Escribir "Para " columna " columnas de 1 m "
	Escribir "En cemento se necesita (" 7.5 * columna ") Kg"
	Escribir "En arena se necesita (" 0.016 * columna ") m3"
	Escribir "En piedras se necesitan (" 0.016 * columna ") m2"
	Escribir "En hierro del 10 (" 6 * columna ") m"
	Escribir "En hierro del 4 (" 4 * columna ") m"
	Escribir ""
	acumularMateriales(7.5 * columna, 0.016 * columna, 0, 0.016 * columna, 0, 3 * columna, 4 * columna, 0, 0, 0, 0,acumCemento, acumArena, acumLadrillos, acumPiedras, acumHierro8, acumHierro4, acumHierro10, acumPiedrasVol, acumHierro6, acumPintura, acumIluminacion )
FinSubProceso

SubProceso  calcularContrapisos(acumCemento Por Referencia, acumArena Por Referencia, acumLadrillos Por Referencia, acumPiedras Por Referencia, acumHierro8 Por Referencia, acumHierro4 Por Referencia, acumHierro10 Por Referencia, acumPiedrasVol Por Referencia, acumHierro6 Por Referencia, acumPintura Por Referencia, acumIluminacion Por Referencia)
	Limpiar Pantalla
	Definir largo, alto, ancho, volumen Como Real
	Escribir "*****************************"
	Escribir "MODULO CALCULO DE CONTRAPISOS"
	Escribir "*****************************"
	Escribir sin saltar "Cuanto de alto (m) "
	Leer alto
	Escribir sin saltar "Cuanto de largo (m) "
	Leer largo
	Escribir sin saltar "Cuanto de ancho (m) "
	Leer ancho
	Escribir ""
	calcularVolumen(alto,largo, ancho, volumen)
	Escribir "Para un volumen del contrapiso (" volumen ") cm2"
	Escribir "En cemento se necesita (" 105 * volumen ") Kg"
	Escribir "En arena se necesita (" 0.45 * volumen ") m3"
	Escribir "En piedras se necesitan (" .9 * volumen ") m3"
	Escribir ""
	acumularMateriales(105 * volumen, 0.45 * volumen, 0, 0, 0, 0, 0, .9*volumen, 0, 0, 0,acumCemento, acumArena, acumLadrillos, acumPiedras, acumHierro8, acumHierro4, acumHierro10, acumPiedrasVol, acumHierro6, acumPintura, acumIluminacion )
FinSubProceso

SubProceso  calcularTecho(acumCemento Por Referencia, acumArena Por Referencia, acumLadrillos Por Referencia, acumPiedras Por Referencia, acumHierro8 Por Referencia, acumHierro4 Por Referencia, acumHierro10 Por Referencia, acumPiedrasVol Por Referencia, acumHierro6 Por Referencia, acumPintura Por Referencia, acumIluminacion Por Referencia)
	Limpiar Pantalla
	Definir largo, espesor, ancho, volumen Como Real
	Escribir "***********************"
	Escribir "MODULO CALCULO DE TECHO"
	Escribir "***********************"
	Escribir sin saltar "Cuanto de espesor (m) "
	Leer espesor
	Escribir sin saltar "Cuanto de largo (m) "
	Leer largo
	Escribir sin saltar "Cuanto de ancho (m) "
	Leer ancho
	Escribir ""
	calcularVolumen(espesor,largo, ancho, volumen)
	Escribir "Para un volumen del techo" volumen " vigas de 1 m "
	Escribir "En cemento se necesita (" 33 * volumen ") Kg"
	Escribir "En arena se necesita (" 0.072 * volumen ") m3"
	Escribir "En piedras se necesitan (" 0.072 * volumen ") m2"
	Escribir "En hierro del 8 (" 7 * volumen ") m"
	Escribir "En hierro del 6 (" 4 * volumen ") m"
	Escribir ""
	acumularMateriales(33 * volumen, 0.072 * volumen, 0.072 * volumen, 7*volumen, 0, 0, 0, 0, .4*volumen, 0, 0,acumCemento, acumArena, acumLadrillos, acumPiedras, acumHierro8, acumHierro4, acumHierro10, acumPiedrasVol, acumHierro6, acumPintura, acumIluminacion) 
FinSubProceso

SubProceso  calcularPisos
	Limpiar Pantalla
	Definir largo, ancho, superficie Como Real
	Escribir "*************************************"
	Escribir "MODULO CALCULO DE SUPERFICIE DEL PISO"
	Escribir "*************************************"
	Escribir sin saltar "Cuanto de largo (m) "
	Leer largo
	Escribir sin saltar "Cuanto de ancho (m) "
	Leer ancho
	Escribir ""
	calcularSuperficie(ancho,largo, superficie)
	Escribir "Para un area de (" superficie ") m2"
	Escribir ""
	Escribir "El piso queda con (" 1.1 * superficie ") m2"
	Escribir ""
FinSubProceso

SubProceso  calcularPintura(acumCemento Por Referencia, acumArena Por Referencia, acumLadrillos Por Referencia, acumPiedras Por Referencia, acumHierro8 Por Referencia, acumHierro4 Por Referencia, acumHierro10 Por Referencia, acumPiedrasVol Por Referencia, acumHierro6 Por Referencia, acumPintura Por Referencia, acumIluminacion Por Referencia)
	Limpiar Pantalla
	Definir superficie Como Real
	Escribir "*****************************"
	Escribir "MODULO CALCULO DE LA CANTIDAD"
	Escribir "*****************************"
	Escribir "*************************"
	Escribir "DE PINTURA PARA UNA PARED"
	Escribir "*************************"
	Escribir sin saltar "Cuanto de superficie la pared (m2) "
	Leer superficie
	Escribir ""
	Escribir "En pintura se necesita (" 1/6 * superficie ") L"
	Escribir ""
	acumularMateriales(0, 0, 0, 0, 0, 0, 0, 0, 0, 1/6 * superficie,0,acumCemento, acumArena, acumLadrillos, acumPiedras, acumHierro8, acumHierro4, acumHierro10, acumPiedrasVol, acumHierro6, acumPintura, acumIluminacion )
FinSubProceso

SubProceso  calcularIluminacion(acumCemento Por Referencia, acumArena Por Referencia, acumLadrillos Por Referencia, acumPiedras Por Referencia, acumHierro8 Por Referencia, acumHierro4 Por Referencia, acumHierro10 Por Referencia, acumPiedrasVol Por Referencia, acumHierro6 Por Referencia, acumPintura Por Referencia, acumIluminacion Por Referencia)
	Limpiar Pantalla
	Definir superficie Como Real
	Escribir "*************************************"
	Escribir "MODULO CALCULO DE LA CANTIDAD MINIMA "
	Escribir "*************************************"
	Escribir "**************************************"
	Escribir "DE SUPERFICIE PARA ILUMINACION NATURAL"
	Escribir "**************************************"
	Escribir sin saltar "Cuanto de superficie la habitacion (m2) "
	Leer superficie
	Escribir ""
	Escribir "La cantidad mínima de superficie para la iluminación natural, como ventanas y puertas de vidrio es (" 0.2 * superficie ") m2"
	Escribir ""
	acumularMateriales(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.2 * superficie,acumCemento, acumArena, acumLadrillos, acumPiedras, acumHierro8, acumHierro4, acumHierro10, acumPiedrasVol, acumHierro6, acumPintura, acumIluminacion )
FinSubProceso

// ESTE CODIGO ADICIONAL A LO SOLICITADO PARA ACUMULAR LOS MATERIALES
SubProceso  acumularMateriales(cemento Por Valor, arena Por Valor, ladrillos Por Valor, piedras Por Valor, hierro8 Por Valor, hierro4 Por Valor, hierro10 Por Valor, piedrasVol Por Valor, hierro6 Por Valor, pintura Por Valor, iluminacion Por Valor, acumCemento Por Referencia, acumArena Por Referencia, acumLadrillos Por Referencia, acumPiedras Por Referencia, acumHierro8 Por Referencia, acumHierro4 Por Referencia, acumHierro10 Por Referencia, acumPiedrasVol Por Referencia, acumHierro6 Por Referencia, acumPintura Por Referencia, acumIluminacion Por Referencia)
	Definir seleccion Como Caracter
	Escribir "Desea acumular esa lista de materiales (S/N)"
	Escribir ""
	Leer seleccion
	seleccion = Minusculas(seleccion)
	Si  seleccion = "s" Entonces
		acumCemento = acumCemento + cemento
		acumArena = acumArena + arena
		acumLadrillos = acumLadrillos + ladrillos
		acumPiedras = acumPiedras + piedras
		acumHierro8 = acumHierro8 + hierro8
		acumHierro4 = acumHierro4 + hierro4
		acumHierro10 = acumHierro10 + hierro10
		acumPiedrasVol = acumPiedrasVol + piedrasVol
		acumHierro6 = acumHierro6 + hierro6
		acumPintura = acumPintura + pintura
		acumIluminacion = acumIluminacion + iluminacion
		Escribir "*************"
		Escribir "Acumulado... "
		Escribir "*************"
	FinSi
FinSubProceso

// ESTE CODIGO ADICIONAL A LO SOLICITADO PARA PODER MOSTRAR SEGUN SE REQUIERA
funcion  mostrarAcumulado(acumCemento, acumArena, acumLadrillos, acumPiedras, acumHierro8, acumHierro4, acumHierro10, acumPiedrasVol, acumHierro6, acumPintura, acumIluminacion)
	//Definir superficie Como Real
	Limpiar Pantalla
	Escribir "*************************************************"
	Escribir "LA LISTA DE MATERIALES ACUMULADOS HASTA AHORA ES "
	Escribir "*************************************************"
	Escribir "En cemento en (Kg) es " acumCemento
	Escribir "En arena en (m3) es " acumArena
	Escribir "En ladrillos es " acumLadrillos
	Escribir "En piedras en (m2) es " acumPiedras
	Escribir "En hierro 8 en (m) es " acumHierro8
	Escribir "En hierro 4 en (m) es " acumHierro4
	Escribir "En hierro 10 en () es " acumHierro10
	Escribir "En piedras en (m3) es " acumPiedrasVol
	Escribir "En hierro 6 en (m) es " acumHierro6
	Escribir "En pintura en (L) es " acumPintura
	Escribir "En espacios para iluminacion en (m2) es " acumIluminacion
FinFuncion

Algoritmo materialesConstruccion
	menu
FinAlgoritmo
