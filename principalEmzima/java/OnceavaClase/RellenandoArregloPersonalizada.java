// Rellenando un arreglo de manera personalizada
// Escribe un programa en Java que realice lo siguiente:
// Solicita al usuario un tamaño para un arreglo.
// Luego, pídele que ingrese un número con el que desea rellenar el array.
// Solicita el índice hasta el cual quiere rellenar el array con el número anterior.
// El array deberá ser rellenado con el número proporcionado hasta el índice ingresado por el usuario.
// Asegúrate de validar lo siguiente:
// La primera vez que se pide al usuario un número para rellenar el arreglo, el índice inicial debe ser 0.
// Si el índice ingresado no es el índice del último elemento del arreglo, el programa debe continuar pidiendo al usuario nuevos números e índices para rellenar el arreglo.
// El índice siempre debe ser menor que el tamaño total del arreglo.
// Cada vez que se solicita un nuevo número para rellenar el arreglo, el índice ingresado debe ser mayor que el último índice ingresado; a su vez, se debe rellenar el array con el nuevo número desde el índice anterior hasta el nuevo índice.
// Por último, el programa debe imprimir por consola el arreglo completo.

import java.util.Arrays;
import java.util.InputMismatchException;
import java.util.Scanner;

public class RellenandoArregloPersonalizada {
    public static void main(String[] args) {
        // Solicitar tamañano del array e inicializar el arreglo
        Scanner input = new Scanner(System.in);
        int size = 0, fillValue = 0, endIndex = 0, startIndex = 0;
        boolean isNotNumberValid = true, isNotValid = true, hasNotErrors = true;
        int[] arrayInt = null; // Declarado fuera del bloque para que sea accesible

        while (isNotNumberValid) {
            /*try {
                if (size == 0){
                    System.out.print("\nIngrese un número entero mayor que 0 para el tamaño del arreglo: ");
                    size = input.nextInt();
                } else if (size >0) {
                    arrayInt =  new int[size];
                    System.out.print("\nIngrese un número entero para rellenar el arreglo desde la posición "+startIndex+": ");
                    fillValue = input.nextInt();
                    System.out.print("\nIngrese la posición final (inclusive) hasta donde rellenar (máx " + (size-1) + "): ");
                    endIndex = input.nextInt();
                    // Llenar el array original
                    while (isNotValid) {
                        hasNotErrors = true;
                        if (endIndex < startIndex) {
                            System.out.println("\nChe! Tenés que ingresar el indice final (" + endIndex + ") mayor que el indice de partida (" + startIndex + "), boludo");
                            hasNotErrors = false;
                        }
                        if (startIndex < 0) {
                            System.out.println("\nChe! Tenés que ingresar el indice de partida (" + startIndex + ") mayor o igual que 0 , boludo");
                            hasNotErrors = false;
                        }
                        if (endIndex < 0) {
                            System.out.println("\nChe! Tenés que ingresar el indice final (" + startIndex + ") mayor o igual que 0 , boludo");
                            hasNotErrors = false;
                        }
                        if (startIndex >= (arrayInt.length)) {
                            System.out.println("\nChe! Tenés que ingresar el indice de partida (" + startIndex + ") menor que " + (arrayInt.length - 1) + ", boludo");
                            hasNotErrors = false;
                        }
                        if (endIndex >= (arrayInt.length)) {
                            System.out.println("\nChe! Tenés que ingresar el indice final (" + endIndex + ") menor que " + (arrayInt.length - 1) + ", boludo");
                            hasNotErrors = false;
                        }
                        if (hasNotErrors) {
                            isNotValid = false;
                            if (endIndex == size -1) {
                                for (int element = startIndex; element < size; element++) {
                                    arrayInt[element] = fillValue;
                                }
                                isNotNumberValid = false;
                            } else {
                                for (int element = startIndex; element < size; element++) {
                                    arrayInt[element] = fillValue;
                                }
                                startIndex = endIndex+1;
                            }
                        }
                    }
                }
            } catch (InputMismatchException e) {
                System.out.println("Error: Tenés que ingresar un número entero y mayor que cero para el tamaño, boludo");
                input.next(); // Limpiar el buffer del scanner
            }
        }

        input.close();
*/
            // Solicitar tamaño del array
            while (true) {
                try {
                    System.out.print("\nIngrese un número entero mayor que 0 para el tamaño del arreglo: ");
                    size = input.nextInt();
                    if (size > 0) {
                        arrayInt = new int[size];
                        break;
                    } else {
                        System.out.println("Error: El tamaño debe ser mayor que 0, boludo");
                    }
                } catch (InputMismatchException e) {
                    System.out.println("Error: Tenés que ingresar un número entero, boludo");
                    input.next(); // Limpiar el buffer
                }
            }

            // Rellenado personalizado por segmentos
            while (startIndex < arrayInt.length) {
                try {
                    System.out.print("\nIngrese un número entero para rellenar desde la posición " + startIndex + ": ");
                    fillValue = input.nextInt();

                    System.out.print("Ingrese la posición final (inclusive) hasta donde rellenar (máx " + (arrayInt.length - 1) + "): ");
                    endIndex = input.nextInt();

                    hasNotErrors = true;

                    // Validaciones
                    if (endIndex < startIndex) {
                        System.out.println("Error: El índice final (" + endIndex + ") debe ser mayor o igual al inicial (" + startIndex + "), boludo");
                        hasNotErrors = false;
                    }
                    if (endIndex >= arrayInt.length) {
                        System.out.println("Error: El índice final (" + endIndex + ") debe ser menor que " + arrayInt.length + ", boludo");
                        hasNotErrors = false;
                    }
                    if (startIndex < 0) {
                        System.out.println("Error: El índice inicial no puede ser negativo, boludo");
                        hasNotErrors = false;
                    }

                    if (hasNotErrors) {
                        // Rellenar el segmento
                        for (int i = startIndex; i <= endIndex; i++) {
                            arrayInt[i] = fillValue;
                        }

                        // Actualizar el siguiente índice inicial
                        startIndex = endIndex + 1;

                        // Mostrar estado actual del array
                        System.out.println("Estado actual del arreglo: " + Arrays.toString(arrayInt));

                        // Verificar si hemos terminado
                        if (startIndex >= arrayInt.length) {
                            System.out.println("\n¡Arreglo completado!");
                            break;
                        }
                    }

                } catch (InputMismatchException e) {
                    System.out.println("Error: Tenés que ingresar un número entero, boludo");
                    input.next(); // Limpiar el buffer
                }
            }

            // Mostrar resultado del arreglo
            System.out.println("\nArreglo resultante:");
            System.out.println("Es: " + Arrays.toString(arrayInt));
        }
    }
}
