import java.util.Scanner;

public class ClaseScanner {
    public static void main(String[] args) {
        Scanner input = new Scanner(System.in);
        System.out.print("Ingresa tu nombre: ");
        String name = input.nextLine();
        System.out.print("Ingresa tu edad: ");
        int edad = input.nextInt();
        System.out.println("Su nombre es "+ name +" y su edad es "+ edad);
        input.close();
        }
}