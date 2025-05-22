package org.example;

import com.google.common.collect.ImmutableMap;
import io.appium.java_client.AppiumBy;
import io.appium.java_client.android.Activity;
import io.appium.java_client.android.AndroidDriver;
import io.appium.java_client.android.nativekey.AndroidKey;
import io.appium.java_client.android.nativekey.KeyEvent;
import org.openqa.selenium.By;
import org.openqa.selenium.Dimension;
import org.openqa.selenium.Point;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.interactions.PointerInput;
import org.openqa.selenium.interactions.Sequence;
import org.openqa.selenium.support.ui.ExpectedConditions;
import org.openqa.selenium.support.ui.WebDriverWait;
import org.testng.annotations.BeforeMethod;
import org.testng.annotations.Test;
import org.testng.asserts.SoftAssert;

import java.time.Duration;
import java.util.*;
import java.util.concurrent.ThreadLocalRandom;
import java.util.stream.Collectors;

public class SelectDeviceWDIOAppTest extends BaseTest {
    private String deviceType;
    private static final String VALID_EMAIL = "testuser@correo.com";
    private static final String INVALID_EMAIL = "testuser.correo.com";
    private static final String VALID_PASSWORD = "12345678";
    private static final String SHORT_PASSWORD = "12345";
    SoftAssert softAssert = new SoftAssert();
    int[][] pointsStart = {{639, 1864}, {437, 1924},{536, 2066},{103, 1929},{926, 1886},{399, 2049},{304, 1869},{711, 2074},{780, 1899}};
    int[][] pointsEnd = {{544, 609}, {724, 677},{356, 604},{321, 814},{759, 831},{493, 879},{733, 1067},{343, 1059},{536, 1067}};


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

