import java.util.Scanner;

public class SeleccionOpcion {
    public static void main(String[] args) {
        Scanner input = new Scanner(System.in);
        String result = "No válido";

        System.out.println("Ingresa una de las siguientes opciones: ");
        System.out.println("Opción 1: Guardar");
        System.out.println("Opción 2: Cargar");
        System.out.println("Opción 3: Salir");
        String option = input.nextLine();
        switch (option) {
            case "1":
                result = "Guardar";
                break;
            case "2":
                result = "Cargar";
                break;
            case "3":
                result = "Salir";
                break;
        }
        System.out.println(
                result.equals("No válido")
                        ? "Boludo un número entre 1 y 3, en serio \"" + option + "\" Dale!"
                        : "Con la selección de \"" + option + "\" corresponde con \"" + result
                                + "\"");
        input.close();
    }
}
