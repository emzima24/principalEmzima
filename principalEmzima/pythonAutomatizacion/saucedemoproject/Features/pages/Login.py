from imports import *  
from configconstan import config,BrowserConfig  


class Login:
    def __init__(self, chrome_browser):
        """Inicializa el navegador en la instancia.
        Lo solicita para comenzar e incorporarlo en el resto de las funciones"""
        self.browser = chrome_browser

    def username(self):
        """Completa el campo de nombre de usuario."""
        self.browser.find_element(By.ID, 'user-name').send_keys(config.get('USERNAME'))

    def password(self):
        """Completa el campo de contraseña."""
        self.browser.find_element(By.ID, 'password').send_keys(config.get('PASSWORD'))

    def login_button(self):
        """Hace clic en el botón de login."""
        self.browser.find_element(By.ID, 'login-button').click()

    def login(self):
        """Realiza el inicio de sesión completo."""
        self.browser.get(BrowserConfig.BASE_URL)
        try:
            # Espera a que campo de usuario sea visibles
            WebDriverWait(self.browser, BrowserConfig.TIMEOUTLOW).until(
                EC.presence_of_element_located((By.ID, 'user-name'))
            )
            self.username()
            self.password()
            self.login_button()

            # Espera a que la URL cambie (indicando que el login fue exitoso)
            WebDriverWait(self.browser, BrowserConfig.TIMEOUTLOW).until(
                lambda driver: driver.current_url != BrowserConfig.BASE_URL
            )
            time.sleep(BrowserConfig.TIMEOUTLOW)
        except Exception as e:
            raise AssertionError(f"Login fallido: {e}")

        return self
    

    