import java.util.Scanner;

public class EliminacioEspacios {
    public static void main(String[] args) {
        Scanner input = new Scanner(System.in);

        System.out.print("Ingresa un texto con espacios en blanco al inicio y/o al final: ");
        String inputText = input.nextLine();
        // String textWithoutSpaces = inputText.replace(" ", "");
        System.out.println(
                "El texto ingresado sin espacios al inicio ni al final \"" + inputText.trim() + "\"");
        System.out.println("El texto ingresado original \"" + inputText + "\"");
        input.close();
    }
}
