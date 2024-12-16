import java.util.Locale;
import java.util.Scanner;

public class PracticandoEstructurasControl {
        public static void main(String[] args) {
            Scanner input = new Scanner(System.in);
            input.useLocale(Locale.US);

            System.out.print("Ingresa un número entre 0 y 100: ");
            float number = input.nextFloat();
            if ((number < 60) && (number >= 0)) {
                System.out.println("Dado que tu calificación es "+number+" tu escala es F");
            } else if ((number < 70) && (number >= 60))  {
                System.out.println("Dado que tu calificación es "+number+" tu escala es D");
            } else if ((number < 80) && (number >= 70))  {
                System.out.println("Dado que tu calificación es "+number+" tu escala es C");
            } else if ((number < 90) && (number >= 80))  {
                System.out.println("Dado que tu calificación es "+number+" tu escala es B");
            } else if ((number <= 100) && (number >= 90))  {
                System.out.println("Dado que tu calificación es "+number+" tu escala es A");                      
            } else {
                System.out.println("Che boludo un número entre 0 y 100, no el "+number+" dale!");
            }
            input.close();
        }
}
