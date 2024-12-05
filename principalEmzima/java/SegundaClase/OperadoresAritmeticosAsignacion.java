import java.util.Random;
import java.util.Scanner;
import java.util.Locale;

public class OperadoresAritmeticosAsignacion {
    public static void main(String[] args) {
        Random random = new Random();
        Scanner input = new Scanner(System.in);
        input.useLocale(Locale.US);

        float number1 = random.nextFloat(11);
        float number2 = random.nextInt(10,101);
        float sum = number1 + number2;
        float product = number1 * number2;
        float quotient = number2 / number1;
        float mod = number2 % number1;
        double power = Math.pow(number2,2);
        
        System.out.println("La suma de  "+ number1 +" y "+ number2 +" es "+sum);
        System.out.println("El producto de  "+ number1 +" por "+ number2 +" es "+product);
        System.out.println("La división de  "+ number2 +" entre "+ number1 +" es "+quotient);
        System.out.println("El modulo de la división de "+ number2 +" entre "+ number1 +" es "+mod);
        System.out.println("El cuadrado de "+ number2 +" es "+power);
        

        System.out.print("Ingresa el primer número: ");
        float number3 = input.nextFloat();
        System.out.print("Ingresa el segundo número: ");
        float number4 = input.nextFloat();
        float sum2 = number3 + number4;
        System.out.println("La suma de  "+ number3 +" y "+ number4 +" es "+sum2);
        input.close();
        }
}
