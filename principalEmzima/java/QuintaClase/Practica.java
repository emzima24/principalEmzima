import java.util.Scanner;

public class Practica {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        try {
            // Solicitar al usuario que ingrese dos números
            System.out.print("Ingresa el primer número: ");
            double numero1 = scanner.nextDouble();
            System.out.print("Ingresa el segundo número: ");
            double numero2 = scanner.nextDouble();
            // Realizar la resta de los números ingresados
            double resultado = numero1 - numero2;
            System.out.println("El resultado de la resta es: " + resultado);
        } catch (Exception e) {
            // Manejo de excepciones en caso de que ocurra un error al ingresar los números

            System.out.println("Error: Ingresa datos válidos (solamente puedes ingresar números).");

        } finally {
            // Cerrar el scanner
            scanner.close();
        }
    }
}
