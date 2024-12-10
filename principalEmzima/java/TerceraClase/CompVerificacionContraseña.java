import java.util.Scanner;

public class CompVerificacionContraseña {
        public static void main(String[] args) {
            Scanner input = new Scanner(System.in);
            
            System.out.print("Ingresa la contraseña: ");
            String password = input.nextLine();
            boolean isPassword = password.equals("1234");
            if (isPassword) {
                System.out.println("Acceso concedido");
            } else {
                System.out.println("Acceso denegado");
            }
            input.close();
        }
}
