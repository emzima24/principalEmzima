import java.util.Scanner;

public class ConversionMayusculasMinusculas {
    public static void main(String[] args) {
        Scanner input = new Scanner(System.in);

        System.out.print("Ingresa un texto: ");
        String wordString = input.nextLine();
        System.out.print("Si los queres en mayúsculas introduce (1)\si los queres en minúsculas introduce (2)");
        String option = input.nextLine();
        System.out.println(
                (option.equals("1")) ? "El texto en mayúsculas es " + wordString.toUpperCase()
                        : (option.equals("2")) ? "El texto en mminúsculas es " + wordString.toLowerCase()
                                : "Che un numero entre 1 y 2 no estan dificil " + option + "en serio!");
        input.close();
    }
}
