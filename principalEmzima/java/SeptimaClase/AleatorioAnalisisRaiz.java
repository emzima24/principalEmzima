import java.util.Scanner;

public class AleatorioAnalisisRaiz {
    public static void main(String[] args) {
        Scanner input = new Scanner(System.in);
        try {
            System.out.print("Ingresa un número entero límite: ");
            int limitNumber = Integer.parseInt(input.nextLine());

            if (limitNumber < 0 || limitNumber > 30) {
                throw new IllegalArgumentException("El número solo puede estar entre 0 y 30.");
            }
            int numberCast = (int) (Math.random() * limitNumber + 1);

            System.out.println(
                    "El número aleatorio,dentro de los \nlímites desde 1 hasta " + limitNumber + " es, " + numberCast);
            System.out.println("La raíz cuadrada del número entero (" + numberCast + ") es " + Math.sqrt(numberCast));

            String result = switch (numberCast) {
                case 1 -> "NO es primo";
                case 2, 3 -> "es primo";
                default -> {
                    if (numberCast % 2 == 0 || numberCast % 3 == 0) {
                        yield "NO es primo";
                    } else {
                        yield "es primo";

                    }
                }
            };

            System.out.println("El número aleatorio "+result);

        } catch (NumberFormatException e) {
            System.out.println("Che boludo un número entero, no cuesta tanto.");
        } catch (IllegalArgumentException e) {
            System.out.println(e.getMessage());
        } finally {
            input.close();
        }
    }
}
