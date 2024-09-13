Algoritmo intercambioVariable
	Definir VariableUno, VariableDos,intercambio Como Entero
	Escribir "Indica la primera variable, recuerda que solo puede ser un numero entero"
	Leer VariableUno
	Escribir "Indica la segunda variable, recuerda que solo puede ser un numero entero"
	Leer VariableDos
	intercambio = VariableUno
	VariableUno = VariableDos
	VariableDos = intercambio
	Escribir "Originalmente la primera variable es ", VariableDos," y la segunda variable es ", VariableUno
	Escribir "Si se intercambian la primera variable es ahora ", VariableUno," y la segunda variable es ", VariableDos
FinAlgoritmo
