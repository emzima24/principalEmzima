package org.example;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.net.MalformedURLException;
import java.net.URI;
import java.time.Duration;
import java.time.Instant;
import java.util.Arrays;
import java.util.Map;
import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.MethodOrderer;
import org.junit.jupiter.api.Order;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.TestMethodOrder;
import org.openqa.selenium.By;
import org.openqa.selenium.NoSuchElementException;
import org.openqa.selenium.OutputType;
import org.openqa.selenium.Point;
import org.openqa.selenium.StaleElementReferenceException;
import org.openqa.selenium.TakesScreenshot;
import org.openqa.selenium.TimeoutException;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.interactions.PointerInput;
import org.openqa.selenium.interactions.Sequence;
import io.appium.java_client.AppiumBy;
import io.appium.java_client.android.AndroidDriver;
import io.appium.java_client.android.options.UiAutomator2Options;

@TestMethodOrder(MethodOrderer.OrderAnnotation.class)
public class LocatorsTestEmulator {
    private AndroidDriver driver;

    // Constantes para configuración
    private static final String DEVICE_NAME = "Pixel_7";
    private static final String PLATFORM_NAME = "Android";
    private static final String APP_PACKAGE = "com.google.android.deskclock";
    private static final String APP_ACTIVITY = "com.android.deskclock.DeskClock";
    private static final String APPIUM_SERVER_URL = "http://127.0.0.1:4723";

    // IDs de elementos
    private static final String FAB_BUTTON_ID = APP_PACKAGE + ":id/fab";
    private static final String SEARCH_FIELD_ID = APP_PACKAGE + ":id/open_search_view_edit_text";
    private static final String SEARCH_RESULTS_XPATH = "//androidx.recyclerview.widget.RecyclerView[@resource-id='%s:id/search_results_view']/android.widget.LinearLayout[1]";
    private static final String WORLD_CLOCK_TAB = "Reloj mundial"; // Texto de accesibilidad

    @BeforeEach
    public void setUp() throws MalformedURLException {
        log("Iniciando configuración del driver...");
        Instant start = Instant.now();

        try {
            driver = crearConexionConParametros(DEVICE_NAME, PLATFORM_NAME, APP_ACTIVITY, APP_PACKAGE);
            log("Driver configurado correctamente en " + durationSince(start) + " ms");
        } catch (Exception e) {
            logError("Error al configurar el driver: " + e.getMessage());
            throw e;
        }
    }

    @AfterEach
    public void tearDown() {
        if (driver != null) {
            log("Cerrando driver...");
            driver.quit();
            log("Driver cerrado correctamente");
        }
    }

    @Test
    @Order(1)
    public void abrirApp() {
        log("Ejecutando prueba abrirApp...");
        Instant start = Instant.now();

        try {
            validarDriverInicializado();
            activarAplicacion();
            log("Prueba abrirApp completada en " + durationSince(start) + " ms");
        } catch (Exception e) {
            logError("Error en abrirApp: " + e.getMessage());
            throw e;
        }
    }

    @Test
    @Order(2)
    public void agregarCiudad() {
        log("Ejecutando prueba agregarCiudad...");
        Instant start = Instant.now();

        try {
            validarDriverInicializado();
            activarAplicacion();

            // Navegar a la pestaña de reloj mundial si es necesario
            navegarAPestanaRelojMundial();

            // Buscar y hacer clic en el botón FAB
            log("Buscando botón FAB...");
            waitAndFindElement(AppiumBy.id(FAB_BUTTON_ID)).click();
            log("Botón FAB encontrado y clickeado");

            // Buscar campo de texto y escribir "Paris"
            log("Buscando campo de búsqueda...");
            waitAndFindElement(AppiumBy.id(SEARCH_FIELD_ID)).sendKeys("Paris");
            log("Texto 'Paris' ingresado correctamente");

            // Seleccionar el primer resultado de búsqueda
            log("Buscando resultados de búsqueda...");
            String xpath = String.format(SEARCH_RESULTS_XPATH, APP_PACKAGE);
            waitAndFindElement(AppiumBy.xpath(xpath)).click();
            log("Primer resultado seleccionado");

            log("Prueba agregarCiudad completada en " + durationSince(start) + " ms");
        } catch (Exception e) {
            // Tomar captura de pantalla al fallar
            tomarCapturaPantalla("error_agregarCiudad");
            logError("Error en agregarCiudad: " + e.getMessage());
            throw e;
        }
    }