        softAssert = new SoftAssert(); // Reiniciar antes de cada test

    }

    // ========== TESTS PRINCIPALES ========== //

    @Test( priority = 1 )
    public void testLoginWithValidCredentials() {
        WebDriverWait wait = new WebDriverWait(driver, Duration.ofSeconds(15));

        try {
            navigateToLoginScreen(wait);

            enterCredentials("valid", "valid", wait, VALID_EMAIL, VALID_PASSWORD);

            performLogin(wait);

            verifySuccessfulLogin(wait);

            System.out.println("[DEBUG] Login exitoso en " + deviceType);
        } catch (Exception e) {
            System.err.println("[ERROR] Fallo en testLogin: " + e.getMessage());
            throw e;
        }
    }

    @Test( priority = 2 )
    public void testLoginWithInvalidEmail() {
        WebDriverWait wait = new WebDriverWait(driver, Duration.ofSeconds(15));

        try {
            navigateToLoginScreen(wait);

            enterCredentials("invalid", "valid", wait, INVALID_EMAIL, VALID_PASSWORD);

            performLogin(wait);

            String messageEmailInvalid = getElementTextByXpath(wait, "//android.widget.TextView[@text=\"Please enter a valid email address\"]");

            takeScreenshotAndAssert("testLoginOn", "email_invalid", softAssert, messageEmailInvalid, "Please enter a valid email address", "El mensaje no coincide");

            softAssert.assertFalse(validateEmailFormat(INVALID_EMAIL), "El correo no contiene @");
        } catch (Exception e) {
            System.err.println("[ERROR] Fallo en testLoginWithInvalidEmail: " + e.getMessage());
            throw e;
        } finally {
            softAssert.assertAll();
        }
    }

    @Test( priority = 3 )
    public void testLoginWithShortPassword() {
        WebDriverWait wait = new WebDriverWait(driver, Duration.ofSeconds(15));

        try {
            navigateToLoginScreen(wait);

            enterCredentials("valid", "invalid", wait, VALID_EMAIL, SHORT_PASSWORD);

            performLogin(wait);

            String messagePasswordInvalid = getElementTextByXpath(wait, "//android.widget.TextView[@text=\"Please enter at least 8 characters\"]");

            takeScreenshotAndAssert("testLoginOn", "password_invalid", softAssert, messagePasswordInvalid, "Please enter at least 8 characters", "El mensaje no coincide");

            softAssert.assertFalse(validatePasswordLength(SHORT_PASSWORD), "El password contiene menos de 8 caracteres");
        } catch (Exception e) {
            System.err.println("[ERROR] Fallo en testLoginWithShortPassword: " + e.getMessage());
            throw e;
        } finally {
            softAssert.assertAll();
        }
    }

    @Test( priority = 4 )
    public void testFormsInputTextVerification() {
        WebDriverWait wait = new WebDriverWait(driver, Duration.ofSeconds(15));

        try {
            navigateToFormsScreen(wait);

            putElementTextByXpath("Ingresando texto", wait, "//android.widget.EditText[@content-desc=\"text-input\"]", "Boludo que ladilla");

            String inputText = getElementTextByXpath(wait,
                    "//android.widget.TextView[@content-desc=\"input-text-result\"]");

            takeScreenshotAndAssert("testFormOn", "input_text", softAssert, inputText, "Boludo que ladilla",
                    "El texto ingresado no coincide");
        } catch (Exception e) {
            handleTestError(softAssert, "testInputTextVerification", e);
        } finally {
            softAssert.assertAll();
        }
    }

    @Test( priority = 5 )
    public void testFormsSwitchInteraction() {
        WebDriverWait wait = new WebDriverWait(driver, Duration.ofSeconds(15));

        try {
            navigateToFormsScreen(wait);

            clickElementByXpath("Haciendo clic en el switch", wait, "//android.widget.Switch[@content-desc=\"switch\"]");

            String switchState = getElementTextByXpath(wait,
                    "//android.widget.TextView[@content-desc=\"switch-text\"]");

            takeScreenshotAndAssert("testFormsOn", "switch_state", softAssert, switchState, "Click to turn the switch OFF", "El texto no coincide");

        } catch (Exception e) {
            handleTestError(softAssert, "testSwitchInteraction", e);
        } finally {
            softAssert.assertAll();
        }
    }

    @Test( priority = 6 )
    public void testFormsDropdownSelection() {
        WebDriverWait wait = new WebDriverWait(driver, Duration.ofSeconds(15));

        try {
            navigateToFormsScreen(wait);

            clickElementByXpath("Abriendo dropdown", wait, "//android.widget.TextView[@text=\"\uDB80\uDD40\"]");

            clickElementByXpath("Seleccionando opción", wait, "//android.widget.CheckedTextView[@resource-id=\"android:id/text1\" and @text=\"Appium is awesome\"]");

            String dropdownText = getElementTextByXpath(wait, "//android.widget.EditText[@resource-id=\"text_input\"]");

            takeScreenshotAndAssert("testFormOn", "dropdown_selection", softAssert, dropdownText, "Appium is awesome",
                    "La selección no coincide");
        } catch (Exception e) {
            handleTestError(softAssert, "testDropdownSelection", e);
        } finally {
            softAssert.assertAll();
        }
    }

    @Test( priority = 7 )
    public void testFormsActiveButton() {
        WebDriverWait wait = new WebDriverWait(driver, Duration.ofSeconds(15));

        try {
            navigateToFormsScreen(wait);

            clickElementByXpath("Haciendo clic en el boton Active", wait, "//android.view.ViewGroup[@content-desc=\"button-Active\"]/android.view.ViewGroup");

            String activeButton = getElementTextByXpath(wait, "//android.widget.TextView[@resource-id=\"android:id/message\"]");

            takeScreenshot("testFormsOn" + deviceType, "button_active");

            clickElementByXpath("Haciendo clic en ok", wait, "//android.widget.Button[@resource-id=\"android:id/button1\"]");

            takeScreenshotAndAssert("testFormsOn", "return_form", softAssert, activeButton, "This button is active", "El mensaje no coincide");
        } catch (Exception e) {
            handleTestError(softAssert, "testReturnToHome", e);
        } finally {
            softAssert.assertAll();
        }
    }

    @Test( priority = 8 )
    public void testSwipeToJsfoundation() {
        WebDriverWait wait = new WebDriverWait(driver, Duration.ofSeconds(15));

        try {
            int attempt = 0;
            String targetText = "JS.FOUNDATION";
            boolean elementFound = false;
            int maxAttempts = 5;

            navigateToSwipeScreen(wait);

            for (attempt = 0; attempt <= maxAttempts && !elementFound; attempt++) {
                try {
                    List<WebElement> allTextViews = driver.findElements(By.xpath("//android.widget.TextView"));
                    System.out.println("[DEBUG] Total TextViews encontrados: " + allTextViews.size());

                    List<WebElement> uppercaseTextViews = allTextViews.stream()
                            .filter(element -> {
                                try {
                                    String text = element.getText();
                                    return text != null && !text.trim().isEmpty() && text.equals(text.toUpperCase())
                                            && text.matches("^[A-Z\\s\\.]+$");
                                } catch (Exception e) {
                                    return false;
                                }
                            })
                            .collect(Collectors.toList());

                    System.out.println("[DEBUG] Elementos filtrados: " +
                            uppercaseTextViews.stream().map(WebElement::getText).collect(Collectors.toList()));

                    if (!uppercaseTextViews.isEmpty()) {
                        if (uppercaseTextViews.get(0).getText().equals(targetText)) {
                            elementFound = true;
                            System.out.println("[SUCCESS] " + targetText + " encontrado como primer elemento");
                            String targetFound = getElementTextByXpath(wait, "//android.widget.TextView[@text=\"JS.FOUNDATION\"]");
                            takeScreenshotAndAssert("testOnSwipeJSFundation", "found_js_foundation", softAssert, targetFound, "JS.FOUNDATION", "Mensaje no coincide con el esperado");
                        } else {
                            // Calcular coordenadas
                            Dimension size = driver.manage().window().getSize();
                            int startX = (int) (size.width * 0.8);
                            int endX = (int) (size.width * 0.2);
                            int y = size.height / 2;

                            performMoveHorizontalVerticalSwipe("Realizando swipe horizontal para encontrar JSFoundation",startX,y,endX,y);
                            System.out.println("[ACTION] Realizando swipe para posicionar " + targetText);
                        }
                    }

                } catch (Exception e) {
                    System.out.println("[DEBUG] Error en intento " + attempt + ": " + e.getMessage());
                }
            }

            softAssert.assertTrue(elementFound,
                    "No se encontró el tercer elemento (JS.FOUNDATION) después de " + maxAttempts + " swipes");

        } catch (Exception e) {
            handleTestError(softAssert, "testOnSwipeJSFundation", e);
        } finally {
            softAssert.assertAll();
        }
    }


    @Test( priority = 9 )
    public void testLanguageChangeToSpanish() {
        WebDriverWait wait = new WebDriverWait(driver, Duration.ofSeconds(60));

        try {
            navigateToWebview(wait);

            waitForNavigationBar(wait);

            retryClick(wait, "//android.widget.Button[contains(@text, 'Toggle') or contains(@content-desc, 'Toggle')]",
                    5, 3000);

            retryClick(wait, "//*[contains(@text, 'Languages') or contains(@content-desc, 'Languages')]",
                    3, 2000);

            Thread.sleep(2000); // Espera para animación
            retryClick(wait, "//*[contains(@text, 'Español') or contains(@content-desc, 'Español')]",
                    3, 2000);

            String expectedText = "WebdriverIO · Marco de prueba de automatización móvil y navegador de próxima generación para Node.js | WebdriverIO";
            String actualText = waitWithRefresh(wait,
                    "//*[contains(@text, '" + expectedText + "') or contains(@content-desc, '" + expectedText + "')]",
                    5, 5000).getText();

            takeScreenshotAndAssert("testOnWebviewLanguageChangeToSpanish", "spanish_verified",
                    softAssert, actualText, expectedText, "El texto no coincide en español");

        } catch (Exception e) {
            handleTestError(softAssert, "testOnWebviewLanguageChangeToSpanish", e);
        } finally {
            softAssert.assertAll();
        }
    }

    @Test( priority = 10 )
    public void testDragToCongratulations() {
        WebDriverWait wait = new WebDriverWait(driver, Duration.ofSeconds(15));

        try {
            navigateToDragScreen(wait);
            for (int piece = 0; piece < pointsStart.length; piece++) {
                var start = new Point(pointsStart[piece][0],pointsStart[piece][1]);
                var end = new Point(pointsEnd[piece][0],pointsEnd[piece][1]);
                performMoveHorizontalVerticalSwipe("Ordenando la pieza del rompecabezas ("+(piece+1)+")",start.getX(),start.getY(),end.getX(),end.getY());
                if (piece ==  pointsStart.length - 1) {
                    takeScreenshot("puzzleEnd","puzzle_ok");
                }
            }

            String subText = getElementTextByXpath(wait, "//android.widget.TextView[@text=\"You made it, click retry if you want to try it again.\"]");

            takeScreenshotAndAssert("testOnDrag", "puzzle_ok_congratulation", softAssert, subText, "You made it, click retry if you want to try it again.", "El mensaje no coincide");

            clickElementByXpath("Haciendo clic en para volver al rompecabezas desarmado", wait, "//android.view.ViewGroup[@content-desc=\"button-Retry\"]/android.view.ViewGroup");

        } catch (Exception e) {
            handleTestError(softAssert, "testOnDrag", e);
        } finally {
            softAssert.assertAll();
        }
    }

    @Test( priority = 11 )
    public void testDragToIncomplete() {
        WebDriverWait wait = new WebDriverWait(driver, Duration.ofSeconds(15));

        try {
            navigateToDragScreen(wait);
            int numberIncomplete =  ThreadLocalRandom.current().nextInt(1,9);
            System.out.println("[DEBUG] Se hará para un total de ("+(numberIncomplete)+")" );

            for (int piece = 0; piece < numberIncomplete; piece++) {
                var start = new Point(pointsStart[piece][0],pointsStart[piece][1]);
                var end = new Point(pointsEnd[piece][0],pointsEnd[piece][1]);
                performMoveHorizontalVerticalSwipe("Ordenando la pieza del rompecabezas ("+(piece+1)+")",start.getX(),start.getY(),end.getX(),end.getY());
            }

            String titleDrag = getElementTextByXpath(wait, "//android.widget.TextView[@text=\"Drag and Drop\"]");

            takeScreenshotAndAssert("testOnDrag", "puzzle_incomplete_"+(numberIncomplete)+"_piece", softAssert, titleDrag, "Drag and Drop", "El mensaje no coincide");

            clickElementByXpath("Haciendo clic en para volver al rompecabezas desarmado", wait, "//android.widget.TextView[@text=\"\uDB80\uDC6A\"]");

            List<WebElement> allPiecesViews = driver.findElements(AppiumBy.androidUIAutomator("new UiSelector().className(\"android.widget.ImageView\")"));
            // System.out.println("[DEBUG] Total piezas encontradas: " + allPiecesViews.size());

            List<WebElement> filteredPieces = new ArrayList<>();

            for (WebElement piece : allPiecesViews) {
                String bounds = piece.getAttribute("bounds");

                // Excluir el elemento con bounds específico
                if (!"[212,530][868,1186]".equals(bounds)) {
                    filteredPieces.add(piece);
                }
            }

            // Verificar que quedaron 9 elementos
            System.out.println("[DEBUG] Total piezas después de filtrar el marco del rompecabezas: " + filteredPieces.size());
            softAssert.assertEquals(filteredPieces.size(), 9, "El filtro no dejó 9 piezas");

            // Imprimir detalles de las piezas filtradas
            /*for (int i = 0; i < filteredPieces.size(); i++) {
                WebElement piece = filteredPieces.get(i);
                System.out.print("[DEBUG] Pieza " + (i + 1) + ": ");
                System.out.println("  - Bounds: " + piece.getAttribute("bounds"));
            }*/

        } catch (Exception e) {
            handleTestError(softAssert, "testOnDrag", e);
        } finally {
            softAssert.assertAll();
        }
    }

    @Test( priority = 12 )
    public void testContextSwitch() {
        WebDriverWait wait = new WebDriverWait(driver, Duration.ofSeconds(60)); // Aumentamos a 40 segundos

        try {
            navigateToWebview(wait);

            waitForNavigationBar(wait);

            retryClick(wait, "//android.widget.Button[contains(@text, 'Toggle') or contains(@content-desc, 'Toggle')]",
                    5, 3000);

            String[][] socialNetwork = {
                    {"GitHub", "GitHub repository","github.com/webdriverio/webdriverio"},
                    {"Twitter", "@webdriverio on Twitter","x.com/webdriverio"},
                    {"Youtube", "@webdriverio on YouTube","WebdriverIO"},
                    {"Discord", "Support Chat on Discord","discord.com/invite/H4v23gQvkm"}};

            int selectionSocialNetwork = ThreadLocalRandom.current().nextInt(0, socialNetwork.length);

            System.out.println("[DEBUG] Red social seleccionada: " + socialNetwork[selectionSocialNetwork][0]);

            retryClick(wait, "//android.view.View[@content-desc=\""+socialNetwork[selectionSocialNetwork][1]+"\"]",
                    3, 2000);


            String expectedText = socialNetwork[selectionSocialNetwork][2];
            String actualText = caseSocialNetwork(socialNetwork[selectionSocialNetwork][0],wait);

            takeScreenshotAndAssert("testOnContext", "change_context_"+socialNetwork[selectionSocialNetwork][0],
                    softAssert, actualText, expectedText, "El texto no coincide en español");


            // Cerrar apps limpiamente
            Thread.sleep(1000);
            String appToClose = socialNetwork[selectionSocialNetwork][0].equals(socialNetwork[2][0])
                    ? socialNetwork[2][0]
                    : "Chrome";

            driver.executeScript("mobile: pressKey", Map.ofEntries(Map.entry("keycode", 187)));
            Thread.sleep(2000);
            clickElementByXpath("Abriendo el menu contextual de "+appToClose,wait,"//android.view.View[@resource-id=\"com.google.android.apps.nexuslauncher:id/icon\"]");
            Thread.sleep(2000);
            clickElementByXpath("Cerrando "+appToClose,wait,"//android.widget.LinearLayout[@resource-id=\"com.google.android.apps.nexuslauncher:id/menu_option_layout\"]/android.widget.LinearLayout[6]");
            Thread.sleep(2000);
            clickElementByXpath("Abriendo el menu contextual de wdiodemoapp",wait,"//android.view.View[@resource-id=\"com.google.android.apps.nexuslauncher:id/icon\"]");
            Thread.sleep(2000);
            clickElementByXpath("Cerrando wdiodemoapp",wait,"//android.widget.LinearLayout[@resource-id=\"com.google.android.apps.nexuslauncher:id/menu_option_layout\"]/android.widget.LinearLayout[5]");


        } catch (Exception e) {
            handleTestError(softAssert, "testOnWebviewLanguageChangeToSpanish", e);
        } finally {
            softAssert.assertAll();
        }
    }





    private WebElement waitWithRefresh(WebDriverWait wait, String xpath, int maxAttempts, long delayMillis) throws Exception {
        for (int attempt = 1; attempt <= maxAttempts; attempt++) {
            try {
                return wait.until(ExpectedConditions.presenceOfElementLocated(By.xpath(xpath)));
            } catch (Exception e) {
                if (attempt == maxAttempts) throw e;
                System.out.println("[REFRESH] Reintento " + attempt + " para: " + xpath);
                driver.navigate().refresh(); // Refrescar la vista si está disponible
                Thread.sleep(delayMillis);
            }
        }
        throw new Exception("Elemento no encontrado después de " + maxAttempts + " intentos");
    }

    // ========== MÉTODOS REUTILIZABLES ========== //

    private void navigateToLoginScreen(WebDriverWait wait) {
        clickElementByXpath("Navegando a pantalla de Login", wait, "//android.widget.TextView[@text=\"\uDB80\uDF42\"]");
    }

    private void navigateToFormsScreen(WebDriverWait wait) {
        clickElementByXpath("Navegando a pantalla de Forms", wait, "//android.widget.TextView[@text=\"\uDB80\uDFEB\"]");
    }

    private void navigateToSwipeScreen(WebDriverWait wait) {
        clickElementByXpath("Navegando a pantalla de Swipe", wait, "//android.widget.TextView[@text=\"\uDB82\uDD3C\"]");
    }

    private void navigateToWebview(WebDriverWait wait) {
        clickElementByXpath("Navegando a webView", wait, "//android.widget.TextView[@text=\"\uDB81\uDD9F\"]");
    }
    private void navigateToDragScreen(WebDriverWait wait) {
        clickElementByXpath("Navegando al rompecabezas", wait, "//android.widget.TextView[@text=\"\uDB80\uDDDB\"]");
    }

    private void enterCredentials(String typeEmail, String typePassword, WebDriverWait wait, String email, String password) {
        putElementTextByXpath("Ingresando email" + typeEmail, wait, "//android.widget.EditText[@content-desc=\"input-email\"]", email);
        putElementTextByXpath("Ingresando password" + typePassword, wait, "//android.widget.EditText[@content-desc=\"input-password\"]", password);
    }

    private void performLogin(WebDriverWait wait) {
        clickElementByXpath("Confirmando login", wait, "//android.widget.TextView[@text=\"LOGIN\"]");
    }

    private void verifySuccessfulLogin(WebDriverWait wait) {
        String message = getElementTextByXpath(wait, "//android.widget.TextView[@resource-id=\"android:id/message\"]");

        takeScreenshotAndAssert("testLoginOn", "success_message", softAssert, message, "You are logged in!", "El mensaje de éxito no coincide");
        clickElementByXpath("Click en OK", wait, "//android.widget.Button[@resource-id=\"android:id/button1\"]");
    }

    private boolean validateEmailFormat(String email) {
        return email != null && email.matches("^[^@]+@[^@]+\\.[^@]+$");
    }

    private boolean validatePasswordLength(String password) {
        return password != null && password.length() >= 8;
    }

    private void clickElementByXpath(String actionDescription, WebDriverWait wait, String xpath) {
        System.out.println("[DEBUG] " + actionDescription);
        wait.until(ExpectedConditions.elementToBeClickable(By.xpath(xpath))).click();
    }


    private String getElementTextByXpath(WebDriverWait wait, String xpath) {
        return wait.until(ExpectedConditions.visibilityOfElementLocated(By.xpath(xpath))).getText();
    }

    private void putElementTextByXpath(String actionDescription, WebDriverWait wait, String xpath, String text) {
        System.out.println("[DEBUG] " + actionDescription);
        wait.until(ExpectedConditions.elementToBeClickable(By.xpath(xpath))).sendKeys(text);
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

    private void waitForNavigationBar(WebDriverWait wait) throws Exception {
        // Intentar diferentes selectores para el botón de navegación
        String[] possibleSelectors = {
                "//android.widget.Button[@text='Toggle navigation bar']"
                // "//android.widget.Button[contains(@content-desc, 'menu')]",
                // "//android.widget.Button[contains(@resource-id, 'menu')]",
                // "//android.widget.ImageButton[contains(@content-desc, 'Toggle')]"

        };

        for (String selector : possibleSelectors) {
            try {
                wait.until(ExpectedConditions.presenceOfElementLocated(By.xpath(selector)));
                return;
            } catch (Exception e) {
                System.out.println("No se encontró con selector: " + selector);
            }
        }
        throw new Exception("No se pudo encontrar el botón de navegación después de probar múltiples selectores");
    }



    private void retryClick(WebDriverWait wait, String xpath, int maxAttempts, long delayMillis) throws Exception {
        for (int attempt = 1; attempt <= maxAttempts; attempt++) {
            try {
                WebElement element = wait.until(ExpectedConditions.elementToBeClickable(By.xpath(xpath)));
                element.click();
                return;
            } catch (Exception e) {
                if (attempt == maxAttempts) throw e;
                System.out.println("[RETRY] Reintento " + attempt + " para: " + xpath);
                takeScreenshot("retry_attempt", "attempt_" + attempt + "_for_" + xpath);
                Thread.sleep(delayMillis);
            }
        }
    }

    // Método para swipe horizontal y el ordnemiento de piezas
    private void performMoveHorizontalVerticalSwipe(String actionDescription ,int startX, int startY, int endX,int endY) throws InterruptedException {

        System.out.println("[DEBUG] "+actionDescription);
        Thread.sleep(1000);

        // Crear la secuencia de acciones
        PointerInput finger = new PointerInput(PointerInput.Kind.TOUCH, "finger");
        Sequence swipe = new Sequence(finger, 1);

        // 1. Mover el dedo a la posición inicial
        swipe.addAction(finger.createPointerMove(Duration.ZERO,
                PointerInput.Origin.viewport(), startX, startY));
        // 2. Presionar
        swipe.addAction(finger.createPointerDown(PointerInput.MouseButton.LEFT.asArg()));
        // 4. Mover a la posición final
        swipe.addAction(finger.createPointerMove(Duration.ofMillis(1000),
                PointerInput.Origin.viewport(), endX, endY));
        // 5. Soltar
        swipe.addAction(finger.createPointerUp(PointerInput.MouseButton.LEFT.asArg()));

        // Ejecutar la secuencia
        driver.perform(Collections.singletonList(swipe));
    }

    private String caseSocialNetwork(String socialNetworkName, WebDriverWait wait) throws Exception {
        System.out.println("[DEBUG] Cambiando de contexto a la red social ("+socialNetworkName+")");

        Thread.sleep(3000);

        switch (socialNetworkName){
            case "GitHub":
            case "Twitter":
            case "Discord":
                return getElementTextByXpath(wait, "//android.widget.EditText[@resource-id=\"com.android.chrome:id/url_bar\"]");

            default:
                // clickElementByXpath("Haciendo clic en permitir en Youtube",wait,"//android.widget.Button[@resource-id=\"com.android.permissioncontroller:id/permission_allow_button\"]");
                Thread.sleep(2000);
                //clickElementByXpath("Seleccionando Nonmbre del canal de youtube",wait,"//android.view.ViewGroup[@content-desc=\"WebdriverIO\"]");

                return wait.until(ExpectedConditions.visibilityOfElementLocated(
                        AppiumBy.androidUIAutomator("new UiSelector().description(\"WebdriverIO\")"))
                        ).getAttribute("content-desc");
        }
    }
}

