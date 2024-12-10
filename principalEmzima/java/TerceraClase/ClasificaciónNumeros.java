import java.text.DecimalFormat;
import java.util.Locale;
import java.util.Scanner;

public class ClasificaciónNumeros {
    public static void main(String[] args) {
        Scanner input = new Scanner(System.in);
        input.useLocale(Locale.US);
        
        System.out.print("Ingresa un número: ");
        float number = input.nextFloat();
        DecimalFormat df = new DecimalFormat("#.##");
        String formattedNumber = df.format(number);
        if (number > 0) {
            System.out.println("El número "+formattedNumber+" es mayor que 0");
        } else if (number < 0) {
            System.out.println("El número "+formattedNumber+" es menor que 0");
        } else {
            System.out.println("El número "+formattedNumber+" es igual a 0");
        }
        input.close();
    }
}