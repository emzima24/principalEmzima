import java.util.Scanner;

public class DivisionSeguraManejoInput {
    public static void main(String[] args) {
        Scanner input = new Scanner(System.in);
        int dividend = 0, divisor = 0;
        // Los valores de punto flotante no generan excepciones por división entre cero,
        // a diferencia de los valores enteros (int o long).
        try {
            System.out.print("Ingresa un número entero dividendo: ");
            dividend = Integer.parseInt(input.nextLine());
            System.out.print("Ingresa un número divisor: ");
            divisor = Integer.parseInt(input.nextLine());
            float result = dividend / divisor;
            System.out.println("La división de " + dividend + " entre " + divisor + " da como resultado: " + result);
        } catch (NumberFormatException e) {
            System.out.println("Error: Ingresa un número entero válido.");
        } catch (ArithmeticException e) {
            e.printStackTrace();
            System.out.println("Che boludo dividir entre 0 no es posible");
            System.out.println("¡Vamos dale!");
        }
        input.close();
    }
}
