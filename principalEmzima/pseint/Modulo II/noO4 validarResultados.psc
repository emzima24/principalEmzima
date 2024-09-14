// Complementario 4
// Escribe un programa que te pida ingresar los resultados de los últimos 3 partidos de tu equipo
// y valide si la suma de las anotaciones está entre 1 y 10. Si se encuentran dentro de estos parámetros,
// se debe establecer como verdadera una variable lógica y, en caso contrario, como falsa. 
// Al final del programa, se deberá indicar si los 3 resultados son correctos utilizando la variable lógica.



Algoritmo validarResultados
	// estoy en muy inseguro de que sea la solucion porque esta confuso 
	// aunque esta bien hay formas mas simples para esto
	// Se define real porque es menos probable que se rompa en ejecucion
    Definir resultadoPrimero, resultadoSegundo, resultadoTercero, total Como Real
    Definir isCorrecto Como Logico
    Escribir "Ingrese el resultado del primer partido: "
    Leer resultadoPrimero
    Escribir "Ingrese el resultado del segundo partido: "
    Leer resultadoSegundo
    Escribir "Ingrese el resultado del tercer partido: "
    Leer resultadoTercero
    total = resultadoPrimero + resultadoSegundo + resultadoTercero
    Si total >= 1 Y total <= 10 ENTONCES
        isCorrecto = Verdadero
    SiNo
        isCorrecto = Falso
    Fin Si
    Si isCorrecto Entonces
        Escribir "Los resultados son correctos."
    SiNo
        Escribir "Los resultados no son correctos."
    Fin Si
FinAlgoritmo