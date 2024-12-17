import java.util.Scanner;

public class CalculoPotenciaOtra {
    public static void main(String[] args) {
        Scanner input = new Scanner(System.in);
        System.out.print("Ingresa un número entero base para una potencia: ");
        int base = input.hasNextInt() ? input.nextInt() : 0;
        input.nextLine();
        System.out.print("Ingresa un número entero exponente para una potencia: ");
        int exponente = input.hasNextInt() ? input.nextInt() : 0;

        System.out.println("Si COLOCASTE algo distinto a un entero; coloca por defecto la base 0 y el exponente 0");
        System.out.println("el resultado de elevar " + base + " a la " + exponente + ": " + Math.pow(base, exponente));

        input.close();
    }
}
