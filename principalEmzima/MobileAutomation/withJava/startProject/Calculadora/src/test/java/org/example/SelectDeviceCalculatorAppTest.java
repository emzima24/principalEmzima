package org.example;

import io.appium.java_client.AppiumBy;
import org.openqa.selenium.By;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.ui.ExpectedConditions;
import org.openqa.selenium.support.ui.WebDriverWait;
import org.testng.annotations.BeforeMethod;
import org.testng.annotations.Test;
import org.testng.asserts.SoftAssert;

import java.math.BigDecimal;
import java.math.BigInteger;
import java.math.RoundingMode;
import java.text.DecimalFormat;
import java.time.Duration;
import java.util.concurrent.ThreadLocalRandom;

public class SelectDeviceCalculatorAppTest extends BaseTest {
    private String deviceType;
    private static final String ENGLISH_ERROR = "Can't divide by 0";
    private static final String SPANISH_ERROR = "No se puede dividir por 0";
    private static final String AC_BUTTON = "com.google.android.calculator:id/clr";
    private static final String NUMBER_BUTTON = "com.google.android.calculator:id/digit_";
    private static final String OPERATION_BUTTON = "com.google.android.calculator:id/op_";
    private static final String RESULT_BUTTON = "com.google.android.calculator:id/eq";
    private static final String DECIMAL_POINT_BUTTON = "com.google.android.calculator:id/dec_point";

    private static final String EXPAND_BUTTON =  "com.google.android.calculator:id/collapse_expand";
    int number = 0;

    SoftAssert softAssert = new SoftAssert();



    @BeforeMethod
    public void setUp() throws Exception {

        deviceType = System.getProperty("device", "MyGalaxy");
        System.out.println("[DEBUG] Configurando sesión para dispositivo: " + deviceType.toUpperCase());

        if (deviceType.equalsIgnoreCase("emulator")) {
            setupDriver("Pixel_7", "emulator-5554");
        } else {
            setupDriver("MyGalaxy", "R58W2054VLH");
        }
        System.out.println("[DEBUG] Sesión iniciada correctamente. Driver configurado.");

        WebDriverWait wait = new WebDriverWait(driver, Duration.ofSeconds(20));
        cleaningOperation(wait);
        System.out.println("[DEBUG] Pantalla limpia");

    }


    // ========== TESTS PRINCIPALES ========== //
    @Test(priority = 1)
    public void openAppTest() {
        System.out.println("[DEBUG] Inicio TEST ("+(number++)+") DE ABRIR LA APP en " + deviceType);
        WebDriverWait wait = new WebDriverWait(driver, Duration.ofSeconds(20));
        WebElement buttonElement = selectElementById(wait, AC_BUTTON);
        takeScreenshot("testOnOpen","open_app");
        softAssert.assertTrue(buttonElement.isDisplayed(), "El botón AC no está visible");
        try {
            System.out.println("[DEBUG] ("+(number)+") Test Apertura de la App concluido en " + deviceType);
        } catch (Exception e) {
            handleTestError(softAssert, "testOnOpen", e);
        }
    }

    @Test(priority = 3)
    public void addTest() {
        WebDriverWait wait = new WebDriverWait(driver, Duration.ofSeconds(25));

        try {
            System.out.println("[DEBUG] Inicio TEST ("+(number++)+") SUMAR CON LA APP en " + deviceType);
            int randomNum1 = ThreadLocalRandom.current().nextInt(1, 10);
            int randomNum2 = ThreadLocalRandom.current().nextInt(0, 10);
            int randomNum3 = ThreadLocalRandom.current().nextInt(0, 10);
            int randomNum4 = ThreadLocalRandom.current().nextInt(1, 10);
            int randomNum5 = ThreadLocalRandom.current().nextInt(0, 10);
            int randomNum6 = ThreadLocalRandom.current().nextInt(0, 10);

            clickElementById("Marcando el número "+randomNum1,wait,NUMBER_BUTTON+randomNum1);
            clickElementById("Marcando el número "+randomNum2,wait,NUMBER_BUTTON+randomNum2);
            clickElementById("Marcando el número "+randomNum3,wait,NUMBER_BUTTON+randomNum3);
            clickElementById("Marcando botón +",wait,OPERATION_BUTTON+"add");
            clickElementById("Marcando el número "+randomNum4,wait,NUMBER_BUTTON+randomNum4);
            clickElementById("Marcando el número "+randomNum5,wait,NUMBER_BUTTON+randomNum5);
            clickElementById("Marcando el número "+randomNum6,wait,NUMBER_BUTTON+randomNum6);
            clickElementById("Marcando botón =",wait,RESULT_BUTTON);

            double resultExpected = (randomNum1*100+randomNum2*10+randomNum3)+ (randomNum4*100+randomNum5*10+randomNum6);

            String screenResult = getResult(wait).replace(",", "");
            double actualResult = Double.parseDouble(screenResult);

            takeScreenshotAndAssert("testOnAdd","additon_app",softAssert,String.valueOf(actualResult),String.valueOf(resultExpected),"No realizó la suma adecuadamente");
            System.out.printf("El valor %s es igual al valor %s? %b%n", actualResult, resultExpected, String.valueOf(actualResult).equals(String.valueOf(resultExpected)));
            System.out.println("[DEBUG] ("+(number)+") Test de suma concluido en " + deviceType);
        } catch (Exception e) {
            handleTestError(softAssert, "testOnAdd", e);
        }
    }

