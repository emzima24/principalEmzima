//        Crea un menú interactivo con 5 opciones para que el usuario elija, como por ejemplo:
//        Comprar producto.
//        Realizar devolución.
//        Ver mis pedidos.
//        Preguntas frecuentes.
//        Salir.
//        Luego, solicita al usuario que elija una opción del menú mostrado en pantalla.
//        El menú debe seguir apareciendo hasta que el usuario elija la opción para salir del programa.
//        En este ejercicio, no es necesario que las opciones del menú realicen acciones reales,
//        simplemente muestra un mensaje que indique qué opción eligió el usuario.


import java.util.InputMismatchException;
import java.util.Scanner;

public class MenuInteractivo {
    public static void main(String[] args) {
        Scanner input = new Scanner(System.in);
        int choice;

        do {
            // Mostrar el menú
            System.out.println("\nPor favor, seleccione una opción del menú:");
            System.out.println("1. Comprar producto");
            System.out.println("2. Realizar devolución");
            System.out.println("3. Ver mis pedidos");
            System.out.println("4. Preguntas frecuentes");
            System.out.println("5. Salir");
            System.out.print("Ingrese su opción (1-5): ");

            try {
                choice = input.nextInt();
                String message;

                switch (choice) {
                    case 1:
                        message = "Opción seleccionada: Comprar producto";
                        break;
                    case 2:
                        message = "Opción seleccionada: Realizar devolución";
                        break;
                    case 3:
                        message = "Opción seleccionada: Ver mis pedidos";
                        break;
                    case 4:
                        message = "Opción seleccionada: Preguntas frecuentes";
                        break;
                    case 5:
                        message = "Saliendo del programa...";
                        break;
                    default:
                        message = "Opción no válida. Por favor ingrese un número entre 1 y 5.";
                        break;
                }

                System.out.println(message);

                // Si la opción no está entre 1-5, continuamos mostrando el menú
                if (choice < 1 || choice > 5) {
                    continue;
                }

            } catch (InputMismatchException e) {
                System.out.println("Error: Debe ingresar un número entero.");
                input.next(); // Limpiar el buffer del scanner
                choice = 0; // Continuar el bucle
            }

        } while (choice != 5);

        input.close();
    }
}
