import java.util.Scanner;

public class DivisionSegura {

    public static void main(String[] args) {
        Scanner input = new Scanner(System.in);
        // Los valores de punto flotante no generan excepciones por división entre cero,
        // a diferencia de los valores enteros (int o long).

        System.out.print("Ingresa un número dividendo: ");
        int dividend = input.nextInt();
        System.out.print("Ingresa un número divisor: ");
        int divisor = input.nextInt();
        try {
            float result = dividend / divisor;
            System.out.println("La división de " + dividend + " entre " + divisor + " da como resultado: " + result);
        } catch (ArithmeticException e) {
            System.out.println("Che boludo dividir entre 0 no es posible");
            System.out.println("¡Vamos dale!");
        }
        input.close();
    }
}