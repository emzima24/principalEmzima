public class Practica {
    public static void main(String[] args) {
        double piConstant = Math.PI; // 3.141592653589793
        System.out.println("valor de pi: " + piConstant);

        double eulerConstant = Math.E; // 2.718281828459045
        System.out.println("valor de número de euler: " + eulerConstant);

        int num = -10;
        int absNum = Math.abs(num); // absNum será igual a 10
        System.out.println("valor absoluto de "+ num +": " + absNum);

        double num1 = 16;
        double sqrtNum = Math.sqrt(num1); // sqrtNum será igual a 4.0
        System.out.println("raiz cuadrada funcion directa de " + num1 + ": " + sqrtNum);

        double base = 2;
        double exponente = 3;
        double resultado = Math.pow(base, exponente); // resultado será igual a 8.0
        System.out.println("el resultado de elevar " + base + " a la " + exponente + ": " + resultado);

        double randomNum = Math.random(); // Genera un número aleatorio entre 0.0 y 1.0
        System.out.println("aleatorio sin rangos default entre 0 y 1: " + randomNum);

        double num2 = 3.499;
        long roundedNum = Math.round(num2); // roundedNum será igual a 4
        System.out.println("redondeo normal de " + num2 + " el decimal 0.5 redondea hacia arriba y 0.49 redondea hacia abajo: "+roundedNum);

        double num3 = 4.99;
        double flooredNum = Math.floor(num3); // flooredNum será igual a 4.0
        System.out.println("redondeo por debajo de " + num3 + " siempre pertenece al menor: "+flooredNum);

        double num4 = 2.01;
        double ceiledNum = Math.ceil(num4); // ceiledNum será igual a 3.0
        System.out.println("redondeo por arriba de " + num4 + " siempre pertenece al mayor: "+ceiledNum);

    }
}
