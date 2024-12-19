import java.util.Random;

public class SumandoElementos {
    public static void main(String[] args) {
        Random random = new Random();
        int[] arrayInt = new int[3];
        String[] arrayText = { "primer", "segundo", "tercer" };
        int count = 0, sum = 0, max = 101;
        arrayInt[count] = random.nextInt(0, max);
        System.out.println("El " + arrayText[count] + " elemento del arreglo [" + count + "] " + arrayInt[count]);
        sum += arrayInt[count];
        count++;
        arrayInt[count] = random.nextInt(0, max);
        System.out.println("El " + arrayText[count] + " elemento del arreglo [" + count + "] " + arrayInt[count]);
        sum += arrayInt[count];
        count++;
        arrayInt[count] = random.nextInt(0, max);
        System.out.println("El " + arrayText[count] + " elemento del arreglo [" + count + "] " + arrayInt[count]);
        sum += arrayInt[count];
        System.out.println("******************************************");
        System.out.println("La suma de los elementos del arreglo " + sum);
        System.out.println("******************************************");
    }
}
