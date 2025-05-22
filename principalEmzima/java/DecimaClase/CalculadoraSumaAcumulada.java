// Crea un programa que solicite al usuario ingresar una serie de números
// enteros positivos. Utiliza un bucle do-while para ir acumulando la suma
// de los números ingresados. Después de cada entrada de número, pregunta
// al usuario si desea ingresar otro número. Si el usuario responde afirmativamente,
// continúa solicitando números; de lo contrario, muestra la suma acumulada
// de todos los números ingresados y termina el programa.

import java.util.InputMismatchException;
import java.util.Scanner;

public class CalculadoraSumaAcumulada {
    public static void main(String[] args) {
        Scanner input = new Scanner(System.in);
        int number, sum = 0;
        String choice;
        boolean continueInput = true;

        do {
            System.out.print("\nIngresa un número entero positivo: ");

            try {
                number = input.nextInt();

                if (number < 0) {
                    System.out.println("Boludo, tiene que ser un número positivo");
                } else {
                    sum += number;

                    // Preguntar si quiere continuar
                    do {
                        System.out.print("¿Deseas ingresar otro número? (S/N): ");
                        choice = input.next().toUpperCase();

                        if (!choice.equals("S") && !choice.equals("N")) {
                            System.out.println("Respuesta inválida. Ingresa S o N, boludo");
                        }
                    } while (!choice.equals("S") && !choice.equals("N"));

                    continueInput = choice.equals("S");
                }

            } catch (InputMismatchException e) {
                System.out.println("Error: Tenés que ingresar un número entero, boludo");
                input.next(); // Limpiar el buffer del scanner
            }

        } while (continueInput);

        System.out.println("\nLa suma acumulada es: " + sum);
        input.close();
    }
}
