import java.util.Scanner;

public class PomediandoElementos {
    public static void main(String[] args) {
        int count = 0, sum = 0;
        float promedio;
        int[] arrayInt = new int[4];

        try (Scanner input = new Scanner(System.in)) {
            System.out.print("Ingresa el primer elemento del arreglo [" + count + "] ");
            arrayInt[count] = input.nextInt();
            sum += arrayInt[count];
            count++;
            System.out.print("Ingresa el segundo elemento del arreglo [" + count + "] ");
            arrayInt[count] = input.nextInt();
            sum += arrayInt[count];
            count++;
            System.out.print("Ingresa el tercer elemento del arreglo [" + count + "] ");
            arrayInt[count] = input.nextInt();
            sum += arrayInt[count];
            count++;
            System.out.print("Ingresa el cuarto elemento del arreglo [" + count + "] ");
            arrayInt[count] = input.nextInt();
            sum += arrayInt[count];
            count++;
            promedio = (float) sum / count;
            System.out.println("La suma de los elementos del arreglo " + sum);
            System.out.printf("El promedio de los números en el arreglo es %.2f", promedio);
        } catch (Exception e) {
            System.out.println(
                    "Che boludo un número entero, no cuesta tanto");
        }

    }
}
