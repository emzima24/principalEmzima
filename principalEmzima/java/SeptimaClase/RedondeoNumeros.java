// import java.util.Locale;
import java.util.Scanner;

public class RedondeoNumeros {
    public static void main(String[] args) {
        double number = 0;
        Scanner input = new Scanner(System.in);
        // input.useLocale(Locale.US);
        try {
            System.out.print("Ingresa un número entero: ");
            number = Double.parseDouble(input.nextLine());

            System.out.println("El valor redondeado del número decimal (" + number + ") es " + Math.round(number));
        } catch (NumberFormatException e) {
            System.out.println("Che boludo un número decimal, no cuesta tanto.");
        }
        input.close();
    }
}