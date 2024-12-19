import java.util.InputMismatchException;
import java.util.Random;
import java.util.Scanner;

public class CopiandoElementos {
    public static void main(String[] args) {
        Random random = new Random();
        int[] arrayInt = new int[3];
        int[] arrayIntCopy = new int[arrayInt.length+2];
        int count = 0;
        
        try (Scanner input = new Scanner(System.in)) {
            arrayInt[count] = random.nextInt(1, 101);
            System.out.println("El primer elemento del arreglo, un número entero [" + count + "] es " + arrayInt[count]);
            arrayIntCopy[count] = arrayInt[count];
            count++;
            arrayInt[count] = random.nextInt(1, 101);
            System.out.println("El segundo elemento del arreglo, un número entero  [" + count + "] es " + arrayInt[count]);
            arrayIntCopy[count] = arrayInt[count];
            count++;
            arrayInt[count] = random.nextInt(1, 101);
            System.out.println("El tercer elemento del arreglo, un número entero [" + count + "] es " + arrayInt[count]);
            arrayIntCopy[count] = arrayInt[count];
            count++;
            System.out.println("*********************************************************************");
            System.out.print("Ingresa un número entero que será el "+(count+1)+" elemento del arreglo ");
            arrayIntCopy[count] = input.nextInt();
            count++;
            System.out.print("Ingresa un número entero que será el "+(count+1)+" elemento del arreglo ");
            arrayIntCopy[count] = input.nextInt();
            count = 0;
            System.out.println("*********************************************************************");
            System.out.println("**********************************************************************************************");
            System.out.println("El primer elemento del nuevo arreglo, arreglo de números enteros, [" + count + "] es " + arrayIntCopy[count++]);
            System.out.println("El segundo elemento del nuevo arreglo, arreglo de números enteros, [" +count + "] es " + arrayIntCopy[count++]);
            System.out.println("El tercer elemento del nuevo arreglo, arreglo de números enteros, [" + count + "] es " + arrayIntCopy[count++]);
            System.out.println("El cuarto elemento del nuevo arreglo, arreglo de números enteros, [" + count + "] es " + arrayIntCopy[count++]);
            System.out.println("El quinto elemento del nuevo arreglo, arreglo de números enteros, [" + count + "] es " + arrayIntCopy[count]); 
            System.out.println("**********************************************************************************************");
        } catch (InputMismatchException e) {
            System.out.println("Che boludo un número entero, no cuesta tanto");
        }
    }
}
