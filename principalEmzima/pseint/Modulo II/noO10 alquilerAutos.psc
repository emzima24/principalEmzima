Algoritmo alquilerAutos
	Definir horasIngreso,cantidadNafta Como Real
	Escribir "Escribe, las cantidad de horas de uso "
	Leer horasIngreso
	Escribir "Escribe, la cantidad de nafta gastado, en litros "
	Leer cantidadNafta
	Si ((horasIngreso) <= 2)  Entonces
		Escribir "Con este tiempo de ",horasIngreso, " horas y la cantidad de nafta consumida ",cantidadNafta," litros debes pagar $", 400 
	SiNo
	    Escribir "Con este tiempo de ",horasIngreso, " horas y la cantidad de nafta consumida ",cantidadNafta," litros debes pagar $",((horasIngreso-2)*60*5.20)+(40*cantidadNafta)
	Fin Si
FinAlgoritmo
