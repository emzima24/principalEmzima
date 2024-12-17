import java.util.Arrays;

public class Practica {
    public static void main(String[] args) {
        String texto = "Hola Mundo";
        String texto2 = "Hola Mundo";
        String texto3 = "apple";
        String texto4 = "banana";
        String texto5 = "Hola %s!";
        String texto6 = "   ";
        String texto7 = "";
        String texto8 = "Hola Mundo Hola";
        String texto9 = "Hola\nMundo\nJava";
        String texto10 = "Hola12134";

        

        int longitud = texto.length(); // Devuelve 10
        System.out.println("longitud: " + longitud);

        char primerCaracter = texto.charAt(0); // Devuelve 'H'
        System.out.println("primer caracter: " + primerCaracter);

        String subcadena = texto.substring(0, 10); // Devuelve "Mundo"
        System.out.println("Parte de una cadena: " + subcadena);

        boolean sonIguales = texto.equals(texto2); // Devuelve true
        System.out.println("Comparación de textos: " + sonIguales);

        int indice = texto.indexOf("Mundo"); // Devuelve 5
        System.out.println("Indice de la primera aparición de la subcadena: " + indice);

        System.out.print("ARREGLO!!! Valores unicode de los caracteres de la cadena metodo chars");
        texto.chars().forEach(c -> System.out.print(c + " "));

        System.out.println();
        int valorUnicode = texto.codePointAt(0); // Devuelve 72 (Valor Unicode para 'H')
        System.out.println("Valor unicode del caracter indicado "+valorUnicode);
        
        int valorUnicodeAntes = texto.codePointBefore(1); // Devuelve 72 (Valor Unicode para 'H')
        System.out.println("Valor unicode del caracter indicado anterior "+valorUnicodeAntes);

        int cuentaUnicode = texto.codePointCount(0,10); // 
        System.out.println("Valor unicode del caracter indicado "+cuentaUnicode);
        
        System.out.print("Valores unicode de los caracteres de la cadena metodo code points "); // salida 72 111 108 97 32 77 117 110 100 111
        texto.codePoints().forEach(c -> System.out.print(c + " ")); 
        
        System.out.println();
        int compara = texto.compareTo(texto2);
        System.out.println("Comparación orden alfabetico por su valor unicode hello world"+compara); // Devuelve 0 porque son iguales
        int compara2 = texto3.compareTo(texto4);
        System.out.println("Comparación orden alfabetico por su valor unicode apple y banana"+compara2); // Salida: un número negativo porque "apple" es menor que "banana" comparacion alfabetica
        
        int result = texto.compareToIgnoreCase(texto2);
        System.out.println("Comparación orden alfabetico por su valor unicode sin considerar mayusculas y minusculas "+result);
        
        boolean resultBoolean = texto.endsWith("World");
        System.out.println("Finaliza con 'World'"+resultBoolean);

        boolean resultEqualsIgnore = texto.equalsIgnoreCase(texto2);
        System.out.println("Valor igual sin considerar mayusculas y minusculas "+resultEqualsIgnore);

        String result2 = texto5.formatted("Mundo"); // Salida: Hola Mundo
        System.out.println("Une al texto atraves de % como formato para impresion en este caso string "+result2); 

        byte[] bytes = texto.getBytes();  // Salida: [72, 111, 97, 32,  77, 117, 110, 100, 111]
        System.out.println(Arrays.toString(bytes)); 

        char[] chars = new char[5];
        texto.getChars(5, 10, chars, 0); // salida Mundo almacena en un objeto de tipo chars
        System.out.print("La division por caracteres a partir de 5 es ");
        System.out.println(chars);
        
        System.out.println("Tiene completamente espacios en blanco true o false? " + texto.isBlank());  //salida false
        System.out.println("Tiene completamente espacios en blanco true o false? " + texto6.isBlank()); // salida true

        System.out.println("Está completamente vacio true o false? "+texto6.isEmpty()); // Salida: false
        System.out.println("Está completamente vacio true o false? "+texto7.isEmpty()); // Salida: true

        System.out.println("Ultima posición de la cadena "+texto8.lastIndexOf("nd")); // Salida: 7
        System.out.println("Ultima posición de la cadena "+texto8.lastIndexOf("ol")); // Salida: 12

        System.out.println("Detecta un salto de linea en la cadena y las separas"); // Salida: tres lineas 1) Hola 2) Mundo 3) Java
        texto9.lines().forEach(System.out::println);

        System.out.println("Busca cadenas que comienzan con una o más letras y luego uno o más números "+texto10.matches("\\w+\\d+")); // true 
        System.out.println("Busca cadenas que comienzan con una o más letras y luego uno o más números "+texto.matches("\\w+\\d+"));   //false
    
        System.out.println("Busca cadenas dentro de una región especifica de la cadena "+texto.offsetByCodePoints(0, 5)); // Salida: 5 (posición de 'M')
        // lo hace a través del codigo unicode para evitar problemas con caracteres extraños  

        System.out.println("Encuentra el índice dentro de una cadena que está a una distancia específica en términos de puntos de código desde un índice dado "+texto.regionMatches(5, "Mundo", 0, 5)); // Salida: true
    }

}