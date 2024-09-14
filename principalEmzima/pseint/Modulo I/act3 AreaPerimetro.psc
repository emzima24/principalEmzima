// Actividad 1
// Solicita al usuario ingresar el valor del radio de una circunferencia y luego calcula y muestra por pantalla el área y perímetro. Para calcular estos valores, puedes usar las siguientes fórmulas:
//
// Area = PI * radio2
//
// Perimetro = 2 * PI * radio
//
// Recuerda que en matemáticas, ? (PI) representa el número aproximado de 3.14
//
// Recuerda que al realizar cálculos, tienes la opción de almacenar el resultado en una variable para su uso posterior, 
// o bien ejecutar la operación directamente en una instrucción de salida, como por ejemplo, al escribir el resultado.



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
