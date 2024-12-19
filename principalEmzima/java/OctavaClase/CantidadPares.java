import java.util.Random;

public class CantidadPares {
        public static void main(String[] args) {
                Random random = new Random();
                int[] arrayInt = new int[6];
                String[] arrayText = { "primer", "segundo", "tercer", "cuarto", "quinto", "sexto" };
                int count = 0, countPair = 0, max = 101;

                arrayInt[count] = random.nextInt(1, max);
                System.out.println(
                                "El " + arrayText[count] + " elemento del arreglo, un número entero [" + count + "] es "
                                                + arrayInt[count]);
                countPair = (arrayInt[count] % 2 == 0) ? countPair + 1 : countPair;
                count++;
                arrayInt[count] = random.nextInt(1, max);
                System.out.println("El " + arrayText[count] + " elemento del arreglo, un número entero  [" + count
                                + "] es "
                                + arrayInt[count]);
                countPair = (arrayInt[count] % 2 == 0) ? countPair + 1 : countPair;
                count++;
                arrayInt[count] = random.nextInt(1, max);
                System.out.println(
                                "El " + arrayText[count] + " elemento del arreglo, un número entero [" + count + "] es "
                                                + arrayInt[count]);
                countPair = (arrayInt[count] % 2 == 0) ? countPair + 1 : countPair;
                count++;
                arrayInt[count] = random.nextInt(1, max);
                System.out.println(
                                "El " + arrayText[count] + " elemento del arreglo, un número entero [" + count + "] es "
                                                + arrayInt[count]);
                countPair = (arrayInt[count] % 2 == 0) ? countPair + 1 : countPair;
                count++;
                arrayInt[count] = random.nextInt(1, max);
                System.out.println("El " + arrayText[count] + " elemento del arreglo, un número entero  [" + count
                                + "] es "
                                + arrayInt[count]);
                countPair = (arrayInt[count] % 2 == 0) ? countPair + 1 : countPair;
                count++;
                arrayInt[count] = random.nextInt(1, max);
                System.out.println(
                                "El " + arrayText[count] + " elemento del arreglo, un número entero [" + count + "] es "
                                                + arrayInt[count]);
                countPair = (arrayInt[count] % 2 == 0) ? countPair + 1 : countPair;
                System.out.println(
                                "*****************************************************************************************");
                System.out.printf(
                                "La cantidad de números pares (en el arreglo de números) es %d de los %d elementos que tiene%n",
                                countPair, (arrayInt.length));
                System.out.println(
                                "*****************************************************************************************");

        }
}
