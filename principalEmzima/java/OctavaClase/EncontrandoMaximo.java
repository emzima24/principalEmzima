import java.util.InputMismatchException;
import java.util.Scanner;

public class EncontrandoMaximo {
    public static void main(String[] args) {
        int count = 0, max = 0;
        int[] arrayInt = new int[5];

        try (Scanner input = new Scanner(System.in)) {
            System.out.print("Ingresa el primer elemento del arreglo [" + count + "] ");
            arrayInt[count] = input.nextInt();
            max = Math.max(max, arrayInt[count]);
            count++;
            System.out.print("Ingresa el segundo elemento del arreglo [" + count + "] ");
            arrayInt[count] = input.nextInt();
            max = Math.max(max, arrayInt[count]);
            count++;
            System.out.print("Ingresa el tercer elemento del arreglo [" + count + "] ");
            arrayInt[count] = input.nextInt();
            max = Math.max(max, arrayInt[count]);
            count++;
            System.out.print("Ingresa el cuarto elemento del arreglo [" + count + "] ");
            arrayInt[count] = input.nextInt();
            max = Math.max(max, arrayInt[count]);
            count++;
            System.out.print("Ingresa el quinto elemento del arreglo [" + count + "] ");
            arrayInt[count] = input.nextInt();
            max = Math.max(max, arrayInt[count]);
            count++;
            System.out.printf("El máximo de los números en el arreglo es " + max);
        } catch (InputMismatchException e) {
            System.out.println(
                    "Che boludo un número entero, no cuesta tanto");
        }
    }
}
