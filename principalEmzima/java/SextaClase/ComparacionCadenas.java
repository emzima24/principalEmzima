import java.util.Scanner;

public class ComparacionCadenas {
    public static void main(String[] args) {
        Scanner input = new Scanner(System.in);

        System.out.print("Ingresa la primera palabra: ");
        String firstWord = input.nextLine();
        System.out.print("Ingresa la segunda palabra: ");
        String lastWord = input.nextLine();
        String result = (firstWord.equals(lastWord)) ? "igual" : "diferente";
        System.out.println(
                "La palabra ingresada \"" + firstWord + "\" es " + result + "\na la palabra ingresada \"" + lastWord
                        + "\"");
        input.close();
    }
}
