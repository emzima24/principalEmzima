import java.text.DecimalFormat;
import java.util.Locale;
import java.util.Scanner;

public class FiguraGeometrica {
    public static void main(String[] args) {
        Scanner input = new Scanner(System.in);
        double area; 
        double constant = 1;
        String figure = " ";
         
        System.out.println("Ingresa una de las siguientes opciones: ");
        System.out.println("Opción 1: Círculo");
        System.out.println("Opción 2: Cuadrado");
        System.out.println("Opción 3: Triángulo");
        String option = input.nextLine();
        input.useLocale(Locale.US);

        String metric = switch (option) {
            case "1" -> {
                figure = "Círculo";
                constant = Math.PI;
                yield "el radio";}
            case "2" -> {
                figure = "Cuadrado";
                yield "el lado";}
            case "3" -> {
                figure = "Triángulo";
                constant = 0.5;
                yield "la base";}
            default -> "No válido";
        };
        if (!metric.equals("No válido")) {
            System.out.println("Ingresa "+metric+" en cm: ");
            float value1 = input.nextFloat();
            DecimalFormat df = new DecimalFormat("#.##");
            String formattedNumber = df.format(value1);
                if (!metric.equals("la base")) {
                    area = Math.pow(value1, 2)*constant;
                } else {
                    System.out.println("Ingresa la altura en cm: ");
                    float value2 = input.nextFloat();
                    formattedNumber = formattedNumber +" y "+ df.format(value2) + ", respectivamente";
                    metric = metric + " y la altura";
                    area = value1*value2*constant;

                }
                System.out.printf("El área del %s es %.2f cm2, según el(los) valor(es) dado(s) en cm %s %s",figure,area,metric,formattedNumber);
        } else {
            System.out.println("Boludo un número entre 1 y 3, en serio \"" + option + "\" Dale!");
        }
        input.close();
    }
}
