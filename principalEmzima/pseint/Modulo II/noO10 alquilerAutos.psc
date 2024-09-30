// Complementario 10
// La empresa "Te llevo a todos lados" tiene un sistema de tarifa para el alquiler de autos 
// por hora. Si el cliente devuelve el auto dentro de las 2 horas de uso, el costo es de $400 pesos 
// y la nafta es gratuita. Si el cliente devuelve el auto después de las 2 horas, se ingresa 
// la cantidad de litros de nafta gastados y el tiempo transcurrido en horas. El programa calculará 
// el total a pagar por el cliente, considerando un costo de $40 por litro de 
// nafta y $5,20 por minuto de uso después de las primeras 2 horas.



Algoritmo alquilerAutos
	// Se define real porque es menos probable que se rompa en ejecucion en el ingreso de las horas
	// aunque las horas pueden ser decimales
	Definir horasIngreso,cantidadNafta Como Real
	Escribir "Escribe, las cantidad de horas de uso "
	Leer horasIngreso
	Si ((horasIngreso) <= 2)  Entonces
		Escribir "Con este tiempo de ",horasIngreso, " horas debes pagar $", 400 
	SiNo
		Escribir "Escribe, la cantidad de nafta gastado, en litros "
		Leer cantidadNafta
	    Escribir "Con este tiempo de ",horasIngreso, " horas y la cantidad de nafta consumida ",cantidadNafta," litros debes pagar $",((horasIngreso-2)*60*5.20)+(40*cantidadNafta)
	Fin Si
FinAlgoritmo
