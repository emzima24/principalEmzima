import java.util.Scanner;

public class ValidacionContrasenhaDos {
    public static void main(String[] args) {
        Scanner teclado = new Scanner(System.in);
        System.out.println("-------------------------------------------------");
        System.out.println("Ingrese una contrasena que al menos cuente con: ");
        System.out.println(" - 8 caracteres.");
        System.out.println(" - Al menos una Mayuscula y una Minuscula.");
        System.out.println(" - Al menos un numero.");
        System.out.println(" - Al menos un caracter especial.");
        System.out.println("-------------------------------------------------");
        System.out.print(" password > ");
        String password = teclado.nextLine(), errorMessage = "La contrasena presenta los siguientes errores: \n";
        int count = 0;

        if (password.length() < 8) {
            count++;
            errorMessage += "[" + count + "] no tiene al menos 8 caracteres\n";
        }

        if (!password.matches(".*[a-z].*")) {
            count++;
            errorMessage += "[" + count + "] no tiene al menos una minuscula\n";
        }

        if (!password.matches(".*[A-Z].*")) {
            count++;
            errorMessage += "[" + count + "] no tiene al menos una Mayuscula\n";
        }

        if (!password.matches(".*\\d.*")) {
            count++;
            errorMessage += "[" + count + "] no tiene al menos un numero\n";
        }

        if (!password.matches(".*[^a-z A-Z 0-9].*")) {
            count++;
            errorMessage += "[" + count + "] no tiene al menos un caracter especial\n";
        }

        if (password.startsWith(" ") || password.endsWith(" ")) {
            count += 1;
            errorMessage += "[" + count + "] No debe comenzar o terminar con espacios\n";
        }

        if (count == 0) {
            System.out.println("Excelente! Su nueva contrasena es: ************* (" + password + ")");
        } else {
            System.out.println(errorMessage);
        }

        teclado.close();
    }
}
