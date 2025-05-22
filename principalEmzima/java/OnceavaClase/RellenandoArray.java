// El método fill() de la clase Arrays cambia todos los elementos en un arreglo
// por un valor estático, desde el índice start (por defecto 0) hasta el índice
// end (por defecto array.length) y devuelve el arreglo modificado. Vamos a escribir
// un programa que solicite al usuario el tamaño para un arreglo y un número entero
// con el que quiera rellenarlo. Luego crea el arreglo y utiliza Arrays.fill().
// Finalmente, imprime el arreglo resultante.

import java.util.Arrays;
import java.util.InputMismatchException;
import java.util.Scanner;

public class RellenandoArray {
    public static void main(String[] args) {
        // Solicitar tamañano del array e inicializar el arreglo
        Scanner input = new Scanner(System.in);
        int size = 0, fillValue = 0;
        boolean isNotNumberValid = true;

        while (isNotNumberValid) {
            try {
                if (size == 0){
                    System.out.print("\nIngrese un número entero mayor que 0 para el tamaño del arreglo: ");
                    size = input.nextInt();
                } else if (size >0) {
                    System.out.print("\nIngrese un número entero para rellenar el arreglo: ");
                    fillValue = input.nextInt();
                    isNotNumberValid = false;
                }
            } catch (InputMismatchException e) {
                System.out.println("Error: Tenés que ingresar un número entero y mayor que cero para el tamaño, boludo");
                input.next(); // Limpiar el buffer del scanner
            }
        }
        input.close();

        // Llenar el array original
        int[] arrayInt =  new int[size];
        Arrays.fill(arrayInt, fillValue);

        // Mostrar array rellenado
        System.out.println("El arreglo: " + Arrays.toString(arrayInt));

    }
}
