// Escribe un programa en el que declares una variable de tipo array que contenga 10
// elementos de tipo entero. Inicializa el arreglo con valores aleatorios entre 1 y 100,
// imprime por consola el arreglo inicial y luego ordénalo en forma ascendente utilizando
// el método Arrays.sort(). Finalmente, imprime los elementos ordenados en la consola.

import java.util.Arrays;
import java.util.Random;

public class OrdenarAscendenteArrays {
    public static void main(String[] args) {

        // Llenar el array original
        int[] arrayInt = new Random().ints(10, 1, 101).toArray();


        // Mostrar array original
        System.out.println("\nEl arreglo: " + Arrays.toString(arrayInt));

        // Ordenar el array
        Arrays.sort(arrayInt);

        // Mostrar array ordenado
        System.out.println("\nEl arreglo ordenado: " + Arrays.toString(arrayInt));
    }
}
