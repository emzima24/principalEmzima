import java.util.Scanner;

public class ParOImpar {
    public static void main(String[] args) {
        Scanner input = new Scanner(System.in);
        
        System.out.print("Ingresa un número: ");
        float  number = input.nextFloat();
        String message = (number %2 == 0) ? " es par": " es impar";
        System.out.println("El número "+number+message);
        input.close();
    }
}
