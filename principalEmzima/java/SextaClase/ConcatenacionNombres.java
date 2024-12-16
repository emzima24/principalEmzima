import java.util.Scanner;

public class ConcatenacionNombres {
    public static void main(String[] args) {
        Scanner input = new Scanner(System.in);

        System.out.print("Ingresa el nombre: ");
        String firstName = input.nextLine();
        System.out.print("Ingresa el apellido: ");
        String lastName = input.nextLine();
        System.out.println("La contatenación del nombre y el apellido es " + firstName.concat(" ").concat(lastName));
        input.close();
    }
}
