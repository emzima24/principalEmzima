import java.util.Scanner;

public class ValorAbsoluto {
    public static void main(String[] args) {
        int number = 0;
        Scanner input = new Scanner(System.in);
        try {
            System.out.print("Ingresa un número entero: ");
            number = Integer.parseInt(input.nextLine());

            System.out.println("El valor absoluto del número entero (" + number + ") es " + Math.abs(number));
        } catch (NumberFormatException e) {
            System.out.println("Che boludo un número entero, no cuesta tanto.");
        }
        input.close();
    }
}