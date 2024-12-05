import java.util.Locale;
import java.util.Scanner;
import java.util.Random;

public class OperadoresRelacionalesLogicos {
    public static void main(String[] args) {
        Random random = new Random();
        Scanner input = new Scanner(System.in);
        input.useLocale(Locale.US);
    
        //System.out.print("Ingresa el primer número: ");
        //float number1 = input.nextFloat();
        //System.out.print("Ingresa el segundo número: ");
        //float number2 = input.nextFloat();
        float number1 = random.nextFloat(101);
        float number2 = random.nextInt(101);
       
        boolean isGreater = number1 > number2; 
        boolean isDistinct = number1 != number2; 
        boolean isDivisibleBy = number2 % 2 == 0;
        String greater = isGreater ? "Si, es mayor" : "No, no es mayor"; 
        String distinct = isDistinct ? "Si, es distinto" : "No, no es igual"; 
        String divisibleBy = isDivisibleBy ? "Si, es divisible" : "No, no es divisible";  
        System.out.println("El número "+ number1 +" es mayor que "+ number2 +"? "+ greater);
        System.out.println("El número "+ number1 +" es distinto que "+ number2 +"? "+ distinct);
        System.out.println("El número "+ number2 +" es divisible entre 2? "+ divisibleBy);

        //System.out.print("Ingresa el tercer número: ");
        //float number3 = input.nextFloat();
        //System.out.print("Ingresa el cuarto número: ");
        //float number4 = input.nextFloat();
        float number3 = random.nextFloat(101);
        float number4 = random.nextInt(101);
        boolean isGreater2 = number3 > number4;
        String greater2 = isGreater2 ? "Si, es mayor" : "No, no es mayor"; 

       
        boolean isGreaterAnd = isGreater && isGreater2; 
        boolean isGreaterOr = isGreater || isGreater2;
        String greaterAnd = isGreaterAnd ? "Verdadera" : "Falsa"; 
        String greaterOr = isGreaterOr ? "Verdadera" : "Falsa"; 

        System.out.print("El número "+ number1 +" es mayor que "+ number2 +"? ("+greater+")");
        System.out.println(" Y El número "+ number3 +" es mayor que "+ number4 +"? ("+greater2+") por tanto la operación lógica Y es "+ greaterAnd);
        System.out.print("El número "+ number1 +" es mayor que "+ number2 +"? ("+greater+")");
        System.out.println(" O El número "+ number3 +" es mayor que "+ number4 +"? ("+greater2+") por tanto la operación lógica O es "+ greaterOr);
        input.close();
        }
}
