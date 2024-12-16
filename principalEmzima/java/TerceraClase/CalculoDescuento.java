import java.util.Locale;
import java.util.Scanner;

public class CalculoDescuento {
        public static void main(String[] args) {
            Scanner input = new Scanner(System.in);
            input.useLocale(Locale.US);
            float discount = 0.10f;

            System.out.print("Ingresa el precio del prodcuto: ");
            float price = input.nextFloat();
            if (price < 0) {
                System.out.printf("El precio no puede ser negativo boludo y le mandas %.2f, dale!",price);
             } else if (price >= 100) {
               System.out.printf("El precio que debes pagar es %.2f, incluye un descuento del 10%%",(price*(1-discount)));
            } else {
               System.out.printf("El precio que debes pagar es %.2f",price);
            }
            input.close();
        }
}
