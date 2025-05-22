import java.util.Random;

public class ContandoElementosPares {
    public static void main(String[] args) {
        Random random = new Random();
        int[] arrayInt = new int[10];

        // Llenar el array correctamente (usando for tradicional)
        for (int i = 0; i < arrayInt.length; i++) {
            arrayInt[i] = random.nextInt(99) + 1; // Números entre 1 y 100
        }

        // Mostrar array original
        System.out.print("Para un arreglo de longitud: " + arrayInt.length);
        System.out.print(", Constituido por: [");

        int idx = 0;
        for (int num : arrayInt) {
            System.out.print(num);
            if (++idx < arrayInt.length) {
                System.out.print(",");
            } else {
                System.out.print("]");
            }
        }

        // Contar elementos pares
        int contadorPares = 0;
        for (int num : arrayInt) {
            if (num % 2 == 0) {
                contadorPares++;
            }
        }

        System.out.println("\nCantidad de elementos pares: " + contadorPares);
    }
}