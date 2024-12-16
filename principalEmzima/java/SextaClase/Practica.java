public class Practica {
    public static void main(String[] args) {
        String texto = "Hola Mundo";
        String texto2 = "Hola";
        String texto3 = "apple";
        String texto4 = "banana";

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
        
        System.out.print("Valores unicode de los caracteres de la cadena metodo code points");
        texto.codePoints().forEach(c -> System.out.print(c + " ")); 
        
        System.out.println();
        int compara = texto.compareTo(texto2);
        System.out.println("Comparación orden alfabetico por su valor unicode "+compara); // Devuelve un número negativo porque "apple" es menor que "banana"
        int compara2 = texto3.compareTo(texto4);
        System.out.println("Comparación orden alfabetico por su valor unicode "+compara2); // Salida: un número negativo porque "apple" es menor que "banana"
        
        int result = texto.compareToIgnoreCase(texto2);
        System.out.println("Comparación orden alfabetico por su valor unicode sin considerar mayusculas y minusculas "+result);
        
        boolean resultBoolean = texto.endsWith("World");
        System.out.println("Finaliza con"+resultBoolean);

        boolean resultEqualsIgnore = texto.equalsIgnoreCase(texto2);
        System.out.println("Valor igual sin considerar mayusculas y minusculas "+resultEqualsIgnore);


    }

}