import java.util.Scanner;

public class Practica {
    public static void main(String[] args) {

        Scanner pepe = new Scanner(System.in);
        //int dato1 = pepe.nextInt();
        // todo esto considerando que los primitivos no son objetos y por eso no tienen metodos asociados
        String numbreString = "1000a";
        System.out.println(numbreString.getClass().getSimpleName()); 
        Object number = 1000; // pero solo prueba objetos generales no primitivos
        System.out.println(number.getClass().getSimpleName());
        Number number2 = 1000; // pero solo prueba la clase generica de Numeros (Integer,Float, Short, Double,Long) no primitivos
        System.out.println(number2.getClass().getSimpleName());
        Object wrappednumber = Integer.valueOf(numbreString); // pero solo prueba la clase Integer no primitivos
        System.out.println(wrappednumber.getClass().getSimpleName());


        // int dato2 = pepe.nextInt();
        // if (dato1 != 0 && dato2 != 0) {
        //     int resultado = dato1 + dato2;
        //     System.out.println(resultado);
        // }

        pepe.close();
    }

}
