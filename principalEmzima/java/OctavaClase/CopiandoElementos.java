// import java.util.Arrays;
import java.util.InputMismatchException;
import java.util.Random;
import java.util.Scanner;

public class CopiandoElementos {
    public static void main(String[] args) {
        Random random = new Random();
        int[] arrayInt = new int[3], arrayIntCopy = new int[arrayInt.length+2];
        // int[] arrayIntCopy = Arrays.copyOf(arrayInt, arrayInt.length + 2);
        String[] arrayText = {"primer","segundo","tercer","cuarto","quinto"};
        int count = 0, max = 101;
        
        try (Scanner input = new Scanner(System.in)) {
            arrayInt[count] = random.nextInt(1, max);
            System.out.println("El "+arrayText[count]+" elemento del arreglo, un número entero [" + count + "] es " + arrayInt[count]);
            arrayIntCopy[count] = arrayInt[count];
            count++;
            arrayInt[count] = random.nextInt(1, max);
            System.out.println("El "+arrayText[count]+" elemento del arreglo, un número entero  [" + count + "] es " + arrayInt[count]);
            arrayIntCopy[count] = arrayInt[count];
            count++;
            arrayInt[count] = random.nextInt(1, max);
            System.out.println("El "+arrayText[count]+" elemento del arreglo, un número entero [" + count + "] es " + arrayInt[count]);
            arrayIntCopy[count] = arrayInt[count];
            count++;
            System.out.println("*********************************************************************");
            System.out.print("Ingresa un número entero que será el "+arrayText[count]+" elemento del nuevo arreglo ");
            arrayIntCopy[count] = input.nextInt();
            count++;
            System.out.print("Ingresa un número entero que será el "+arrayText[count]+" elemento del nuevo arreglo ");
            arrayIntCopy[count] = input.nextInt();
            count = 0;
            System.out.println("*********************************************************************");
            System.out.println("**********************************************************************************************");
            System.out.println("El "+arrayText[count]+" elemento del nuevo arreglo, arreglo de números enteros, [" + count + "] es " + arrayIntCopy[count++]);
            System.out.println("El "+arrayText[count]+" elemento del nuevo arreglo, arreglo de números enteros, [" +count + "] es " + arrayIntCopy[count++]);
            System.out.println("El "+arrayText[count]+" elemento del nuevo arreglo, arreglo de números enteros, [" + count + "] es " + arrayIntCopy[count++]);
            System.out.println("El "+arrayText[count]+" elemento del nuevo arreglo, arreglo de números enteros, [" + count + "] es " + arrayIntCopy[count++]);
            System.out.println("El "+arrayText[count]+" elemento del nuevo arreglo, arreglo de números enteros, [" + count + "] es " + arrayIntCopy[count]); 
            System.out.println("**********************************************************************************************");
        } catch (InputMismatchException e) {
            System.out.println("Che boludo un número entero, no cuesta tanto");
        }
    }
}
