import java.util.Random;

public class EncontrandoMinimos {
    public static void main(String[] args) {
        Random random = new Random();
        int numberArray = random.nextInt(2, 25), index = 0;
        int[] arrayInt = new int[numberArray];
        for (int element= 0; element < arrayInt.length ; element++) {
            arrayInt[element] = random.nextInt(1,100);
        }
        int min = arrayInt[0];
        for (int numberInt : arrayInt) {
            if (numberInt < min) {
                min = numberInt;
            }
        }
        System.out.println("Para un arreglo de longitud: " + arrayInt.length);
        System.out.print("Constituido por: [");
        for (int numberInt : arrayInt) {
            System.out.print(numberInt);
            if (index < arrayInt.length -1) {
                System.out.print(",");
            } else {
                System.out.println("]");
            }
            index++;
        }
        System.out.println("El valor minimo es " + min);
    }
}