    @Test
    @Order(3)
    public void eliminarCiudad() {
        log("Ejecutando prueba eliminarCiudad...");
        Instant start = Instant.now();

        try {
            validarDriverInicializado();
            activarAplicacion();

            // Configurar el gesto de deslizamiento (swipe)
            log("Preparando gesto swipe...");
            final PointerInput finger = new PointerInput(PointerInput.Kind.TOUCH, "finger");
            PointerInput.Origin viewport = PointerInput.Origin.viewport();

            // Coordenadas para el swipe (ajustar según resolución del emulador)
            Point startPoint = new Point(837, 866);
            Point endPoint = new Point(227, 870);

            Sequence swipe = new Sequence(finger, 0);
            swipe.addAction(finger.createPointerMove(Duration.ZERO, viewport, startPoint.x, startPoint.y));
            swipe.addAction(finger.createPointerDown(PointerInput.MouseButton.LEFT.asArg()));
            swipe.addAction(finger.createPointerMove(Duration.ofMillis(1000), viewport, endPoint.x, endPoint.y));
            swipe.addAction(finger.createPointerUp(PointerInput.MouseButton.LEFT.asArg()));

            log("Ejecutando swipe...");
            driver.perform(Arrays.asList(swipe));
            log("Swipe completado");

            log("Prueba eliminarCiudad completada en " + durationSince(start) + " ms");
        } catch (Exception e) {
            logError("Error en eliminarCiudad: " + e.getMessage());
            throw e;
        }
    }

    @Test
    @Order(4)
    public void enviarBackground() {
        log("Ejecutando prueba enviarBackground...");
        Instant start = Instant.now();

        try {
            validarDriverInicializado();
            activarAplicacion();

            log("Enviando aplicación a segundo plano...");
            driver.executeScript("mobile: backgroundApp", Map.of("seconds", 2));
            log("Aplicación enviada a segundo plano correctamente");

            log("Prueba enviarBackground completada en " + durationSince(start) + " ms");
        } catch (Exception e) {
            logError("Error en enviarBackground: " + e.getMessage());
            throw e;
        }
    }

    @Test
    @Order(5)
    public void cerrarApp() {
        log("Ejecutando prueba cerrarApp...");
        Instant start = Instant.now();

        try {
            validarDriverInicializado();
            log("Cerrando aplicación...");
            driver.terminateApp(APP_PACKAGE);
            log("Aplicación cerrada correctamente");

            log("Prueba cerrarApp completada en " + durationSince(start) + " ms");
        } catch (Exception e) {
            logError("Error en cerrarApp: " + e.getMessage());
            throw e;
        }
    }

    // Métodos auxiliares mejorados
    private void activarAplicacion() {
        log("Activando aplicación...");
        validarDriverInicializado();
        driver.activateApp(APP_PACKAGE);
        log("Aplicación activada");
    }

    private void navegarAPestanaRelojMundial() {
        try {
            By worldClockTab = AppiumBy.accessibilityId(WORLD_CLOCK_TAB);
            waitAndFindElement(worldClockTab).click();
            log("Navegado a pestaña Reloj mundial");
        } catch (Exception e) {
            log("Pestaña Reloj mundial no encontrada, asumiendo que ya está activa");
        }
    }

    public AndroidDriver crearConexionConParametros(String deviceName, String platformName,
                                                    String appActivity, String appPackage) throws MalformedURLException {
        log("Creando conexión con parámetros...");
        UiAutomator2Options options = new UiAutomator2Options()
                .setDeviceName(deviceName)
                .setPlatformName(platformName)
                .setAppActivity(appActivity)
                .setAppPackage(appPackage)
                .setNoReset(true)
                .setAutoGrantPermissions(true)
                .setUiautomator2ServerLaunchTimeout(Duration.ofSeconds(30))
                .setNewCommandTimeout(Duration.ofSeconds(60));

        return new AndroidDriver(URI.create(APPIUM_SERVER_URL).toURL(), options);
    }

    private void validarDriverInicializado() {
        if (driver == null) {
            String errorMsg = "Driver no inicializado";
            logError(errorMsg);
            throw new IllegalStateException(errorMsg);
        }
    }

    private WebElement waitAndFindElement(By locator) {
        final Duration timeout = Duration.ofSeconds(15);
        final Duration interval = Duration.ofMillis(500);
        final Instant endTime = Instant.now().plus(timeout);

        while (Instant.now().isBefore(endTime)) {
            try {
                WebElement element = driver.findElement(locator);
                if (element.isDisplayed()) {
                    return element;
                }
            } catch (NoSuchElementException | StaleElementReferenceException e) {
                // Continuar esperando
            }
            try {
                Thread.sleep(interval.toMillis());
            } catch (InterruptedException e) {
                Thread.currentThread().interrupt();
                throw new RuntimeException("Espera interrumpida", e);
            }
        }
        throw new NoSuchElementException("Elemento no encontrado después de " + timeout.getSeconds() + " segundos: " + locator);
    }

    private void tomarCapturaPantalla(String nombreArchivo) {
        try {
            File screenshot = ((TakesScreenshot)driver).getScreenshotAs(OutputType.FILE);
            Files.copy(screenshot.toPath(), new File(nombreArchivo + ".png").toPath());
            log("Captura de pantalla guardada como: " + nombreArchivo + ".png");
        } catch (IOException ioException) {
            logError("No se pudo tomar captura de pantalla: " + ioException.getMessage());
        }
    }

    // Métodos de logging
    private void log(String message) {
        System.out.println("[INFO] " + Instant.now() + " - " + message);
    }

    private void logError(String message) {
        System.err.println("[ERROR] " + Instant.now() + " - " + message);
    }

    private long durationSince(Instant start) {
        return Duration.between(start, Instant.now()).toMillis();
    }
}