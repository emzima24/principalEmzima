

public class OperadoresTernarioBit {
        public static void main(String[] args) {
            int comparationValue = 17;
            String message = (comparationValue >=18) ? "Eres mayor de edad": "No eres mayor de edad";
            System.out.println(message);
            int number1 = 19;
            int number2 = 10;
            int greater = (number1 > number2) ? number1: number2;
            System.out.println("El numero mayor es: "+greater);

            int numberBinario1 = 0b1101; // obligatorio 0b para binario sino lo lleva es considerado Octal
            int numberBinario2 = 0b1011;
            int numberBinario3 = 0b0011;
            int numberBinario4 = 0b11100011;
            // El operador de bit AND (&) lo que hace es multiplicar los bits de las dos cadenas. 
            // Las multiplicaciones de bits dan como resultado que 1 x 1 siempre es 1 y que 1 x 0 y 0 x 0 siempre da 0. 
            // El tamaño de la cadena resultado siempre es el mismo al tamaño de las cadenas.
            int operationAnd = numberBinario1 & numberBinario2;
            // En el caso del OR inclusivo (|) lo que se hace es multiplicar los bits 
            // asumiendo que 1 multiplicado por 1 o por 0, siempre es 1. 
            // Mientras que la única multiplicación que da 0 es 0 x 0.
            int operationOr = numberBinario1 | numberBinario2; 
            // Para el caso del OR exclusivo (^) conocido como XOR. 
            // La multiplicación de bits será 1 para los casos 1 x 0 y 0 x 1. 
            // Las multiplicaciones 1 x 1 y 0 x 0 siempre darán como resultado 0.
            int operationXor = numberBinario1 ^ numberBinario2; 
            // El operador de negación de bits nos permite invertir el contenido de bits de una cadena. 
            // De tal manera que invierte los bits convirtiendo los 1 en 0 y los 0 en 1.
            int operationNot1 = ~ numberBinario1;
            int operationNot2 = ~ numberBinario2;
            int operationNot3 = ~ numberBinario3;
            // En el caso del desplazamiento a izquierdas (bin1 << bin2), desplaza el valor_binario1 a izquierdas 
            // tantas veces como indique el valor_binario2. Los bits se mueven a la izquierda 
            // y se añaden tantos ceros como indique el valor_binario 2.
            int operationdisplacemLeft1 = numberBinario1 << numberBinario3;
            int operationdisplacemLeft2 = numberBinario2 << numberBinario3;
            // En el caso del desplazamiento a derechas (bin1 >> bin2), es exactamente igual al operador de desplazamiento a izquierdas, 
            // pero con la diferencia que mete dígitos por la izquierda y va eliminado el último dígito.
            // Si tiene que meter un 1 o tiene que meter un 0 dependerá del valor del bit del signo.
            // Si el valor del bit de signo es positivo (0), lo que hace es insertar 0. 
            // Si el valor del bit de signo es negativo (1), lo que hace es insertar 1.
            // Los ceros o unos a insertar los determinará el valor_binario2 y serán sobre el valor_binario1.
            int operationdisplacemRight1 = numberBinario1 >> numberBinario3;
            int operationdisplacemRight2 = numberBinario2 >> numberBinario3;
            // Operador Desplazamiento a Derechas sin signo es como el operador desplazamiento
            // a derechas pero no tiene en cuenta el signo. Por lo cual siempre mete ceros por la izquierda.
            // Este operador sería más utilizado si manejamos valores binarios para ejecutar un desplazamiento de bits.
            int operationdisplacemRightUnnsigned4 = numberBinario1 >>> numberBinario3;
            System.out.println("La operación & con el número "+ numberBinario1 +" y con el número "+ numberBinario2 +" es "+ operationAnd + " ("+(Integer.toBinaryString(operationAnd))+")");
            System.out.println("La operación | con el número "+ numberBinario1 +" y con el número "+ numberBinario2 +" es "+ operationOr + " ("+(Integer.toBinaryString(operationOr))+")");
            System.out.println("La operación ^ con el número "+ numberBinario1 +" y con el número "+ numberBinario2 +" es "+ operationXor + " ("+(Integer.toBinaryString(operationXor))+")");
            System.out.println("La operación ~ con el número "+ numberBinario1 +" es "+ operationNot1 + " ("+(Integer.toBinaryString(operationNot1))+")");
            System.out.println("La operación ~ con el número "+ numberBinario2 +" es "+ operationNot2 + " ("+(Integer.toBinaryString(operationNot2))+")");
            System.out.println("La operación ~ con el número "+ numberBinario3 +" es "+ operationNot3 + " ("+(Integer.toBinaryString(operationNot3))+")");
            System.out.println("La operación << con el número "+ numberBinario1 +" y con el número "+ numberBinario3 +" es "+ operationdisplacemLeft1 + " ("+(Integer.toBinaryString(operationdisplacemLeft1))+")");
            System.out.println("La operación << con el número "+ numberBinario2 +" y con el número "+ numberBinario3 +" es "+ operationdisplacemLeft2 + " ("+(Integer.toBinaryString(operationdisplacemLeft2))+")");
            System.out.println("La operación >> con el número "+ numberBinario1 +" y con el número "+ numberBinario3 +" es "+ operationdisplacemRight1 + " ("+(Integer.toBinaryString(operationdisplacemRight1))+")");
            System.out.println("La operación >> con el número "+ numberBinario2 +" y con el número "+ numberBinario3 +" es "+ operationdisplacemRight2 + " ("+(Integer.toBinaryString(operationdisplacemRight2))+")");
            System.out.println("La operación >>> con el número "+ numberBinario4 +" y con el número "+ numberBinario3 +" es "+ operationdisplacemRightUnnsigned4 + " ("+(Integer.toBinaryString(operationdisplacemRightUnnsigned4))+")");
            }
}

