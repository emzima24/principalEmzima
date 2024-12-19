import java.util.Random;

public class SumaPoscionesPares {
        public static void main(String[] args) {
                try {
                        new ProcessBuilder("cmd", "/c", "cls").inheritIO().start().waitFor();
                } catch (Exception e) {
                        e.printStackTrace();
                }

                Random random = new Random();
                int[] arrayInt = new int[5];
                String[] arrayText = { "primer", "segundo", "tercer", "cuarto", "quinto" };
                int count = 0, sumPair = 0, max = 101;

                arrayInt[count] = random.nextInt(1, max);
                System.out.println(
                                "El " + arrayText[count] + " elemento del arreglo, un número entero [" + count + "] es "
                                                + arrayInt[count]);
                sumPair = (count % 2 == 0) ? sumPair + arrayInt[count] : sumPair;
                count++;
                arrayInt[count] = random.nextInt(1, max);
                System.out.println("El " + arrayText[count] + " elemento del arreglo, un número entero  [" + count
                                + "] es "
                                + arrayInt[count]);
                sumPair = (count % 2 == 0) ? sumPair + arrayInt[count] : sumPair;
                count++;
                arrayInt[count] = random.nextInt(1, max);
                System.out.println(
                                "El " + arrayText[count] + " elemento del arreglo, un número entero [" + count + "] es "
                                                + arrayInt[count]);
                sumPair = (count % 2 == 0) ? sumPair + arrayInt[count] : sumPair;
                count++;
                arrayInt[count] = random.nextInt(1, max);
                System.out.println(
                                "El " + arrayText[count] + " elemento del arreglo, un número entero [" + count + "] es "
                                                + arrayInt[count]);
                sumPair = (count % 2 == 0) ? sumPair + arrayInt[count] : sumPair;
                count++;
                arrayInt[count] = random.nextInt(1, max);
                System.out.println("El " + arrayText[count] + " elemento del arreglo, un número entero  [" + count
                                + "] es "
                                + arrayInt[count]);
                sumPair = (count % 2 == 0) ? sumPair + arrayInt[count] : sumPair;

                System.out.println(
                                "*****************************************************************************************");
                System.out.printf(
                                "La Suma de los números en posiciones pares (en el arreglo de números) es %d%n",
                                sumPair);
                System.out.println(
                                "*****************************************************************************************");

        }
}
