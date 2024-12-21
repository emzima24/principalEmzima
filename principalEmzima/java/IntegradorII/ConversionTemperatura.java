
// import java.util.Locale;
import java.util.Scanner;

public class ConversionTemperatura {
    public static void main(String[] args) {
        double temperatureConv = 0, temperatureConvLast = 0;
        String startUnit = "°C", mediumUnit = "°F",lastUnit = "K";

        try (Scanner input = new Scanner(System.in);) {
            // input.useLocale(Locale.US);
            System.out.print("Ingresa el valor de la Temperatura: ");
            double temperature = Double.parseDouble(input.nextLine());
            System.out.println("Las siguientes opciones de la unidad de medida de la Temperatura: ");
            System.out.println("C) Celsius o Centigrado");
            System.out.println("F) Farenheit");
            System.out.println("K) Kelvin"); // adicional
            System.out.print("Ingresa aqui: ");
            String temperatureUnit = input.nextLine();

            switch (temperatureUnit.toUpperCase()) {
                case "C" -> {
                    temperatureConv = temperature * 9 / 5 + 32;
                    temperatureConvLast = temperature + 273.15;
                }
                case "F" -> {
                    mediumUnit = "°C";
                    startUnit = "°F";
                    temperatureConv = (temperature - 32) * 5 / 9;
                    temperatureConvLast = temperatureConv + 273.15;
                }
                case "K" -> {                                   // adicional
                    if (temperature < 0) {                      
                        throw new IllegalArgumentException(
                                "Che boludo una temperatura mayor que 0, no cuesta tanto.");
                    }
                    lastUnit = "°C";
                    startUnit = "K";
                    temperatureConvLast = temperature - 273.15;
                    temperatureConv = temperatureConvLast * 9 / 5 + 32;
                }
                default -> throw new IllegalArgumentException(
                        "Che boludo una letra C, F o K para identificar las unidades de temperaturas\ntampoco es tan díficil");
            }
            System.out.printf("Una Temperatura %.2f %s es equivalente a %.2f %s y %.2f %s%n", temperature, startUnit,
                        temperatureConv, mediumUnit, temperatureConvLast,lastUnit);
        } catch (NumberFormatException e) {
            System.out.println("Che boludo un número, no cuesta tanto.");
        } catch (IllegalArgumentException e) {
            System.out.println(e.getMessage());
        }
    }
}
