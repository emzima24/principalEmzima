import java.util.Locale;
import java.util.Random;
import java.util.Scanner;

public class ComplementarioAreaPerimetro {
    public static void main(String[] args) {
        Random random = new Random();
        Scanner input = new Scanner(System.in);
        input.useLocale(Locale.US);
    
        //System.out.print("Ingresa la base del rectángulo: ");
        //float base = input.nextFloat();
        //System.out.print("Ingresa la altura del rectángulo: ");
        //float height = input.nextFloat();
        float baseRectangle = random.nextFloat(101);
        float heightRectangle = random.nextInt(101);
       
        float area = baseRectangle*heightRectangle; 
        float perimeter = 2*(baseRectangle+heightRectangle); 
        System.out.println("Siendo la base "+ baseRectangle +" y la altura "+ heightRectangle +" el área es "+ area);
        System.out.println("Siendo la base "+ baseRectangle +" y la altura "+ heightRectangle +" el perímetro es "+ perimeter);
        input.close();
        }
}