    @Test(priority = 4)
    public void multiplyTest() {
        WebDriverWait wait = new WebDriverWait(driver, Duration.ofSeconds(20));

        try {
            System.out.println("[DEBUG] Inicio TEST ("+(number++)+") MULTIPLICAR CON LA APP en " + deviceType);
            int randomNum1 = ThreadLocalRandom.current().nextInt(1, 10);
            int randomNum2 = ThreadLocalRandom.current().nextInt(0, 10);
            int randomNum3 = ThreadLocalRandom.current().nextInt(0, 10);
            int randomNum4 = ThreadLocalRandom.current().nextInt(1, 10);
            int randomNum5 = ThreadLocalRandom.current().nextInt(0, 10);
            int randomNum6 = ThreadLocalRandom.current().nextInt(0, 10);

            clickElementById("Marcando el número "+randomNum1,wait,NUMBER_BUTTON+randomNum1);
            clickElementById("Marcando el número "+randomNum2,wait,NUMBER_BUTTON+randomNum2);
            clickElementById("Marcando el número "+randomNum3,wait,NUMBER_BUTTON+randomNum3);
            clickElementById("Marcando botón *",wait,OPERATION_BUTTON+"mul");
            clickElementById("Marcando el número "+randomNum4,wait,NUMBER_BUTTON+randomNum4);
            clickElementById("Marcando el número "+randomNum5,wait,NUMBER_BUTTON+randomNum5);
            clickElementById("Marcando el número "+randomNum6,wait,NUMBER_BUTTON+randomNum6);
            clickElementById("Marcando botón =",wait,RESULT_BUTTON);

            double resultExpected = (randomNum1*100+randomNum2*10+randomNum3) * (randomNum4*100+randomNum5*10+randomNum6);

            String screenResult = getResult(wait).replace(",", "");
            double actualResult = Double.parseDouble(screenResult);

            takeScreenshotAndAssert("testOnMulti","multity_app",softAssert,String.valueOf(actualResult),String.valueOf(resultExpected),"No realizó la multiplicación adecuadamente");
            System.out.printf("El valor %s es igual al valor %s? %b%n", actualResult, resultExpected, String.valueOf(actualResult).equals(String.valueOf(resultExpected)));
            System.out.println("[DEBUG] ("+(number)+") Test de multiplicación concluido en " + deviceType);
        } catch (Exception e) {
            handleTestError(softAssert, "testOnMulti", e);
        }
    }

    @Test(priority = 5)
    public void divisionTest() {
        WebDriverWait wait = new WebDriverWait(driver, Duration.ofSeconds(20));

        try {
            System.out.println("[DEBUG] Inicio TEST ("+(number++)+") DIVISION CON LA APP en " + deviceType);
            int randomNum1 = ThreadLocalRandom.current().nextInt(1, 10);
            int randomNum2 = ThreadLocalRandom.current().nextInt(0, 10);
            int randomNum3 = ThreadLocalRandom.current().nextInt(0, 10);
            int randomNum4 = ThreadLocalRandom.current().nextInt(1, 10);
            int randomNum5 = ThreadLocalRandom.current().nextInt(0, 10);

            clickElementById("Marcando el número "+randomNum1,wait,NUMBER_BUTTON+randomNum1);
            clickElementById("Marcando el número "+randomNum2,wait,NUMBER_BUTTON+randomNum2);
            clickElementById("Marcando el número "+randomNum3,wait,NUMBER_BUTTON+randomNum3);
            clickElementById("Marcando botón /",wait,OPERATION_BUTTON+"div");
            clickElementById("Marcando el número "+randomNum4,wait,NUMBER_BUTTON+randomNum4);
            clickElementById("Marcando el número "+randomNum5,wait,NUMBER_BUTTON+randomNum5);
            clickElementById("Marcando botón =",wait,RESULT_BUTTON);

            double dividend = randomNum1*100.0 + randomNum2*10.0 + randomNum3;
            double divisor = randomNum4*10.0 + randomNum5;
            double resultExpectedDouble = dividend / divisor;

            String screenResult = getResult(wait).replace(",", ".");
            double actualResultDouble = Double.parseDouble(screenResult);

            DecimalFormat df = new DecimalFormat("#.####");
            String resultExpected = df.format(resultExpectedDouble);
            String actualResult = df.format(actualResultDouble);


            takeScreenshotAndAssert("testOnDivi","division_app",softAssert,String.valueOf(actualResult),String.valueOf(resultExpected),"No realizó la división adecuadamente");
            System.out.printf("El valor %s es igual al valor %s? %b%n", actualResult, resultExpected, actualResult.equals(resultExpected));
            System.out.println("[DEBUG] ("+(number)+") Test de división concluido en " + deviceType);
        } catch (Exception e) {
            handleTestError(softAssert, "testOnDivi", e);
        }
    }

