import java.util.Locale;
import java.util.Scanner;

public class RestaManejoExcepciones {
    public static void main(String[] args) {
        Scanner input = new Scanner(System.in);
        input.useLocale(Locale.US);
        float number1 = 0, number2 = 0;
        // Los valores de punto flotante no generan excepciones por división entre cero,
        // a diferencia de los valores enteros (int o long).
        try {
            System.out.print("Ingresa un número: ");
            number1 = Float.parseFloat(input.nextLine());
            System.out.print("Ingresa otro número para restar al anterior: ");
            number2 = Float.parseFloat(input.nextLine());
            float result = number1 - number2;
            System.out.println("La resta de " + number1 + " menos " + number2 + " da como resultado: " + result);
        } catch (NumberFormatException e) {
            System.out.println("Error: Ingresa un número válido.\nChe boludo un número es fácil");
            System.exit(1);
        }
        input.close();
    }
}
