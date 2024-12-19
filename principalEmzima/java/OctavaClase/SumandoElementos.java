import java.util.Random;

public class SumandoElementos {
    public static void main(String[] args) {
        int count = 0;
        float sum = 0;
        Random random = new Random();
        float[] arrayFloat = new float[3];
        arrayFloat[count] = random.nextFloat(0, 101);
        System.out.println("El primer elemento del arreglo [" + count + "] " + arrayFloat[count]);
        sum += arrayFloat[count];
        count++;
        arrayFloat[count] = random.nextFloat(0, 101);
        System.out.println("El segundo elemento del arreglo [" + count + "] " + arrayFloat[count]);
        sum += arrayFloat[count];
        count++;
        arrayFloat[count] = random.nextFloat(0, 101);
        System.out.println("El tercer elemento del arreglo [" + count + "] " + arrayFloat[count]);
        sum += arrayFloat[count];
        System.out.println("La suma de los elementos del arreglo " + sum);
    }
}
