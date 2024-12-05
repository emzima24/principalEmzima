import java.util.Scanner;

public class ComplementarioEdad {
    public static void main(String[] args) {
        final int CURRENTYEAR = 2024;
        Scanner input = new Scanner(System.in);

        System.out.print("Ingresa tu año de nacimiento: ");
        int yearOfBirth = input.nextInt();
        boolean isLegalAge = CURRENTYEAR - yearOfBirth > 18; 
        String greater = isLegalAge ? "Si, es mayor" : "No, no es mayor"; 
        System.out.println("Para el año de nacimiento "+ yearOfBirth +" es mayor de edad? "+ greater);
        input.close();
        }
}
