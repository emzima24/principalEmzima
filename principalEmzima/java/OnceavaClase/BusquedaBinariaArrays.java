// La búsqueda binaria es un algoritmo eficiente para encontrar un elemento en una
// lista ordenada de elementos. La clase Arrays ya incluye su implementación mediante
// el método binarySearch(). Escribe un programa que realice una búsqueda binaria en
// un arreglo ordenado de enteros utilizando el método Arrays.binarySearch(). El programa
// debe imprimir el arreglo generado originalmente, solicitar al usuario el valor buscado
// e imprimir el índice del valor buscado si está presente en el arreglo.

import java.util.Arrays;
import java.util.InputMismatchException;
import java.util.Random;
import java.util.Scanner;

public class BusquedaBinariaArrays {
    public static void main(String[] args) {
        int randomInt = (int) (Math.random() * (15 - 1 + 1)) + 1;

        // Llenar el array original
        int[] arrayInt = new Random().ints(randomInt, 1, 101).toArray();

        // Mostrar array original
        System.out.print("\nPara un arreglo de longitud: " + arrayInt.length);
        System.out.println("\nEl arreglo: " + Arrays.toString(arrayInt));

        // Ordenar el array
        Arrays.sort(arrayInt);

        // Mostrar array ordenado
        System.out.println("\nEl arreglo ordenado: " + Arrays.toString(arrayInt));

        Scanner input = new Scanner(System.in);
        int choice;
        System.out.print("\nIngrese el número a buscar (1-100): ");
        try {
            choice = input.nextInt();
            int arraysResult = Arrays.binarySearch(arrayInt,choice);
            // Mostrar resultado de la búsqueda
            if (arraysResult >= 0) {
                System.out.println("El número " + choice + " se encuentra en la posición " + arraysResult);
            } else {
                System.out.println("El número " + choice + " no se encuentra en el arreglo");
            }
            } catch (InputMismatchException e) {
                System.out.println("Error: Tenés que ingresar un número entero, boludo");
                input.next(); // Limpiar el buffer del scanner
            }
        input.close();
    }
}
