import java.util.Scanner;

public class OrdenAlfabetico {
    public static void main(String[] args) {
        String[] arrayText = { "primer", "segundo", "tercer", "cuarto" }, arrayStr = new String[4];
        int count = 0;

        try (Scanner input = new Scanner(System.in)) {
            new ProcessBuilder("cmd", "/c", "cls").inheritIO().start().waitFor();
            System.out.print("Ingresa un nombre " + (count + 1) + " ");
            arrayStr[count] = input.nextLine();
            count++;
            System.out.print("Ingresa un nombre " + (count + 1) + ": ");
            String variableTemp = input.nextLine();
            if (arrayStr[(count - 1)].compareToIgnoreCase(variableTemp) >= 0) {
                arrayStr[count] = arrayStr[count - 1];
                arrayStr[count - 1] = variableTemp;
            } else {
                arrayStr[count] = variableTemp;
            }
            count++;
            System.out.print("Ingresa un nombre " + (count + 1) + ": ");
            variableTemp = input.nextLine();
            if ((arrayStr[(count - 1)].compareToIgnoreCase(variableTemp) >= 0)) {
                arrayStr[count] = arrayStr[count - 1];
                arrayStr[count - 1] = variableTemp;
                if (arrayStr[(count - 2)].compareToIgnoreCase(variableTemp) >= 0) {
                    arrayStr[count - 1] = arrayStr[count - 2];
                    arrayStr[count - 2] = variableTemp;
                }
            } else {
                arrayStr[count] = variableTemp;
            }
            count++;
            System.out.print("Ingresa un nombre " + (count + 1) + ": ");
            variableTemp = input.nextLine();
            if ((arrayStr[(count - 1)].compareToIgnoreCase(variableTemp) >= 0)) {
                arrayStr[count] = arrayStr[count - 1];
                arrayStr[count - 1] = variableTemp;
                if (arrayStr[(count - 2)].compareToIgnoreCase(variableTemp) >= 0) {
                    arrayStr[count - 1] = arrayStr[count - 2];
                    arrayStr[count - 2] = variableTemp;
                    if (arrayStr[(count - 3)].compareToIgnoreCase(variableTemp) >= 0) {
                        arrayStr[count - 2] = arrayStr[count - 3];
                        arrayStr[count - 3] = variableTemp;
                    }
                }
            } else {
                arrayStr[count] = variableTemp;
            }

            // count++;
            count = 0;
            System.out.println(
                    "**********************************************************************************************");
            System.out.println("El " + arrayText[count] + " elemento del arreglo ordenado [" + count + "] es "
                    + arrayStr[count++]);
            System.out.println("El " + arrayText[count] + " elemento del arreglo ordenado [" + count + "] es "
                    + arrayStr[count++]);
            System.out.println("El " + arrayText[count] + " elemento del arreglo ordenado [" + count + "] es "
                    + arrayStr[count++]);
            System.out.println("El " + arrayText[count] + " elemento del arreglo ordenado [" + count + "] es "
                    + arrayStr[count++]);
            System.out.println(
                    "**********************************************************************************************");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}

// Carla
// Carlita
// Carlo
// Carlos
