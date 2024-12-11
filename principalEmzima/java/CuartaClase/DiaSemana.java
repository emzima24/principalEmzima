import java.util.Scanner;

public class DiaSemana {
    public static void main(String[] args) {
        Scanner input = new Scanner(System.in);

        String text = "No válida";
        System.out.print("Ingresa un número del 1 al 7: ");
        String numberStr = input.nextLine();
        switch (numberStr) {
            case "1":
                text = "Lunes";
                break;
            case "2":
                text = "Martes";
                break;
            case "3":
                text = "Miércoles";
                break;
            case "4":
                text = "Jueves";
                break;
            case "5":
                text = "Viernes";
                break;
            case "6":
                text = "Sábado";
                break;
            case "7":
                text = "Domingo";
                break;
        }
        System.out.println(
                text.equals("No válido")
                        ? "Boludo un número entre 1 y 7, en serio \"" + numberStr + "\" Dale!"
                        : "Para el número \"" + numberStr + "\", el día de la semana es " + text
                        );
        input.close();
    }

}