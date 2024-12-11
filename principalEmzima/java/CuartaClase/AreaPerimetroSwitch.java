import java.text.DecimalFormat;
import java.util.Locale;
import java.util.Scanner;

public class AreaPerimetroSwitch {
    public static void main(String[] args) {
        Scanner input = new Scanner(System.in);
        double area = 0, perimeter = 0;
        double constantArea = 1;
        double constantPerimeter = 2;
        String figure = " ", metric;

        System.out.println("Ingresa una de las siguientes opciones: ");
        System.out.println("Opción 1: Círculo");
        System.out.println("Opción 2: Rectángulo");
        String option = input.nextLine();
        input.useLocale(Locale.US);

        metric = switch (option) {
            case "1" -> {
                figure = "Círculo";
                constantArea = Math.PI;
                constantPerimeter = 2 * constantArea;
                yield "el radio";
            }
            case "2" -> {
                figure = "Rectángulo";
                yield "la base";
            }
            default -> "No válido";
        };
        if (!metric.equals("No válido")) {
            System.out.println("Ingresa " + metric + " en cm: ");
            float value1 = input.nextFloat();
            input.nextLine();
            DecimalFormat df = new DecimalFormat("#.##");
            String formattedNumber = df.format(value1);
            if (option.equals("1")) {
                area = Math.pow(value1, 2) * constantArea;
                perimeter = value1 * constantPerimeter;
            } else {
                System.out.println("Ingresa la altura en cm: ");
                float value2 = input.nextFloat();
                input.nextLine();
                formattedNumber = formattedNumber + " y " + df.format(value2) + ", respectivamente";
                metric = metric + " y la altura";
                area = value1 * value2;
                perimeter = (value1 + value2) * constantPerimeter;
            }
            System.out.println("Que valor deseas calcular: ");
            System.out.println("1: Área");
            System.out.println("2: Perímetro");
            System.out.println("3: Ambos");
            String choice = input.nextLine();
            System.out.println(
                    choice.equals(
                            "1") ? 
                            String.format("El área del %s es %.2f cm2, según el(los) valor(es) dado(s) en cm (%s %s)", figure, area, metric, formattedNumber) : 
                            choice.equals("2") ? 
                            String.format("El périmetro del %s es %.2f cm, según el(los) valor(es) dado(s) en cm (%s %s)", figure, perimeter, metric, formattedNumber) : 
                            choice.equals("3") ? 
                            String.format("El área del %s %.2f cm2 y el périmetro es %.2f cm, según el(los) valor(es) dado(s) en cm (%s %s)", figure, area, perimeter, metric, formattedNumber) : 
                            "Boludo un número entre 1 y 3, en serio \"" + choice + "\" Dale!");
        } else {
            System.out.println("Boludo un número entre 1 y 2, en serio \"" + option + "\" Dale!");
        }
        input.close();
    }
}
