import java.util.Random;

public class ImprimiendoElementos {
    public static void main(String[] args) {
        Random random = new Random();
        int numberArray = random.nextInt(1, 25), index = 0;
        int[] arrayInt = new int[numberArray];
        for (int element= 0; element < arrayInt.length ; element++) {
            arrayInt[element] = random.nextInt(1,100);
        }
        System.out.println("Para un arreglo de longitud: " + arrayInt.length);
        for (int numberInt : arrayInt) {
            System.out.println("El elemento ["+index+"] es " + numberInt);
            ++index;
        }
    }
}
