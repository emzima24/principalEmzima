import java.util.Scanner;

public class LongitudCadenaSinEspacios {
    public static void main(String[] args) {
        Scanner input = new Scanner(System.in);

        System.out.print("Ingresa ingresa un texto: ");
        String inputText = input.nextLine();
        String textWithoutSpaces = inputText.replace(" ", "");
        System.out.println(
                "La longitud del texto ingresado sin espacios \"" + inputText + "\" es " + textWithoutSpaces.length());
        System.out.println("La longitud del texto ingresado \"" + inputText + "\" es " + inputText.length());
        input.close();
    }
}
