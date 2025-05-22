package org.example;


import java.net.MalformedURLException;
import java.net.URI;
import java.time.Duration;
import java.util.Arrays;
import java.util.Map;
import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.MethodOrderer;
import org.junit.jupiter.api.Order;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.TestMethodOrder;
import org.openqa.selenium.Point;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.interactions.Pause;
import org.openqa.selenium.interactions.PointerInput;
import org.openqa.selenium.interactions.Sequence;
import org.openqa.selenium.support.ui.ExpectedConditions;
import org.openqa.selenium.support.ui.WebDriverWait;
import io.appium.java_client.AppiumBy;
import io.appium.java_client.android.AndroidDriver;
import io.appium.java_client.android.options.UiAutomator2Options;
// Pruebas en dispositivo físico Android Samsung A13
@TestMethodOrder(MethodOrderer.OrderAnnotation.class)

public class LocatorsTestPhone {
    private AndroidDriver driver;
    // Configuración de constantes para la app
    private static final String DEVICE_NAME = "R58W2054VLH";
    private static final String PLATFORM_NAME = "Android";
    private static final String APP_PACKAGE = "com.sec.android.app.clockpackage";
    private static final String APP_ACTIVITY =
            "com.sec.android.app.clockpackage.ClockPackage";
    private static final String FULL_APP = APP_PACKAGE + "/" + APP_ACTIVITY;
    @BeforeEach
    public void setUp() throws MalformedURLException, InterruptedException {
        driver = crearConexionConParametros(DEVICE_NAME, PLATFORM_NAME,
                APP_ACTIVITY, APP_PACKAGE);
        Thread.sleep(5000);// Espera para permitir carga inicial de la app
    }
    @AfterEach
    public void tearDown() {
        if (driver != null) {
            driver.quit();
        }
    }
    @Test
    @Order(1)
    public void abrirApp() throws InterruptedException {
        validarDriverInicializado();
        activarAplicacion();
        Thread.sleep(5000); // Espera para observar la apertura
        String actividad = driver.currentActivity();
        System.out.println("Actividad actual: " + actividad);
    }
    @Test
    @Order(2)
    public void agregarCiudad() throws InterruptedException {
        validarDriverInicializado();
        activarAplicacion();
// Clic en el botón "+"
        WebDriverWait wait = new WebDriverWait(driver, Duration.ofSeconds(10));
        WebElement botonAgregar =
                wait.until(ExpectedConditions.elementToBeClickable(
                        AppiumBy.id(APP_PACKAGE + ":id/menu_add")));
        botonAgregar.click();

// Clic en el botón de búsqueda
        WebDriverWait wait2 = new WebDriverWait(driver, Duration.ofSeconds(10));
        WebElement botonBusqueda =
                wait2.until(ExpectedConditions.elementToBeClickable(

                        AppiumBy.id(APP_PACKAGE + ":id/menu_search_song")));
        botonBusqueda.click();
// Ingresar texto en el campo de búsqueda (esto activa el teclado virtual)
        driver.findElement(AppiumBy.id(APP_PACKAGE +
                ":id/search_src_text")).sendKeys("Paris");
        Thread.sleep(2000);
// Tap en el primer resultado (coordenada estimada, puede variar)
        realizarTap(new Point(392, 428));
        Thread.sleep(1000);
// Clic en el botón "Añadir"
        WebDriverWait wait3 = new WebDriverWait(driver, Duration.ofSeconds(10));
        WebElement botonAnadir =
                wait3.until(ExpectedConditions.elementToBeClickable(

                        AppiumBy.id(APP_PACKAGE + ":id/worldclock_popup_add_button")));
        botonAnadir.click();
    }
    @Test
    @Order(3)
    public void eliminarCiudad() throws InterruptedException {
        validarDriverInicializado();
        activarAplicacion();
        Thread.sleep(3000);
// Swipe horizontal desde una ciudad añadida (coordenadas pueden variar)
        realizarSwipe(new Point(884, 1134), new Point(200, 1139));
        Thread.sleep(1000);
// Tap en el icono de eliminar (coordenada específica)
        realizarTap(new Point(560, 2163));
    }
    @Test
    @Order(4)
    public void enviarBackground() throws InterruptedException {
        validarDriverInicializado();
        driver.activateApp(FULL_APP);
// Enviar la app al segundo plano por 2 segundos
        driver.executeScript("mobile: backgroundApp",
                Map.ofEntries(Map.entry("seconds", 2)));

    }
    @Test
    @Order(5)
    public void cerrarApp() throws InterruptedException {
// Cierra la aplicación por completo
        driver.terminateApp(APP_PACKAGE);
    }
    // Activa la app si el driver está inicializado
    private void activarAplicacion() {

        if (driver != null) {
            driver.activateApp(FULL_APP);
        } else {
            System.out.println("El driver no está inicializado.");
        }
    }
    // Método para crear conexión con parámetros
    public AndroidDriver crearConexionConParametros(String deviceName, String
            platformName,

                                                    String appActivity, String appPackage) throws MalformedURLException {
        UiAutomator2Options options = new UiAutomator2Options()
                .setDeviceName(deviceName)
                .setPlatformName(platformName)
                .setAppActivity(appActivity)
                .setAppPackage(appPackage)
                .setNoReset(true);
        return inicializarDriver(options);
    }
    // Inicializa el driver de Appium
    private AndroidDriver inicializarDriver(UiAutomator2Options options) throws
            MalformedURLException {
        return new AndroidDriver(URI.create("http://127.0.0.1:4723").toURL(),
                options);
    }
    // Valida si el driver fue inicializado correctamente
    private void validarDriverInicializado() {
        if (driver == null) {
            throw new IllegalStateException("El driver no está inicializado.");
        }
    }
    // Simula un gesto de tap en una posición específica de la pantalla
    private void realizarTap(Point tapPoint) {
        final var finger = new PointerInput(PointerInput.Kind.TOUCH, "finger");
        var tap = new Sequence(finger, 1);
        tap.addAction(finger.createPointerMove(Duration.ofMillis(0),
                PointerInput.Origin.viewport(), tapPoint.x, tapPoint.y));
        tap.addAction(finger.createPointerDown(PointerInput.MouseButton.LEFT.asArg()));
        tap.addAction(new Pause(finger, Duration.ofMillis(50)));
        tap.addAction(finger.createPointerUp(PointerInput.MouseButton.LEFT.asArg()));
        driver.perform(Arrays.asList(tap));
    }
    // Simula un gesto de swipe entre dos puntos
    private void realizarSwipe(Point start, Point end) {
        final var finger = new PointerInput(PointerInput.Kind.TOUCH, "finger");
        var swipe = new Sequence(finger, 1);
        swipe.addAction(finger.createPointerMove(Duration.ofMillis(0),
                PointerInput.Origin.viewport(), start.x, start.y));

        swipe.addAction(finger.createPointerDown(PointerInput.MouseButton.LEFT.asArg()));
        swipe.addAction(finger.createPointerMove(Duration.ofMillis(1000),
                PointerInput.Origin.viewport(), end.x, end.y));

        swipe.addAction(finger.createPointerUp(PointerInput.MouseButton.LEFT.asArg()));

        driver.perform(Arrays.asList(swipe));
    }
}