    @Test(priority = 6)
    public void floatTest() {
        WebDriverWait wait = new WebDriverWait(driver, Duration.ofSeconds(20));

        try {
            System.out.println("[DEBUG] Inicio TEST ("+(number++)+") DECIMALES CON LA APP en " + deviceType);
            int randomNum1 = ThreadLocalRandom.current().nextInt(1, 10);
            int randomNum2 = ThreadLocalRandom.current().nextInt(0, 10);
            int randomNum3 = ThreadLocalRandom.current().nextInt(1, 10);
            int randomNum4 = ThreadLocalRandom.current().nextInt(0, 10);
            int randomNum5 = ThreadLocalRandom.current().nextInt(0, 10);
            int randomNum6 = ThreadLocalRandom.current().nextInt(0, 10);
            int randomNum7 = ThreadLocalRandom.current().nextInt(0, 10);

            clickElementById("Marcando el número "+randomNum1,wait,NUMBER_BUTTON+randomNum1);
            clickElementById("Marcando el separador de decimales ,",wait,DECIMAL_POINT_BUTTON);
            clickElementById("Marcando el número "+randomNum2,wait,NUMBER_BUTTON+randomNum2);
            clickElementById("Marcando botón -",wait,OPERATION_BUTTON+"sub");
            clickElementById("Marcando el número "+randomNum3,wait,NUMBER_BUTTON+randomNum3);
            clickElementById("Marcando el número "+randomNum4,wait,NUMBER_BUTTON+randomNum4);
            clickElementById("Marcando el número "+randomNum5,wait,NUMBER_BUTTON+randomNum5);
            clickElementById("Marcando el número "+randomNum6,wait,NUMBER_BUTTON+randomNum6);
            clickElementById("Marcando el separador de decimales ,",wait,DECIMAL_POINT_BUTTON);
            clickElementById("Marcando el número "+randomNum7,wait,NUMBER_BUTTON+randomNum7);
            clickElementById("Marcando botón =",wait,RESULT_BUTTON);

            double resultExpectedDouble = (randomNum1+randomNum2*.1) - (randomNum3*1000+randomNum4*100+randomNum5*10+randomNum6+randomNum7*.1);

            String screenResult = getResult(wait).replace("−", "-").replace(",", "");
            double actualResultDouble = Double.parseDouble(screenResult);

            DecimalFormat df = new DecimalFormat("#.####");
            String resultExpected = df.format(resultExpectedDouble);
            String actualResult = df.format(actualResultDouble);


            takeScreenshotAndAssert("testOnFloat","float_app",softAssert,actualResult,resultExpected,"No realizó la operación con decimales adecuadamente");
            System.out.printf("El valor %s es igual al valor %s? %b%n", actualResult, resultExpected, actualResult.equals(resultExpected));
            System.out.println("[DEBUG] ("+(number)+") Test de decimales concluido en " + deviceType);
        } catch (Exception e) {
            handleTestError(softAssert, "testOnFloat", e);
        }
    }

