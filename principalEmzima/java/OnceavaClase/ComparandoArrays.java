// Escribe un programa que compare dos arreglos de enteros utilizando el método
// Arrays.equals(). El programa debe imprimir si los arreglos son iguales o no.

import java.util.Arrays;
import java.util.Random;

public class ComparandoArrays {
    public static void main(String[] args) {
        int randomInt = (int) (Math.random() * (15 - 1 + 1)) + 1;

        // Llenar el array original
        int[] arrayIntOne = new Random().ints(randomInt, 1, 101).toArray();
        int[] arrayIntTwo = new Random().ints(randomInt, 1, 101).toArray();
        int[] arrayIntThree = Arrays.copyOf(arrayIntOne,arrayIntOne.length);

        // Mostrar array original
        System.out.print("\nLa longitud de los arreglos es: " + randomInt);
        System.out.println("El arreglo uno: " + Arrays.toString(arrayIntOne));
        System.out.println("El arreglo dos: " + Arrays.toString(arrayIntTwo));
        System.out.println("El arreglo tres: " + Arrays.toString(arrayIntThree));


        // Mostrar resultado de la comparación
        System.out.println("\nResultados de comparación:");
        System.out.println("El Arreglo uno y el arreglo dos son " +
                (Arrays.equals(arrayIntOne, arrayIntTwo) ? "IGUALES" : "DIFERENTES"));
        System.out.println("El Arreglo uno y el arreglo tres son " +
                (Arrays.equals(arrayIntOne, arrayIntThree) ? "IGUALES" : "DIFERENTES"));
    }
}
