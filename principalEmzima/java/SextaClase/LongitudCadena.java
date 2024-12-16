import java.util.Scanner;

public class LongitudCadena {
    public static void main(String[] args) {
        Scanner input = new Scanner(System.in);

        System.out.print("Ingresa un texto: ");
        String texString = input.nextLine();
        System.out.println("La longitud del texto ingresado " + texString + " es " + texString.length());
        input.close();
    }
}
