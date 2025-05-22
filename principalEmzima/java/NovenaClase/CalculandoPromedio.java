import java.util.Arrays;
import java.util.Random;

public class CalculandoPromedio {
    public static void main(String[] args) {
        int[] arrayInt = new Random().ints(20, 1, 100).toArray();

        System.out.println("Array: " + Arrays.toString(arrayInt));

        double suma = Arrays.stream(arrayInt)
                .sum();

        double promedio = Arrays.stream(arrayInt)
                .average()
                .orElse(Double.NaN);

        System.out.println("La suma (mejor forma): "+ suma);
        System.out.printf("El promedio (mejor forma): %.2f%n", promedio);

        suma = 0;
        for (int element:arrayInt) {
            suma += element;
        }

        promedio = suma/arrayInt.length;

        System.out.println("La suma (forma clasica): "+ suma);
        System.out.printf("El promedio (forma clasica): %.2f%n", promedio);
    }
}
