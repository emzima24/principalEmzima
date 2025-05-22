import java.util.Random;

public class InvertirArray {
    public static void main(String[] args) {
        Random random = new Random();
        int numberArray = random.nextInt(24) + 1; // Genera entre 1 y 25
        int[] arrayInt = new int[numberArray];

        // Llenar el array original
        for (int element = 0; element < arrayInt.length; element++) {
            arrayInt[element] = random.nextInt(99) + 1;
        }

        // Mostrar array original
        System.out.print("Para un arreglo de longitud: " + arrayInt.length);
        System.out.print(", Constituido por: [");
        for (int i = 0; i < arrayInt.length; i++) {
            System.out.print(arrayInt[i]);
            if (i < arrayInt.length - 1) {
                System.out.print(",");
            }
        }
        System.out.println("]");

        // Invertir el array
        for (int i = 0; i < arrayInt.length / 2; i++) {
            int temp = arrayInt[i];
            arrayInt[i] = arrayInt[arrayInt.length - 1 - i];
            arrayInt[arrayInt.length - 1 - i] = temp;
        }

        // Mostrar array invertido
        System.out.print("Invertido es: [");
        for (int i = 0; i < arrayInt.length; i++) {
            System.out.print(arrayInt[i]);
            if (i < arrayInt.length - 1) {
                System.out.print(",");
            }
        }
        System.out.println("]");
    }
}
