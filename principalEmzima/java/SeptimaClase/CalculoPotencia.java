import java.util.Scanner;

public class CalculoPotencia {
    public static void main(String[] args) {
        int base = 0, exponente = 0;
        Scanner input = new Scanner(System.in);
        try {
            System.out.print("Ingresa un número entero base para una potencia: ");
            base = Integer.parseInt(input.nextLine());
            System.out.print("Ingresa un número entero exponente para una potencia: ");
            exponente = Integer.parseInt(input.nextLine());

            System.out.println(
                    "el resultado de elevar " + base + " a la " + exponente + ": " + Math.pow(base, exponente));
        } catch (NumberFormatException e) {
            System.out.println("Che boludo un número entero, no cuesta tanto.");
        }
        input.close();
    }
}
