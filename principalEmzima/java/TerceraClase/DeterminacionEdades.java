import java.util.Scanner;

public class DeterminacionEdades {
        public static void main(String[] args) {
            // if (!false) {
            //    System.out.println("pasa por true");
            // } else {
            //    System.out.println("pasa por false");
            // }
            Scanner input = new Scanner(System.in);
            
            System.out.print("Ingresa tu edad: ");
            int age = input.nextInt();
            if ((age >=0) && (age < 18)) {
                System.out.println("Eres menor de edad, con esa edad "+age+" años");
            } else if ((age >= 18) && (age < 65)) {
                System.out.println("Eres mayor de edad, con esa edad "+age+" años");
            } else if (age >= 65) {
                System.out.println("Eres un adulo mayor, con esa edad "+age+" años");
            }else {
                System.out.println("Che boludo negativo en serio mandaste esto "+age +" dale!");
            }
            input.close();
        }
}
