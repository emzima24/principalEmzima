// Complementario 8
// Una tienda ofrece un descuento del 10% sobre el total de la compra realizada por un cliente 
// en los meses de septiembre, octubre y noviembre. El programa solicitará al usuario que ingrese 
// el mes y el importe de la compra. Luego, calculará y mostrará por pantalla el monto total 
// que se debe cobrar al cliente, considerando el descuento si corresponde.



Algoritmo mesDescuento
	Definir mesIngresado Como Caracter
	Definir total Como Real
	Escribir "Escribe, el monto total "
	Leer total
	Escribir "Escribe, el nombre del mes para saber cuanto debes pagar "
	Leer mesIngresado
	mesIngresado = Mayusculas(mesIngresado)
	Si mesIngresado ="SEPTIEMBRE" O mesIngresado ="OCTUBRE" O mesIngresado ="NOVIEMBRE" Entonces
		Escribir "Como en ",mesIngresado," es un mes de descuento, pagas solo ",total*.90
	SiNo
		Escribir "El pago es de ", total 
	Fin Si
FinAlgoritmo
