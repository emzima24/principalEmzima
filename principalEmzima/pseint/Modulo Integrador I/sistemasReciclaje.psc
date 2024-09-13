Algoritmo sistemasReciclaje
	Definir user,pass,passFijo,opc,desc Como Caracter
	Definir inten,bot,peso,ofer,saldo,tipo,i Como Real
	Definir login Como Logico
	inten = 0
	passFijo = "1234"
	login = Falso
	saldo = Aleatorio(100,1000)
	Escribir sin saltar "Usuario "
	Leer user
	//user= "admin"
	Si user = "admin" Entonces
		//Escribir sin saltar "Pass " inten+1
		//Leer pass
		pass = "a"
		Mientras (pass <> passFijo) Y  (inten<3) Hacer
			Escribir sin saltar "Pass " inten+1
			Leer pass
			inten = inten + 1
		FinMientras
		Si pass = passFijo Entonces
			login = Verdadero 
			
			Repetir
				Limpiar Pantalla
				Escribir "Selecciona"
				Escribir "1- Botellas"
				Escribir "2- Saldo"
				Escribir "3- Salir"
				Escribir sin saltar "Opcion "
				Leer opc
				Segun opc Hacer
					1:
						Escribir sin saltar " cuantos tipo "
						Leer tipo
						Para i<- 1 hasta tipo Hacer
							Escribir sin saltar "cuantas Botellas "
							Leer bot
							peso = Aleatorio(100,3000)
							Si peso < 500 Entonces
								ofer = bot*50
							SiNo
								Si peso >1501 Entonces
									ofer = bot*200
								SiNo
									ofer = bot*125
								FinSi
							FinSi
							Escribir "Te damos " ofer " el peso es " peso
							Escribir sin saltar "Tas de acuerdo "
							Leer desc
							desc = Minusculas(desc)
							Si desc = "s" Entonces
								saldo = saldo + ofer
								Escribir "Cargando saldo"
							SiNo
								Escribir "Devolviendo"
							FinSi
						FinPara
					2:
						Escribir "Tu saldo es " saldo
					3:
						login = Falso
						Escribir "Nos vemos roma"
					De Otro Modo:
						Escribir "del 1 al 3 boludo"
				Fin Segun
				Escribir 'Presione enter para continuar'
				Esperar Tecla	
			Mientras Que login <> Falso
			
		SiNo
			Escribir "Vas pa fuera boludo"
		FinSi
	SiNo
		Escribir "Vas pa fuera"
	FinSi
FinAlgoritmo
