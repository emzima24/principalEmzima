import java.util.InputMismatchException;
import java.util.Random;
import java.util.Scanner;

public class BuscandoElemento {
    public static void main(String[] args) {
        Random random = new Random();
        int[] arrayInt = new int[3];
        String[] arrayText = { "primer", "segundo", "tercer", "cuarto", "quinto", "sexto" };
        int count = 0, max = 10;
        String message = "El número %d %s encuentra en el arreglo";
        boolean isExist = false;
        try (Scanner input = new Scanner(System.in)) {
            System.out.print("Ingresa un numero ENTERO entre 0  y " + max + ": ");
            int number = input.nextInt();
            if ((number > 10) || (number < 0)) {
                throw new IndexOutOfBoundsException("Entre 0 y " + max + " boludo tampoco es tan díficil");
            }
            arrayInt[count] = random.nextInt(1, 10);
            System.out.println("El " + arrayText[count] + " elemento del arreglo [" + count + "] " + arrayInt[count]);
            isExist = arrayInt[count] == number;
            count++;
            arrayInt[count] = random.nextInt(1, 10);
            System.out.println("El " + arrayText[count] + " elemento del arreglo [" + count + "] " + arrayInt[count]);
            isExist = (isExist) ? isExist : arrayInt[count] == number;
            count++;
            arrayInt[count] = random.nextInt(1, 10);
            System.out.println("El " + arrayText[count] + " elemento del arreglo [" + count + "] " + arrayInt[count]);
            isExist = (isExist) ? isExist : arrayInt[count] == number;
            System.out.println("***************************");
            System.out.printf(message, number, isExist ? "SE" : "NO SE");
        } catch (InputMismatchException e) {
            System.out.println("***************************");
            System.out.println("Che boludo un número ENTERO, no cuesta tanto");
        } catch (IndexOutOfBoundsException e) {
            System.out.println(e.getMessage());
        }
    }
}
