import java.util.Scanner;

public class ConversionCalificacionesBest {
    public static void main(String[] args) {
        Scanner input = new Scanner(System.in);

        System.out.print("Ingresa una calificaficación del 1 al 5: ");
        String qualification = input.nextLine();
        String result = switch (qualification) {
            case "1" -> "Muy deficiente";
            case "2" -> "Deficiente";
            case "3" -> "Suficiente";
            case "4" -> "Notable";
            case "5" -> "Sobresaliente";
            default -> "No válido";
        };
        System.out.println(
                result.equals("No válido")
                        ? "Boludo un número entre 1 y 5, en serio \"" + qualification + "\" Dale!"
                        : "Con una calificación de \"" + qualification + "\" en letras corresponde con \"" + result
                                + "\"");
        input.close();
    }
}
