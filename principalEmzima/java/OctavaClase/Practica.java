public class Practica {

    public static void main(String[] args) {
        try {
            new ProcessBuilder("cmd", "/c", "cls").inheritIO().start().waitFor();
        } catch (Exception e) {
            e.printStackTrace();
        }
        int numero = 6;
        int[] array1 = { 1, numero, 2, 3 }; // array1 es un objeto de la clase int[]
        int[] array2 = new int[4]; // array2 es un objeto de la clase int[] vacio
        System.out.println("tamaño del arreglo uno " + array1.length);
        System.out.println("tamaño del arreglo dos " + array2.length);

        // System.out.println("********************");
        // String[] arr = new String[3]; // Crea un arreglo sin valores es decir null no
        // vacio
        // arr[0] = "hola"; // Modifica el primer elemento del arreglo
        // System.out.println("el primer elemento arr "+arr[0]); // Accede al primer
        // elemento del arreglo

        // System.out.println("********************");
        // int[] array3 = new int[6];
        // System.out.println("el tamaño del arreglo tres "+array3.length); // Imprime:
        // 6
        // array3.length = 3; // Marca un error: The final field array.length cannot be
        // assigned // es de compilacion no se puede capturar en tiempo de ejecucón

        // System.out.println("********************");
        // int[] intArr = { 1, 2, 3 }; // Correcto
        // System.out.println("tamaño del arreglo de enteros "+ intArr.length +" y su
        // segundo elemento es "+intArr[1]);
        // String[] strArr = { "hola", "como", "estas?" }; // Correcto
        // System.out.println("tamaño del arreglo de string "+ strArr.length +" y su
        // segundo elemento es "+strArr[1]);
        // int[] mixErr = { "hola", 2, 3 }; // Incorrecto

    }
}