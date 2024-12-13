import java.util.Scanner;

public class ConversionCadenaEntero {
        public static void main(String[] args) {
        Scanner input = new Scanner(System.in);
        int number = 0;
        // Los valores de punto flotante no generan excepciones por división entre cero,
        // a diferencia de los valores enteros (int o long).
        try {
            System.out.print("Ingresa un número entero: ");
            number = Integer.parseInt(input.nextLine());
            System.out.println("El número ingresado es " + number);
        } catch (NumberFormatException e) {
            System.out.println("Error: Ingresa un número entero válido boludo tas mandando fruta.");
        }
        input.close();
    }
}
