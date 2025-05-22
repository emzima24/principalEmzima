package org.emzima;

//import net.thucydides.core.annotations.Step;
import net.serenitybdd.annotations.Step;


public class SampleSteps {


    private int result; // Atributo para almacenar el resultado de la suma


    @Step("Suma los números {0} y {1}")
    public void performSomeAction(int number1, int number2) {
        // Realiza la suma y almacena el resultado
        result = number1 + number2;
    }

    @Step("Verifica que el resultado sea {0}")
    public void verifyResult(int expectedSum) {
        if (result != expectedSum) {
            throw new AssertionError("El resultado de la suma no es el esperado. Esperado: "
                    + expectedSum + ", Actual: " + result);
        }
    }

}
