import java.util.Scanner;

public class ConversionCalificaciones {
    public static void main(String[] args) {
        Scanner input = new Scanner(System.in);
        String result = "No válido";

        System.out.print("Ingresa una calificaficación del 1 al 5: ");
        String qualification = input.nextLine();
        switch (qualification) {
            case "1":
                result = "Muy deficiente";
                break;
            case "2":
                result = "Deficiente";
                break;
            case "3":
                result = "Suficiente";
                break;
            case "4":
                result = "Notable";
                break;
            case "5":
                result = "Sobresaliente";
                break;
        }
        System.out.println(
                result.equals("No válido")
                        ? "Boludo un número entre 1 y 5, en serio \"" + qualification + "\" Dale!"
                        : "Con una calificación de \"" + qualification + "\" en letras corresponde con \"" + result
                                + "\"");
        input.close();
    }
}
