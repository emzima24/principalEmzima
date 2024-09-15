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
// Se define real porque es menos probable que se rompa en ejecucion en el ingreso de la variable
// Se define real porque es menos probable que se rompa en ejecucion en el ingreso de la variable y se mantiene para todos los casos por economia de codigo
// Se define real por costumbre mas que por otra razon cuando la memoria importe lo consideraremos distinto



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
