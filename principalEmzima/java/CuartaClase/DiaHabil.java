import java.util.Scanner;
public class DiaHabil {
    public static void main(String[] args) {
        Scanner input = new Scanner(System.in);
        String tag = " ";

        System.out.print("Ingresa un número del 1 al 7: ");
        String numberStr = input.nextLine();
        String text = switch (numberStr) {
            case "1" -> {
                tag = "hábil";
                yield "Lunes";}
            case "2" -> {
                tag = "hábil";
                yield "Martes";}
            case "3" -> {
                tag = "hábil";
                yield "Miércoles";}
            case "4" -> {
                tag = "hábil";
                yield "Jueves";}
            case "5" -> {
                tag = "hábil";
                yield "Viernes";}
            case "6" -> {
                tag = "no hábil";
                yield "Sabado";}
            case "7" -> {
                tag = "no hábil";
                yield "Domingo";}
            default -> "No válido";
        };
        System.out.println(
                text.equals("No válido")
                        ? "Boludo un número entre 1 y 7, en serio \"" + numberStr + "\" Dale!"
                        : "Para el número \""+numberStr+"\", el día de la semana es " + text+ " y es "+tag
                                + "\"");
        input.close();
    }
}