    @Test(priority = 2)
    public void divisionByZeroTest() {
        WebDriverWait wait = new WebDriverWait(driver, Duration.ofSeconds(20));

        try {
            System.out.println("[DEBUG] Inicio TEST ("+(number++)+") DECIMALES CON LA APP en " + deviceType);
            int randomNum1 = ThreadLocalRandom.current().nextInt(1, 10);
            int randomNum2 = ThreadLocalRandom.current().nextInt(0, 10);
            int randomNum3 = ThreadLocalRandom.current().nextInt(0, 10);

            clickElementById("Marcando el número "+randomNum1,wait,NUMBER_BUTTON+randomNum1);
            clickElementById("Marcando el número "+randomNum2,wait,NUMBER_BUTTON+randomNum2);
            clickElementById("Marcando el número "+randomNum3,wait,NUMBER_BUTTON+randomNum3);
            clickElementById("Marcando botón /",wait,OPERATION_BUTTON+"div");
            clickElementById("Marcando el número 0",wait,NUMBER_BUTTON+0);
            clickElementById("Marcando botón =",wait,RESULT_BUTTON);

            double dividend = randomNum1*100.0 + randomNum2*10.0 + randomNum3;
            double divisor = 0;

            String screenActual = getResultByZero(wait).trim();
            String resultExpected;
            if (deviceType.toLowerCase().contains("emulator") || deviceType.toLowerCase().contains("emulador")) {
                resultExpected = ENGLISH_ERROR;
            } else {
                resultExpected = SPANISH_ERROR;
            }

            System.out.printf("El valor %s es igual al valor %s? %b%n", screenActual, resultExpected, screenActual.equalsIgnoreCase(resultExpected));
            takeScreenshotAndAssert("testOnDiviByZero","division_zero_app",softAssert,screenActual,resultExpected,"No realizó la división adecuadamente");
            System.out.println("[DEBUG] ("+(number)+") Test de división entre zero concluido en " + deviceType);
        } catch (Exception e) {
            handleTestError(softAssert, "testOnDiviByZero", e);
        }
    }

    @Test(priority = 7)
    public void consecutiveOperationsTest() {
        WebDriverWait wait = new WebDriverWait(driver, Duration.ofSeconds(20));

        try {
            System.out.println("[DEBUG] Inicio TEST ("+(number++)+") OPERACIONES CONSECUTIVAS CON LA APP en " + deviceType);
            int randomNum1 = ThreadLocalRandom.current().nextInt(0, 10);
            int randomNum2 = ThreadLocalRandom.current().nextInt(0, 10);
            int randomNum3 = ThreadLocalRandom.current().nextInt(0, 10);
            int randomNum4 = ThreadLocalRandom.current().nextInt(0, 10);
            int randomNum5 = ThreadLocalRandom.current().nextInt(0, 10);
            int randomNum6 = ThreadLocalRandom.current().nextInt(0, 10);
            int randomNum7 = ThreadLocalRandom.current().nextInt(0, 10);

            clickElementById("Marcando el número "+randomNum1,wait,NUMBER_BUTTON+randomNum1);
            clickElementById("Marcando el separador de decimales ,",wait,DECIMAL_POINT_BUTTON);
            clickElementById("Marcando el número "+randomNum7,wait,NUMBER_BUTTON+randomNum7);
            clickElementById("Marcando botón -",wait,OPERATION_BUTTON+"sub");
            clickElementById("Marcando el número "+randomNum2,wait,NUMBER_BUTTON+randomNum2);
            clickElementById("Marcando botón *",wait,OPERATION_BUTTON+"mul");
            clickElementById("Marcando el número "+randomNum3,wait,NUMBER_BUTTON+randomNum3);
            clickElementById("Marcando botón +",wait,OPERATION_BUTTON+"add");
            clickElementById("Marcando el número "+randomNum4,wait,NUMBER_BUTTON+randomNum4);
            clickElementById("Marcando el separador de decimales ,",wait,DECIMAL_POINT_BUTTON);
            clickElementById("Marcando el número "+randomNum1,wait,NUMBER_BUTTON+randomNum1);
            clickElementById("Marcando botón /",wait,OPERATION_BUTTON+"div");
            clickElementById("Marcando el número "+randomNum5,wait,NUMBER_BUTTON+randomNum5);
            clickElementById("Marcando botón -",wait,OPERATION_BUTTON+"sub");
            clickElementById("Marcando el número "+randomNum6,wait,NUMBER_BUTTON+randomNum6);
            clickElementById("Marcando botón /",wait,OPERATION_BUTTON+"div");
            clickElementById("Marcando el número "+randomNum7,wait,NUMBER_BUTTON+randomNum7);
            clickElementById("Marcando botón =",wait,RESULT_BUTTON);

            String resultExpected, actualResult ;
            if ((randomNum5==0) || (randomNum7==0) ){
                actualResult = getResultByZero(wait).trim();
                if (deviceType.toLowerCase().contains("emulator") || deviceType.toLowerCase().contains("emulador")) {
                    resultExpected = ENGLISH_ERROR;
                } else {
                    resultExpected = SPANISH_ERROR;
                }
            } else {
                double resultExpectedDouble = ((randomNum1 + randomNum7 * 0.1) - (randomNum2 * randomNum3)) + ((randomNum4 + randomNum1 * 0.1) / randomNum5) - (randomNum6 / randomNum7);

                String screenResult = getResult(wait).replace("−", "-").replace(",", "");
                double actualResultDouble = Double.parseDouble(screenResult);

                DecimalFormat df = new DecimalFormat("#.####");
                resultExpected = df.format(resultExpectedDouble);
                actualResult = df.format(actualResultDouble);
            }


            takeScreenshotAndAssert("testOnOpConsecutives","consecutives_app",softAssert,actualResult,resultExpected,"No realizó la operación con consecutiva adecuadamente");
            System.out.printf("El valor %s es igual al valor %s? %b%n", actualResult, resultExpected, actualResult.equals(resultExpected));
            System.out.println("[DEBUG] ("+(number)+") Test de operaciones consecutivas concluido en " + deviceType);
        } catch (Exception e) {
            handleTestError(softAssert, "testOnOpConsecutives", e);
        }
    }

