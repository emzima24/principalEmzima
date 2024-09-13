Algoritmo mesDescuento
	Definir mesIngresado Como Caracter
	Definir total Como Real
	Escribir "Escribe, el monto total "
	Leer total
	Escribir "Escribe, mes para saber cuanto debes pagar "
	Leer mesIngresado
	mesIngresado = Mayusculas(mesIngresado)
	Si mesIngresado ="SEPTIEMBRE" O mesIngresado ="OCTUBRE" O mesIngresado ="NOVIEMBRE" Entonces
		Escribir "Como en ",mesIngresado," es un mes de descuento, pagas solo ",total*.90
	SiNo
		Escribir "El pago es de ", total 
	Fin Si
FinAlgoritmo
