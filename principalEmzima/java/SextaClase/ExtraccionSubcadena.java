import java.util.Scanner;

public class ExtraccionSubcadena {
    public static void main(String[] args) {
        Scanner input = new Scanner(System.in);
        int startPosition = 0, endPosition = 0;
        System.out.print("Ingresa ingresa un texto: ");
        String texString = input.nextLine();

        try {
            System.out.print("Ingresa desde que posición se inicia: ");
            startPosition = Integer.parseInt(input.nextLine());
            System.out.print("Ingresa hasta que posición se toma, debe ser mayor que la anterior: ");
            endPosition = Integer.parseInt(input.nextLine());
            String chain = texString.substring(startPosition,endPosition);
            System.out.println("Para el texto "+texString);
            System.out.println("Cortando en la posición incial "+startPosition+" y en la posición final "+endPosition);
            System.out.println("La sub cadena que tomas es " + chain);

        } catch (NumberFormatException e) {
            System.out.println("Error: Ingresa un número entero válido.");
        } catch (IndexOutOfBoundsException e) {
            System.out.println("Error: Ingresa un número entero válido entre 0 y "+texString.length()+"\n e introdujiste "+startPosition+" para iniciar y para finalizar en "+endPosition+"\n fijate que "+endPosition+" sea mayor que "+startPosition);
        }

        input.close();
    }

}