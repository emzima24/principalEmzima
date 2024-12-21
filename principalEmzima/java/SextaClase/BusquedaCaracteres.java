import java.util.Scanner;

public class BusquedaCaracteres {
    public static void main(String[] args) {
        Scanner input = new Scanner(System.in);

        System.out.print("Ingresa una palabra: ");
        String wordString = input.nextLine();
        System.out.print("Ingresa un caracter: ");
        String letter = input.nextLine();
        String result = (wordString.indexOf(letter) >= 0) ? "si se encuentra":
        "no se encuentra";
        System.out.println("En la palabra "+wordString+" la letra "+letter+", " + result);
        input.close();
    }
}
