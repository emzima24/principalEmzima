import java.util.InputMismatchException;
import java.util.Scanner;

public class PomediandoElementos {
    public static void main(String[] args) {
        int[] arrayInt = new int[4];
        String[] arrayText = { "primer", "segundo", "tercer", "cuarto" };
        int count = 0, sum = 0;
        float promedio;

        try (Scanner input = new Scanner(System.in)) {
            System.out.print(
                    "Ingresa un número entero, el " + arrayText[count] + " elemento del arreglo [" + count + "] ");
            arrayInt[count] = input.nextInt();
            sum += arrayInt[count];
            count++;
            System.out.print(
                    "Ingresa un número entero, el " + arrayText[count] + " elemento del arreglo [" + count + "] ");
            arrayInt[count] = input.nextInt();
            sum += arrayInt[count];
            count++;
            System.out.print(
                    "Ingresa un número entero, el " + arrayText[count] + " elemento del arreglo [" + count + "] ");
            arrayInt[count] = input.nextInt();
            sum += arrayInt[count];
            count++;
            System.out.print(
                    "Ingresa un número entero, el " + arrayText[count] + " elemento del arreglo [" + count + "] ");
            arrayInt[count] = input.nextInt();
            sum += arrayInt[count];
            count++;
            promedio = (float) sum / count;
            System.out.println("**************************************************************");
            System.out.println("La suma de los elementos del arreglo (números enteros) " + sum);
            System.out.printf("El promedio de los números en el arreglo es %.2f%n", promedio);
            System.out.println("**************************************************************");
        } catch (InputMismatchException e) {
            System.out.println(
                    "Che boludo un número entero, no cuesta tanto");
        }

    }
}
