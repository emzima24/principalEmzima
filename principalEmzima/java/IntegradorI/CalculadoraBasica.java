import java.util.Locale;
import java.util.Scanner;

public class CalculadoraBasica {
    public static void main(String[] args) {
        Scanner input = new Scanner(System.in);
        input.useLocale(Locale.US);
        
        System.out.print("Ingresa un número: ");
        float number1 = input.nextFloat();
        System.out.print("Ingresa otro número: ");
        float number2 = input.nextFloat();
        
        System.out.println("Selecciona una opción: ");
        System.out.println("siempre será Primer número operacíon segundo número: ");
        System.out.println("a) Suma: ");
        System.out.println("b) Resta: ");
        System.out.println("c) Multiplicación: ");
        System.out.println("d) Division: ");
        char choice = input.next().charAt(0);
        String result = (choice == 'a') ?
            "El resultado de la suma es " + (number1+number2) : 
            (choice == 'b') ?
            "El resultado de la resta es " + (number1-number2) :
            (choice == 'c') ?
            "El resultado de la multiplicación es " + (number1*number2) :
            (choice == 'd') ?
            (number2 != 0) ?
            "El resultado de la división es " + (number1/number2) :
            "No puede dividirse entre 0 ¿es en serio?" :
            "Seleccionar una letra de entre (a,b,c,d) no estan díficil Boludo";
        System.out.println(result);
        
        input.close();
    }
}
