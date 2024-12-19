import java.util.InputMismatchException;
import java.util.Scanner;

public class EncontrandoMaximo {
    public static void main(String[] args) {
        int count = 0, max = 0;
        int[] arrayInt = new int[5];

        try (Scanner input = new Scanner(System.in)) {
            System.out.print("Ingresa un número entero, el primer elemento del arreglo [" + count + "] ");
            arrayInt[count] = input.nextInt();
            max = Math.max(max, arrayInt[count]);
            count++;
            System.out.print("Ingresa un número entero, el segundo elemento del arreglo [" + count + "] ");
            arrayInt[count] = input.nextInt();
            max = Math.max(max, arrayInt[count]);
            count++;
            System.out.print("Ingresa un número entero, el tercer elemento del arreglo [" + count + "] ");
            arrayInt[count] = input.nextInt();
            max = Math.max(max, arrayInt[count]);
            count++;
            System.out.print("Ingresa un número entero, el cuarto elemento del arreglo [" + count + "] ");
            arrayInt[count] = input.nextInt();
            max = Math.max(max, arrayInt[count]);
            count++;
            System.out.print("Ingresa un número entero, el quinto elemento del arreglo [" + count + "] ");
            arrayInt[count] = input.nextInt();
            max = Math.max(max, arrayInt[count]);
            count++;
            System.out.println("***********************************************************");
            System.out.printf("El máximo (de los números que pertenecen al arreglo) es " + max);
            System.out.println("***********************************************************");
        } catch (InputMismatchException e) {
            System.out.println(
                    "Che boludo un número entero, no cuesta tanto");
        }
    }
}
