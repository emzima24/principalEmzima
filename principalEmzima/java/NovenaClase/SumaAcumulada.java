import java.util.Random;

public class SumaAcumulada {
    public static void main(String[] args) {
        Random random = new Random();
        int numberArray = random.nextInt(24) + 1, sum = 0; // Genera entre 1 y 25
        int[] arrayInt = new int[numberArray], arraySum = new int[numberArray];

        // Llenar el array original
        for (int element = 0; element < arrayInt.length; element++) {
            arrayInt[element] = random.nextInt(99) + 1;
            sum += arrayInt[element];
            arraySum[element] = sum;
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

        // Mostrar array de sumas acumuladas
        System.out.print("El arreglo de sumas acumuladas es: [");
        for (int i = 0; i < arraySum.length; i++) {
            System.out.print(arraySum[i]);
            if (i < arraySum.length - 1) {
                System.out.print(",");
            }
        }
        System.out.println("]");
    }
}
