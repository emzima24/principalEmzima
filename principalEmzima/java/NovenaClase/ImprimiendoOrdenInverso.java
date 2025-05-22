import java.util.Random;

public class ImprimiendoOrdenInverso {
    public static void main(String[] args) {
        Random random = new Random();
        int numberArray = random.nextInt(1, 25), index = 0;
        int[] arrayInt = new int[numberArray];
        for (int element= 0; element < arrayInt.length ; element++) {
            arrayInt[element] = random.nextInt(1,100);
        }
        System.out.print("Para un arreglo de longitud: " + arrayInt.length);
        System.out.print(", Constituido por: [");
        for (int numberInt : arrayInt) {
            System.out.print(numberInt);
            if (index < arrayInt.length -1) {
                System.out.print(",");
            } else {
                System.out.println("]");
            }
            index++;
        }
        System.out.print("Ordenado en orden inverso es: [");
        for (int element = arrayInt.length-1; element >= 0 ; element--) {
            System.out.print(arrayInt[element]);
            if (element > 0) {
                System.out.print(",");
            } else {
                System.out.println("]");
            }
        }
    }
}
