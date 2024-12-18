import java.util.Scanner;

public class ValidacionContrasenhaDos {
    public static void main(String[] args) {
        Scanner input = new Scanner(System.in);
        String text = "", message = "La contraseña";
        int count = 0;

        System.out.print("Ingresa una contraseña para validarla: ");
        String password = input.nextLine();
        int minimunChars = password.length();
        if (minimunChars < 8) {
            count += 1;
            text = count + ") Debe ser mayor o igual a 8 (solo colocaste " + minimunChars + ")\n";
        } 
        if (!password.matches(".*[A-Z].*")) {
            count += 1;
            text += count + ") Debe contener al menos 1 letra mayúscula\n";
        } 
        if (!password.matches(".*[a-z].*")) {
            count += 1;
            text += count + ") Debe contener al menos 1 letra minúscula\n";
        } 
        if (!password.matches(".*\\d.*")) {
            count += 1;
            text += count + ") Debe contener al menos 1 digito\n";
        } 
        if (!password.matches(".*[!@#$%^&*(),.?\":{}|<>].*")) {
            count += 1;
            text += count + ") Debe contener al menos 1 caracter especial\n";
        }
        // adicional 
        if (password.startsWith(" ") || password.endsWith(" ")) {
            count += 1;
            text += count + ") No debe comenzar o terminar con espacios\n";
        }
        if (count==0){
            System.out.println(message.concat(" está bien wacho pero no te confies que te roban"));
        } else {
            System.out.println(message.concat(" ES INSEGURA ACA LAS OBSERVACIONES\n").concat(text));

        }
        input.close();
    }
}
