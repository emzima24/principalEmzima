Algoritmo integrador
	Definir username, password, passwordSecret, opc, acuerdo,retiroText  Como Cadena
	Definir login Como Logico 
	Definir control, bottle, peso, oferta, saldo,typeBottle,i,retiro Como Real
	control <- 1
	saldo <- 100 // Aleatorio(100,2000)
	passwordSecret <- 'a' // "caramelosDeLimon"
	login <- Falso
	retiroText = 'S'
	Escribir 'Escribe, tu nombre de usuario '
	Leer username
	//username <- 'admin'
	Si username='admin' Entonces
		Escribir 'Escribe la clave, intento (', control, ')' Sin Saltar
		Leer password
		Mientras (password<>passwordSecret) Y (control<3) Hacer
			control <- control+1
			Escribir 'Escribe la clave, intento (', control, ')' Sin Saltar
			Leer password
			// password = "caramelosDeLimon"
		FinMientras
		Si password=passwordSecret Entonces
			login <- Verdadero
			Repetir
				Limpiar Pantalla
				Escribir 'Menú'
				Escribir '   1- Ingresar Botellas'
				Escribir '   2- Consultar Saldo'
				Escribir '   3- Retirar dinero'
				Escribir '   4- Salir'
				Escribir 'Elija una opción (1-3): ' Sin Saltar
				Leer opc
				Segun opc Hacer
					'1':
						Escribir 'Cuantos tipos de botellas son ' Sin Saltar
						Leer typeBottle
						Para i <- 1 Hasta typeBottle Con Paso 1 Hacer
							Escribir 'Cuantas botellas son ' Sin Saltar
							Leer bottle
							peso <- 1502 // Aleatorio(100,3000)
							Si peso<500 Entonces 
								oferta <- bottle*50
							SiNo
								Si peso>1501 Entonces
									oferta <- bottle*200
								SiNo
									oferta <- bottle*125
								FinSi
							FinSi
							Escribir 'La oferta por ', bottle, ' botellas es $', oferta, ', $', oferta/(bottle), ' por botella'
							Escribir 'Estas de acuerdo con esta oferta (S/N)'Sin Saltar
							Leer acuerdo
							acuerdo <- Mayusculas(acuerdo)
							Si acuerdo='S' Entonces
								saldo <- saldo + oferta
							SiNo
								Escribir 'Devolviendo material'
							FinSi
						Fin Para
					'2':
						Escribir 'El saldo es $', saldo
					'3':
						Repetir
							Escribir 'Cuanto desea retirar, recuerde que su saldo es $', saldo
							Leer retiro
							Si (retiro > saldo) O (retiro < 0) Entonces
								Escribir 'Asi no se puede ejecutar el retiro'
							SiNo
								Escribir 'Tome su dinero'
								saldo <- saldo - retiro
								Escribir 'El saldo disponible es' saldo 
							FinSi
							Escribir 'Desea salir (S/N)'
							Leer retiroText
							retiroText = Mayusculas(retiroText)
						Mientras Que retiroText <> 'S'
					'4':
						Escribir 'Gracias, nos vemos pronto'
						login <- Falso
					De Otro Modo:
						Escribir 'Opción no válida'
				FinSegun
				Escribir 'Presione enter para continuar'
				Esperar Tecla
			Mientras Que (login=Verdadero)
		SiNo
			Escribir 'Sos un turro, te olvidaste la clave'
			Escribir 'Bye boludx'
			Escribir 'Presione enter para continuar'
			Esperar Tecla
			Limpiar Pantalla
		FinSi
	SiNo
		Escribir 'El nombre de usuario no corresponde'
		Escribir 'Bye boludx'
		Escribir 'Presione enter para continuar'
		Esperar Tecla
		Limpiar Pantalla
	FinSi
	Escribir 'Bye'
FinAlgoritmo
