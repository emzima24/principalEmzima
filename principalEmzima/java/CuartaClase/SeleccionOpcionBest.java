import java.util.Scanner;

public class SeleccionOpcionBest {
    public static void main(String[] args) {
        Scanner input = new Scanner(System.in);

        System.out.println("Ingresa una de las siguientes opciones: ");
        System.out.println("Opción 1: Guardar");
        System.out.println("Opción 2: Cargar");
        System.out.println("Opción 3: Salir");
        String option = input.nextLine();
        String result = switch (option) {
            case "1" -> "Guardar";
            case "2" -> "Cargar";
            case "3" -> "Salir";
            default ->  "No válido";
        };
        System.out.println(
                result.equals("No válido")
                        ? "Boludo un número entre 1 y 3, en serio \"" + option + "\" Dale!"
                        : "Con la selección de \"" + option + "\" corresponde con \"" + result
                                + "\"");
        input.close();
    }
}
