import java.util.Random;

public class SumandoElementos {
    public static void main(String[] args) {
        Random random = new Random();
        int[] arrayInt = new int[3];
        int count = 0;
        int sum = 0;
        arrayInt[count] = random.nextInt(0, 101);
        System.out.println("El primer elemento del arreglo [" + count + "] " + arrayInt[count]);
        sum += arrayInt[count];
        count++;
        arrayInt[count] = random.nextInt(0, 101);
        System.out.println("El segundo elemento del arreglo [" + count + "] " + arrayInt[count]);
        sum += arrayInt[count];
        count++;
        arrayInt[count] = random.nextInt(0, 101);
        System.out.println("El tercer elemento del arreglo [" + count + "] " + arrayInt[count]);
        sum += arrayInt[count];
        System.out.println("******************************************");
        System.out.println("La suma de los elementos del arreglo " + sum);
        System.out.println("******************************************");
    }
}