    @Test(priority = 8)
    public void otherOperationTest() {
        WebDriverWait wait = new WebDriverWait(driver, Duration.ofSeconds(20));

        try {
            System.out.println("[DEBUG] Inicio TEST ("+(number++)+") CON OTRAS OPERACIONES EN LA APP en " + deviceType);

            String[][] otherOperations = {
                    {"Raiz cuadrada", "sqrt"},
                    {"Potencia", "pow"},
                    {"Función seno", "fun_sin"},
                    {"Función coseno", "fun_cos"},
                    {"Función tangente", "fun_tan"},
                    {"Función logaritmo natural", "fun_ln"},
                    {"Función logaritmo", "fun_log"}
            };

            int operationChoice = ThreadLocalRandom.current().nextInt(0, otherOperations.length);
            String selectedOperation = otherOperations[operationChoice][0];
            String selectedId = otherOperations[operationChoice][1];

            System.out.println("[DEBUG] Función seleccionada: " + selectedOperation);

            // Operador ternario simplificado
            String operationButtonVar = (selectedOperation.equals("Raiz cuadrada") ||
                    selectedOperation.equals("Potencia"))
                    ? OPERATION_BUTTON + selectedId
                    : OPERATION_BUTTON.substring(0, OPERATION_BUTTON.lastIndexOf("/") + 1) + selectedId;


            int randomNum1 = ThreadLocalRandom.current().nextInt(1, 10);
            int randomNum2 = ThreadLocalRandom.current().nextInt(0, 10);
            int randomNum3 = ThreadLocalRandom.current().nextInt(0, 10);
            double resultExpectedDouble = 0.0;
            double inputNumber = (randomNum1*10)+randomNum2+(randomNum3/10.0);

            if (selectedOperation.equals("Potencia")) {
                callNumber(randomNum1,randomNum2,randomNum3, wait);
                clickElementById("Marcando botón "+selectedOperation,wait,operationButtonVar);
                clickElementById("Marcando el número "+randomNum2,wait,NUMBER_BUTTON+randomNum2);
                BigDecimal inputNumberBigDecimal = BigDecimal.valueOf(inputNumber);
                BigDecimal resultExpectedBigDecimal = inputNumberBigDecimal.pow(randomNum2).setScale(2, RoundingMode.HALF_UP);
                resultExpectedDouble = resultExpectedBigDecimal.doubleValue();
            } else if (selectedOperation.equals("Raiz cuadrada")) {
                clickElementById("Marcando botón "+selectedOperation,wait,operationButtonVar);
                callNumber(randomNum1,randomNum2,randomNum3, wait);
                resultExpectedDouble = Math.sqrt(inputNumber);

            } else if (selectedOperation.contains("logaritmo")) {
                clickElementById("Marcando menú de expansión otras operaciones ",wait,EXPAND_BUTTON);
                clickElementById("Marcando botón "+selectedOperation,wait,operationButtonVar);
                callNumber(randomNum1,randomNum2,randomNum3, wait);
                clickElementById("Marcando botón -",wait,"com.google.android.calculator:id/parens");
                resultExpectedDouble = (selectedOperation.contains("natural"))
                        ? Math.log(inputNumber)
                        : Math.log10(inputNumber);
            } else {
                clickElementById("Marcando menú de expansión otras operaciones ",wait,EXPAND_BUTTON);
                clickElementById("Marcando botón "+selectedOperation,wait,operationButtonVar);
                callNumber(randomNum1,randomNum2,randomNum3, wait);
                clickElementById("Marcando botón )",wait,"com.google.android.calculator:id/parens");
                double angleInRadians = Math.toRadians(inputNumber);
                resultExpectedDouble = (selectedOperation.equals(otherOperations[2][0]))
                        ? Math.sin(angleInRadians)
                        : (selectedOperation.equals(otherOperations[3][0]))
                        ? Math.cos(angleInRadians)
                        : Math.tan(angleInRadians);
            }

            clickElementById("Marcando botón =",wait,RESULT_BUTTON);
            String screenResult = getResult(wait).replace("−", "-").replace(",", "");
            double actualResultDouble;

            try {
                actualResultDouble = Double.parseDouble(screenResult);
            } catch (NumberFormatException e) {
                throw new RuntimeException("El resultado en pantalla no es un número válido: " + screenResult);
            }

            DecimalFormat df = new DecimalFormat("#.##");
            String resultExpected = df.format(resultExpectedDouble);
            String actualResult = df.format(actualResultDouble);


            takeScreenshotAndAssert("testOn"+selectedId,selectedId+"_app",softAssert,actualResult,resultExpected,"No realizó la operación adecuadamente");
            System.out.printf("El valor %s es igual al valor %s? %b%n", actualResult, resultExpected, actualResult.equals(resultExpected));
            System.out.println("[DEBUG] ("+(number)+") Test de otras operaciones concluido en " + deviceType);
        } catch (Exception e) {
            handleTestError(softAssert, "testOnFloat", e);
        }
    }

