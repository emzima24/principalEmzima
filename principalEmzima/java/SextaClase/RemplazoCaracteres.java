import java.util.Scanner;

public class RemplazoCaracteres {
    public static void main(String[] args) {
        Scanner input = new Scanner(System.in);

        System.out.print("Ingresa un texto: ");
        String inputText = input.nextLine();
        System.out.print("Ingresa la letra a sustituir: ");
        String letterToReplace = input.nextLine();
        System.out.print("Ingresa la letra sustituto: ");
        String substituteLetter = input.nextLine();
        if ((inputText.indexOf(letterToReplace) >= 0)) {
            String textWithChanges = inputText.replace(letterToReplace, substituteLetter);
            System.out.println("El texto ingresado es \"" + inputText + "\"");
            System.out.println("El texto luego del remplazo es \"" + textWithChanges + "\"");
        } else {
            System.out.println("La letra que se va a sustituir debe estar en el texto boludo");
        }
        input.close();
    }
}
