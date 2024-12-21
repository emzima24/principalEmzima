import java.util.Scanner;

public class CalculoRaizCuadrada {
    public static void main(String[] args) {
        int number = 0;
        Scanner input = new Scanner(System.in);
        try {
            System.out.print("Ingresa un número entero: ");
            number = Integer.parseInt(input.nextLine());
            if (number < 0) {
                System.out.println("La raiz cuadarada de un número negativo es un número complejo ahora no es el tema");
            } else {
                System.out.println("La raíz cuadrada del número entero (" + number + ") es " + Math.sqrt(number));
            }
        } catch (NumberFormatException e) {
            System.out.println("Che boludo un número entero, no cuesta tanto.");
        }
        input.close();
    }
}
