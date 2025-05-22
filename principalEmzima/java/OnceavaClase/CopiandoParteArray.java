// Crea un programa en Java que declare y muestre un arreglo de enteros junto
// con sus índices. Luego, solicita al usuario dos índices: un índice inicial
// y un índice final. Con estos dos índices, copia la parte del arreglo original
// comprendida entre ellos (inclusive) en un nuevo arreglo utilizando el método
// Arrays.copyOfRange(). Asegúrate de incluir validaciones para confirmar que el
// índice inicial es menor que el índice final y que ambos índices están dentro
// del rango válido del arreglo original. Finalmente, imprime el nuevo arreglo por consola.

import java.util.Arrays;
import java.util.InputMismatchException;
import java.util.Random;
import java.util.Scanner;
import java.util.stream.IntStream;

public class CopiandoParteArray {
    public static void main(String[] args) {
        int randomInt = (int) (Math.random() * (15 - 1 + 1)) + 1;

        // Llenar el array original
        int[] arrayInt = new Random().ints(randomInt, 1, 101).toArray();

        // Mostrar array original y sus indices
        System.out.print("\nPara un arreglo de longitud: " + randomInt);
        System.out.println("\nElementos con índices (usando Stream):");
        Arrays.stream(arrayInt)
                .forEach(number -> System.out.printf("Índice [%d]: %d\n",
                        Arrays.binarySearch(arrayInt, number), number));

        System.out.println("\nElementos con índices (usando IntStream):");
        IntStream.range(0, arrayInt.length)
                .forEach(index -> System.out.printf("Índice [%d]: %d\n", index, arrayInt[index]));

        Scanner input = new Scanner(System.in);
        int endIndex = 0, startIndex = 0;
        boolean isNotValid = true, hasNotErrors = true;
        while (isNotValid) {
            try {
                System.out.print("\nIngrese el número del indice de partida del arreglo: ");
                startIndex = input.nextInt();
                System.out.print("\nIngrese el número del indice final inclusive del arreglo: ");
                endIndex = input.nextInt();
                hasNotErrors = true;
                if (endIndex < startIndex) {
                    System.out.println("\nChe! Tenés que ingresar el indice final (" + endIndex + ") mayor que el indice de partida (" + startIndex + "), boludo");
                    hasNotErrors = false;
                }
                if (startIndex < 0) {
                    System.out.println("\nChe! Tenés que ingresar el indice de partida (" + startIndex + ") mayor o igual que 0 , boludo");
                    hasNotErrors = false;
                }
                if (endIndex < 0) {
                    System.out.println("\nChe! Tenés que ingresar el indice final (" + startIndex + ") mayor o igual que 0 , boludo");
                    hasNotErrors = false;
                }
                if (startIndex >= (arrayInt.length)) {
                    System.out.println("\nChe! Tenés que ingresar el indice de partida (" + startIndex + ") menor que " + (arrayInt.length - 1) + ", boludo");
                    hasNotErrors = false;
                }
                if (endIndex >= (arrayInt.length)) {
                    System.out.println("\nChe! Tenés que ingresar el indice final (" + endIndex + ") menor que " + (arrayInt.length - 1) + ", boludo");
                    hasNotErrors = false;
                }
                if (hasNotErrors) {
                    isNotValid = false;
                }
            } catch (InputMismatchException e) {
                System.out.println("Error: Tenés que ingresar un número entero, boludo");
                input.next(); // Limpiar el buffer del scanner
            }
        }
        input.close();
        // Copiar el rango seleccionado (usando copyOfRange)
        // Nota: endIndex+1 porque copyOfRange excluye el toIndex
        int[] arrayIntCut = Arrays.copyOfRange(arrayInt, startIndex,endIndex+1);

        // Mostrar resultado de la selección
        System.out.println("\nSubarreglo resultante:");
        System.out.println("Es: " + Arrays.toString(arrayIntCut));
    }
}
