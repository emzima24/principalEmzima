import java.util.Locale;
import java.util.Scanner;

public class Divisibilidad {
           public static void main(String[] args) {
            Scanner input = new Scanner(System.in);
            input.useLocale(Locale.US);

            System.out.print("Ingresa un número: ");
            float number = input.nextFloat();
            if ((number % 5==0) && (number % 3== 0)) {
                System.out.println("El número  "+number+" es divisible entre 3 y entre 5");
            } else if ((number % 5!=0) && (number % 3!= 0))  {
                System.out.println("El número  "+number+" no es divisible entre 3 ni entre 5");
            } else if (number % 5==0)  {
                System.out.println("El número  "+number+" es divisible entre 5");
            } else {
                System.out.println("El número  "+number+" es divisible entre 3");
            }
            input.close();
        }
}

