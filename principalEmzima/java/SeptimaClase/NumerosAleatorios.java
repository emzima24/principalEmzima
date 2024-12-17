import java.text.DecimalFormat;

public class NumerosAleatorios {
    public static void main(String[] args) {
        
        double number = Math.floor(Math.random()*356+1);
        DecimalFormat df = new DecimalFormat("#");
        String formattedNumber = df.format(number);

        int numberCast = (int) (Math.random()*355+1);
        
        System.out.println("El número aleatorio es "+formattedNumber);
        System.out.println("El número aleatorio es " + numberCast);
    }
}