    @Test(priority = 9)
    public void factorialTest() {
        WebDriverWait wait = new WebDriverWait(driver, Duration.ofSeconds(25));

        try {
            System.out.println("[DEBUG] Inicio TEST ("+(number++)+") FACTORIAL CON LA APP en máximo 170 para evitar el overflow" + deviceType);
            int randomNum1 = ThreadLocalRandom.current().nextInt(0, 1);
            int randomNum2 = (randomNum1 == 0)
                            ? ThreadLocalRandom.current().nextInt(0, 10)
                            : ThreadLocalRandom.current().nextInt(0, 7);
            int randomNum3 = (randomNum1 == 1 && randomNum2 == 7 )
                            ? 0
                            : ThreadLocalRandom.current().nextInt(0, 9);


            clickElementById("Marcando el número "+randomNum1,wait,NUMBER_BUTTON+randomNum1);
            clickElementById("Marcando el número "+randomNum2,wait,NUMBER_BUTTON+randomNum2);
            clickElementById("Marcando el número "+randomNum3,wait,NUMBER_BUTTON+randomNum3);
            clickElementById("Marcando botón !",wait,OPERATION_BUTTON+"fact");
            clickElementById("Marcando botón =",wait,RESULT_BUTTON);

            BigInteger resultExpectedBigInteger = factorial(BigInteger.valueOf(randomNum1*100+randomNum2*10+randomNum3));

            String screenResult = getResult(wait).replace(",", "");
            double actualResultDouble = Double.parseDouble(screenResult);

            DecimalFormat scientificFormat = new DecimalFormat("0.####E0");

            String actualResult = scientificFormat.format(actualResultDouble);
            String resultExpected = scientificFormat.format(resultExpectedBigInteger.doubleValue());

            takeScreenshotAndAssert("testOnFactorial","factorial_app",softAssert,actualResult,resultExpected,"No realizó el factorial adecuadamente");
            System.out.printf("El valor %s es igual al valor %s? %b%n", actualResult, resultExpected, actualResult.equals(resultExpected));
            System.out.println("[DEBUG] ("+(number)+") Test de factorial concluido en " + deviceType);
        } catch (Exception e) {
            handleTestError(softAssert, "testOnFactorial", e);
        }
    }

    @Test(priority = 10)
    public void constantePiEulerTest() {
        WebDriverWait wait = new WebDriverWait(driver, Duration.ofSeconds(20));

        try {
            System.out.println("[DEBUG] Inicio TEST ("+(number++)+") CONSTANTES DE CALCULO en " + deviceType);

            String[][] constantNumber = {
                    {"PI","const_pi"},
                    {"Euler","const_e"}
            };

            int operationChoice = 1;//ThreadLocalRandom.current().nextInt(0, constantNumber.length);
            String selectedConstant = constantNumber[operationChoice][0];
            String selectedId = constantNumber[operationChoice][1];

            double resultExpectedDouble = Math.PI;
            if (!selectedConstant.equals("PI")) {
                clickElementById("Marcando menú de expansión otras operaciones ",wait,EXPAND_BUTTON);
                resultExpectedDouble = Math.E;
            }

            clickElementById("Marcando botón "+selectedConstant,wait,OPERATION_BUTTON.substring(0, OPERATION_BUTTON.lastIndexOf("/") + 1) + selectedId);

            clickElementById("Marcando botón =",wait,RESULT_BUTTON);

            String screenResult = getResult(wait).replace(",", ".");
            double actualResultDouble = Double.parseDouble(screenResult);

            DecimalFormat df = new DecimalFormat("#.####");
            String resultExpected = df.format(resultExpectedDouble);
            String actualResult = df.format(actualResultDouble);

            takeScreenshotAndAssert("testOnConst"+selectedConstant,"const_number_app"+selectedConstant,softAssert,String.valueOf(actualResult),String.valueOf(resultExpected),"No realizó la división adecuadamente");
            System.out.printf("El valor %s es igual al valor %s? %b%n", actualResult, resultExpected, actualResult.equals(resultExpected));
            System.out.println("[DEBUG] ("+(number)+") Test de constantes concluido en " + deviceType);
        } catch (Exception e) {
            handleTestError(softAssert, "testOnConst", e);
        }
    }

