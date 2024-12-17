import java.text.DecimalFormat;
import java.util.Scanner;

public class AleatorioAnalisisRaiz {
    public static void main(String[] args) {
                Scanner input = new Scanner(System.in);
        try {
            System.out.print("Ingresa un número entero límite: ");
            int limitNumber = Integer.parseInt(input.nextLine());
            
            int numberCast = (int) (Math.random()*limitNumber+1);
            if (number < 0) {
                System.out.println("La raiz cuadarada de un número negativo es un número complejo ahora no es el tema");
            } else {
                System.out.println("La raíz cuadrada del número entero (" + number + ") es " + Math.sqrt(number));
            }
            
            System.out.println("El número aleatorio,dentro de los \nlímites desde "+limitNumber+" hasta "+numberHigh+" es, "+formattedNumber);
            System.out.println("El número aleatorio,dentro de los \nlímites desde "+limitNumber+" hasta "+numberHigh+" es, "+numberCast);
            
            
        } catch (NumberFormatException e) {
            System.out.println("Che boludo un número entero, no cuesta tanto.");
        }
        input.close();
    }
}
