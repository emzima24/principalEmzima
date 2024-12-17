import java.util.Scanner;

public class AleatorioEntreLimites {
    public static void main(String[] args) {
        Scanner input = new Scanner(System.in);
        System.out.print("Ingresa un número entero límite bajo (positivo) si no cumples lo establecido se asignará 0: ");
        int tempLow = input.hasNextInt() ? input.nextInt() : 0;
        int numberLow = tempLow >= 0 ? tempLow : 0;
        input.nextLine();

        System.out.print(
                "Ingresa un número entero límite alto (mayor o igual al límite bajo)\n  si no cumples lo establecido se asignará 0 o el mismo valor que el bajo: ");
        int tempHigh = input.hasNextInt() ? input.nextInt() : 0;
        int numberHigh = tempHigh >= numberLow ? tempHigh : numberLow;
        input.nextLine();

        int randomInt = (int) (Math.random() * (numberHigh - numberLow + 1)) + numberLow;

        System.out.println("El número aleatorio, dentro de los límites desde " + numberLow + " hasta " + numberHigh
                + " es, " + randomInt);

        input.close();

        // Scanner input = new Scanner(System.in);
        // try {
        // System.out.print("Ingresa un número entero límite bajo: ");
        // int numberLow = Integer.parseInt(input.nextLine());
        // System.out.print("Ingresa un número entero límite alto: ");
        // int numberHigh = Integer.parseInt(input.nextLine());

        // double number = Math.floor(Math.random() * (numberHigh + 1) + numberLow);
        // DecimalFormat df = new DecimalFormat("#");
        // String formattedNumber = df.format(number);

        // int numberCast = (int) (Math.random() * numberHigh + numberLow);

        // System.out.println("El número aleatorio,dentro de los \nlímites desde " +
        // numberLow + " hasta " + numberHigh
        // + " es, " + formattedNumber);
        // System.out.println("El número aleatorio,dentro de los \nlímites desde " +
        // numberLow + " hasta " + numberHigh
        // + " es, " + numberCast);

        // } catch (NumberFormatException e) {
        // System.out.println("Che boludo un número entero, no cuesta tanto.");
        // }
        // input.close();
    }
}