    @Test(priority = 11)
    public void correctionLastPressedKeysTest() {
        WebDriverWait wait = new WebDriverWait(driver, Duration.ofSeconds(30));

        try {
            System.out.println("[DEBUG] Inicio TEST ("+(number++)+") OPERACIONES ALEATORIAS en " + deviceType);

            // Definición de todas las operaciones posibles
            String[][] allOperations = {
                    {"Suma", "add"},
                    {"Resta", "sub"},
                    {"Multiplicación", "mul"},
                    {"División", "div"},
                    {"Factorial", "fact"},
                    {"Raiz cuadrada", "sqrt"},
                    {"Potencia", "pow"},
                    {"Función seno", "fun_sin"},
                    {"Función coseno", "fun_cos"},
                    {"Función tangente", "fun_tan"},
                    {"Función logaritmo natural", "fun_ln"},
                    {"Función logaritmo", "fun_log"}
            };

            // Generar números aleatorios (entre 3 y 4 números)
            int numCount = ThreadLocalRandom.current().nextInt(3, 5);
            int[] numbers = new int[numCount];

            for (int i = 0; i < numCount; i++) {
                numbers[i] = ThreadLocalRandom.current().nextInt(0, 10);
                clickElementById("Marcando el número " + numbers[i], wait, NUMBER_BUTTON + numbers[i]);
                System.out.println("Número ingresado: " + numbers[i]);
            }

            // Generar operaciones aleatorias (entre 2 y 3 operaciones)
            int opCount = ThreadLocalRandom.current().nextInt(2, 4);
            String[] selectedOperations = new String[opCount];
            String[] selectedOperationsId = new String[opCount];

            for (int i = 0; i < opCount; i++) {
                int randomOpIndex = ThreadLocalRandom.current().nextInt(0, allOperations.length);
                selectedOperations[i] = allOperations[randomOpIndex][0];
                selectedOperationsId[i] = allOperations[randomOpIndex][1];

                // Manejo especial para factorial (solo permitir si el último número es entero)
                if (selectedOperations[i].equals("fact")) {
                    // Verificar que el último número sea entero (0-9)
                    if (numbers[numbers.length-1] < 0 || numbers[numbers.length-1] > 9) {
                        i--; // Repetir esta iteración
                        continue;
                    }
                }

                clickElementById("Seleccionando operación: " + selectedOperations[i],
                        wait, OPERATION_BUTTON + selectedOperationsId[i]);


                // Para potencia, necesitamos ingresar el exponente
                if (selectedOperations[i].equals("pow")) {
                    int exponent = ThreadLocalRandom.current().nextInt(0, 5);
                    clickElementById("Marcando exponente: " + exponent, wait, NUMBER_BUTTON + exponent);
                    System.out.println("Exponente ingresado: " + exponent);
                }
            }

            // Borrar entradas aleatorias (1 o 2 veces)
            int deleteCount = ThreadLocalRandom.current().nextInt(1, 3);
            for (int i = 0; i < deleteCount; i++) {
                clickElementById("Borrando última entrada", wait, OPERATION_BUTTON.substring(0, OPERATION_BUTTON.lastIndexOf("/") + 1) + "del");
                System.out.println("Borrada entrada #" + (i+1));
            }

            // Calcular resultado
            clickElementById("Calculando resultado", wait, RESULT_BUTTON);

            // Obtener y mostrar resultado
            String result = getResult(wait);
            System.out.println("Resultado obtenido: " + result);

            // Tomar screenshot
            takeScreenshot("randomOperationsTest", "operaciones_aleatorias");

            System.out.println("[DEBUG] Test de operaciones aleatorias concluido en " + deviceType);
        } catch (Exception e) {
            handleTestError(softAssert, "randomOperationsTest", e);
        }
    }

