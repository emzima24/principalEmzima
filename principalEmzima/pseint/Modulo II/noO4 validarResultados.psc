Algoritmo validarResultados
	// estoy en muy inseguro de que sea la solucion porque esta confuso 
	// aunque esta bien hay formas mas simples para esto
    Definir resultadoPrimero, resultadoSegundo, resultadoTercero, total Como Enteros
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