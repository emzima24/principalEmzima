import java.util.InputMismatchException;
import java.util.Random;
import java.util.Scanner;

public class BuscandoElemento {
    public static void main(String[] args) {
        Random random = new Random();
        int[] arrayInt = new int[3];
        int count = 0, max = 10;
        String message = "El número %d %s encuentra en el arreglo %s";
        boolean isExist = false;
        try (Scanner input = new Scanner(System.in)) {
            System.out.print("Ingresa un numero entre 0  y " + max + ": ");
            int number = input.nextInt();

            arrayInt[count] = random.nextInt(1, 10);
            System.out.println("El primer elemento del arreglo [" + count + "] " + arrayInt[count]);
            isExist = arrayInt[count] == number;
            count++;
            arrayInt[count] = random.nextInt(1, 10);
            System.out.println("El segundo elemento del arreglo [" + count + "] " + arrayInt[count]);
            isExist = (isExist) ? isExist : arrayInt[count] == number;
            count++;
            arrayInt[count] = random.nextInt(1, 10);
            System.out.println("El tercer elemento del arreglo [" + count + "] " + arrayInt[count]);
            isExist = (isExist) ? isExist : arrayInt[count] == number;

            System.out.printf(message, number, isExist ? "SE" : "NO SE");
        } catch (InputMismatchException e) {
            System.out.println("Che boludo un número entero, no cuesta tanto");
        }
    }
}
