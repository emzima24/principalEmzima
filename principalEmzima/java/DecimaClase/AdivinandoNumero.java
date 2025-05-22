// Escribe un programa que genere un número aleatorio entre 1 y 20,
// y muestra por consola un mensaje pidiéndote que adivines ese número
// utilizando un bucle do-while. El programa te indicará si el número
// que ingresas es mayor o menor que el número aleatorio, y seguirá pidiéndote
// que adivines hasta que lo hagas correctamente.

import java.util.InputMismatchException;
import java.util.Scanner;

public class AdivinandoNumero {
    public static void main(String[] args) {
        Scanner input = new Scanner(System.in);
        int choice, numberHigh= 20, numberLow = 1;
        int randomInt = (int) (Math.random() * (numberHigh - numberLow + 1)) + numberLow;
        boolean isChoiceNotCorrectly = true;

        do {
            // Mostrar el menú
            System.out.print("\nPor favor, ingresa un número entre 1 y 20: ");
            try {
                choice = input.nextInt();
                if (choice < 1 || choice > 20) {
                    System.out.println("Boludo, tiene que ser un número entre 1 y 20");
                } else if (choice < randomInt) {
                    System.out.println("Es un número más grande, boludin");
                } else if (choice > randomInt) {
                    System.out.println("Es un número más pequeño, boludin");
                } else {
                    System.out.println("¡Acertaste, loco! Felicitaciones");
                    isChoiceNotCorrectly = false;
                }
            } catch (InputMismatchException e) {
                System.out.println("Error: Tenés que ingresar un número entero, boludo");
                input.next(); // Limpiar el buffer del scanner
            }

        } while (isChoiceNotCorrectly);

        input.close();
    }
}
