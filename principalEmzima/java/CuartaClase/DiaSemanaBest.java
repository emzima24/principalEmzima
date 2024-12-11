import java.util.Scanner;

public class DiaSemanaBest {
    public static void main(String[] args) {
        Scanner input = new Scanner(System.in);

        System.out.print("Ingresa un número del 1 al 7: ");
        String numberStr = input.nextLine();
        String text = switch (numberStr) {
            case "1" -> "Lunes";
            case "2" -> "Martes";
            case "3" -> "Miércoles";
            case "4" -> "Jueves";
            case "5" -> "Viernes";
            case "6" -> "Sabado";
            case "7" -> "Domingo";
            default -> "No válido";
        };
        System.out.println(
                text.equals("No válido")
                        ? "Boludo un número entre 1 y 7, en serio \"" + numberStr + "\" Dale!"
                        : "Para el número \""+numberStr+"\", el día de la semana es " + text
                                + "\"");
        input.close();
    }

}