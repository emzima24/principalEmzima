// Actividad 1
// Solicita al usuario ingresar el valor del radio de una circunferencia y luego calcula y muestra por pantalla el �rea y per�metro. Para calcular estos valores, puedes usar las siguientes f�rmulas:
//
// Area = PI * radio2
//
// Perimetro = 2 * PI * radio
//
// Recuerda que en matem�ticas, ? (PI) representa el n�mero aproximado de 3.14
//
// Recuerda que al realizar c�lculos, tienes la opci�n de almacenar el resultado en una variable para su uso posterior, 
// o bien ejecutar la operaci�n directamente en una instrucci�n de salida, como por ejemplo, al escribir el resultado.



Algoritmo AreaPerimetro
	// Se aplica el criterio de variable mas permisiva para no romper el codigo
	Definir radio, area,perimetro Como Real
	Escribir "Indica el radio de la circunferencia (en cm)"
	Leer radio
	area = PI*radio^2
	perimetro = PI*radio*2
	Escribir "El area, para el radio ", radio,"cm, es de ",area," cm2"
	Escribir "El perimetro para el radio ", radio,"cm es de ",perimetro," cm"
FinAlgoritmo
