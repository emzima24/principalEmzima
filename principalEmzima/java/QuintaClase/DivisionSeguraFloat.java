import java.util.Scanner;

public class DivisionSeguraFloat {

    public static void main(String[] args) {
        Scanner input = new Scanner(System.in);
        // Los valores de punto flotante no generan excepciones por división entre cero,
        // a diferencia de los valores enteros (int o long).

        System.out.print("Ingresa un número dividendo: ");
        float dividend = input.nextInt();
        System.out.print("Ingresa un número divisor: ");
        float divisor = input.nextInt();
        if (divisor != 0) {
            float result = dividend / divisor;
            System.out.println("La división de " + dividend + " entre " + divisor + " da como resultado: " + result);
        } else {
            System.out.println("Che boludo dividir entre 0 no es posible\n¡Vamos dale!");
        }
        input.close();
    }
}