import java.util.Arrays;
import java.util.Random;

public class ContandoElementosParesMejor {
    public static void main(String[] args) {
        int[] arrayInt = new Random().ints(10, 1, 100).toArray();

        System.out.println("Array: " + Arrays.toString(arrayInt));
        System.out.println("Elementos pares: " +
                Arrays.stream(arrayInt).filter(n -> n % 2 == 0).count());
    }
}
