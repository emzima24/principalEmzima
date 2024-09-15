// integrador
// Sistema de Reciclaje de Botellas Automático:
//
// Se requiere desarrollar un sistema para una máquina de reciclaje de botellas que recompensará 
// a los usuarios por la cantidad de plástico reciclado. El sistema solicitará a los usuarios 
// que ingresen su nombre de usuario y contraseña para cargar el saldo correspondiente a su cuenta.
//		
// Condición Simple Anidada:  En esta estructura, se verificará inicialmente el nombre de usuario. 
// Si el nombre de usuario coincide con "Albus_D", se procederá a validar la contraseña como "caramelosDeLimon". 
// Si la contraseña es correcta, se establecerá la variable lógica "Login" como verdadera. 
// En resumen, la variable "Login" solo se activará cuando tanto el nombre de usuario 
// como la contraseña coincidan con los esperados.
//				
// Bucle Mientras: La validación de la contraseña se llevará a cabo dentro de un bucle Mientras,
// lo que permitirá al usuario tener un máximo de tres intentos para ingresar la contraseña correctamente.
//						
// Bucle Hacer Mientras (Repetir): Una vez que el inicio de sesión sea exitoso (es decir, cuando 
// "Login" sea verdadero), el usuario podrá acceder al menú de opciones, que incluye:
//									
// 		1- Ingresar Botellas: Inicialmente,el usuario ingresará la cantidad de botellas a reciclar, y 
// 		se generará un peso aleatorio para cada botella (entre 100 y 3000 gramos). Según el peso unitario, 
//		se asignará un valor monetario utilizando un condicional múltiple.
//										
// 			Si el peso es menos de 500 gr, corresponden $50
//	
// 			Si el peso es entre 501 gr y 1500 gr, corresponden $125 
//												
// 			Si el peso es más de 1501 gr, corresponden $200 
//													
// 		Hecho esto, el programa debe informar al usuario por pantalla el valor que se le ofrece por el total 
//		de las botellas ingresadas. Si el usuario acepta, lo acreditamos a su saldo, si no se debe devolver 
// 		el material (sólo mostrar en pantalla "Devolviendo material"). Para esto se debe utilizar un condicional doble. 
//																
// 		2- Consultar Saldo: Se mostrará al usuario el valor monetario actual en su saldo,
//		en una variable definida previamente que "acumula" dicho importe. .
//																
// 		3- Salir: Permitirá al usuario salir del sistema.
//																
// 		6. Finalización de Opciones: Después de completar las acciones de "Ingresar Botellas" 
//		o "Consultar Saldo", el programa volverá al menú principal automáticamente.
//																
// 		7. Bucle Para (Incorporación opcional):El bucle Para se utilizará específicamente dentro de la
//		opción "Ingresar Botellas". Permitirá al usuario ingresar múltiples botellas en una misma sesión, si así lo desea.
//																			
// Si lo desean, pueden incorporar alguna otra funcionalidad o validación que consideren que optimizará el funcionamiento de su sistema.



Algoritmo integrador
	// Se define real porque es menos probable que se rompa en ejecucion en el ingreso de la variable y se mantiene para todos los casos por economia de codigo
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
						// FUNCIONALIDAD AÑADIDA PARA RETIRAR DINERO
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
