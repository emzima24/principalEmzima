public class PrimerPrograma {
    public static void main(String[] args) {
        final String SALUDO = "Hola mundo";
        final int EDAD = 70;
        final String MI_NOMBRE = "Emiliano";

        boolean isVerdad = true;
        String gestorCasosPrueba = "Testlink"; // Mayúscula a diferencia del resto
        double escalaMinimo = 1.0; 
        float escalaMaximo = 10.0f;   // f es obligatoria para float
        char letra = 'm'; // comillas simples obligatorias
        long numerote = 9223372036854775807L;  // L es obligatoria para long
        
        System.out.println(SALUDO);
        System.out.println("La edad de " + MI_NOMBRE + " es " + EDAD);
        System.out.println("¿Es " + gestorCasosPrueba + " un gestor de TC que no vale la pena utilizar? " + isVerdad);
        System.out.println("En la escala del " + escalaMinimo + " al " + escalaMaximo + ", ¿qué tan malo es Testlink? " + (escalaMaximo * 1000));
        System.out.println("Una letra que identifica la característica principal de " + gestorCasosPrueba + " es " + letra);        
        System.out.println("Un número grandote " + numerote);        
    }
}