    @Test(priority = 12)
    public void settingsAppTest() {
        WebDriverWait wait = new WebDriverWait(driver, Duration.ofSeconds(30));

        try {
            System.out.println("[DEBUG] Inicio TEST ("+(number++)+") CONFIGURACIÓN DE LA APP en " + deviceType);

            wait.until(ExpectedConditions.elementToBeClickable(By.xpath("//android.widget.ImageView[@content-desc=\"More options\"]"))).click();
            wait.until(ExpectedConditions.elementToBeClickable(By.xpath("//android.widget.TextView[@resource-id=\"com.google.android.calculator:id/title\" and @text=\"Choose theme\"]"))).click();
            wait.until(ExpectedConditions.elementToBeClickable(By.xpath("//android.widget.CheckedTextView[@resource-id=\"android:id/text1\" and @text=\"Dark\"]"))).click();
            wait.until(ExpectedConditions.elementToBeClickable(By.xpath("//android.widget.Button[@resource-id=\"android:id/button1\"]"))).click();
            // Verificar que el modo oscuro quedó activo
            wait.until(ExpectedConditions.elementToBeClickable(By.xpath("//android.widget.ImageView[@content-desc=\"More options\"]"))).click();
            wait.until(ExpectedConditions.elementToBeClickable(By.xpath("//android.widget.TextView[@resource-id=\"com.google.android.calculator:id/title\" and @text=\"Choose theme\"]"))).click();

            WebElement darkOption = wait.until(ExpectedConditions.presenceOfElementLocated(
                    By.xpath("//android.widget.CheckedTextView[@resource-id=\"android:id/text1\" and @text=\"Dark\"]")));
            String isChecked = darkOption.getAttribute("checked");  // debe ser "true"

            takeScreenshotAndAssert("testOnSettings","settings_"+deviceType,softAssert,String.valueOf(isChecked),"true", "El tema Dark no está seleccionado como se esperaba.");

            System.out.println("[DEBUG] (" + (number) + ") Test de configuración en " + deviceType);
        } catch (Exception e) {
            handleTestError(softAssert, "settingsAppTest", e);
        }
    }
    public void cleaningOperation(WebDriverWait wait) {
        clickElementById("Marcando botón AC", wait, AC_BUTTON);
    }

    private WebElement selectElementById(WebDriverWait wait, String id) {
        return wait.until(ExpectedConditions.elementToBeClickable(By.id(id)));
    }

    private void clickElementById(String actionDescription, WebDriverWait wait, String id) {
        System.out.println("[DEBUG] " + actionDescription);
        selectElementById(wait, id).click();
    }

    private String getResult(WebDriverWait wait) {
        WebElement element = wait.until(
                ExpectedConditions.visibilityOfElementLocated(
                        AppiumBy.id("com.google.android.calculator:id/result_final")
                )
        );
        return element.getText();
    }

    private String getResultByZero(WebDriverWait wait) {
        WebElement element = wait.until(
                ExpectedConditions.visibilityOfElementLocated(
                        AppiumBy.id("com.google.android.calculator:id/result_preview")
                )
        );
        return element.getText();
    }
    private void takeScreenshotAndAssert(String testName, String screenshotName, SoftAssert softAssert, String actual, String expected,
                                         String message) {
        takeScreenshot(testName + deviceType, screenshotName);
        softAssert.assertEquals(actual, expected, message);
    }

    private void handleTestError(SoftAssert softAssert, String testName, Exception e) {
        System.err.println("[ERROR] Fallo en " + testName + ": " + e.getMessage());
        softAssert.fail("Excepción durante la ejecución: " + e.getMessage());
    }

    private void callNumber(int randomNum1,int randomNum2,int randomNum3, WebDriverWait wait) {
        clickElementById("Marcando el número "+randomNum1,wait,NUMBER_BUTTON+randomNum1);
        clickElementById("Marcando el número "+randomNum2,wait,NUMBER_BUTTON+randomNum2);
        clickElementById("Marcando el separador de decimales ,",wait,DECIMAL_POINT_BUTTON);
        clickElementById("Marcando el número "+randomNum3,wait,NUMBER_BUTTON+randomNum3);

    }

    public static BigInteger factorial(BigInteger number) {
        if (number.compareTo(BigInteger.ZERO) < 0) {  // Comparación correcta
            throw new IllegalArgumentException("No existe factorial de números negativos");
        }

        BigInteger resultado = BigInteger.ONE;
        BigInteger i = BigInteger.TWO;  // Comenzar desde 2

        while (i.compareTo(number) <= 0) {  // Comparación "i <= number"
            resultado = resultado.multiply(i);
            i = i.add(BigInteger.ONE);  // Incremento en 1
        }

        return resultado;
    }

}
