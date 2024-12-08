from imports import *  
from configconstan import BrowserConfig
from Features.pages.Catalogue import Catalogue


class Cart(Catalogue):
    def __init__(self, chrome_browser):
        """Inicializa el navegador en la instancia Cart herendando de Catalogue que hereda de Login.
        Lo solicita para comenzar e incorporarlo en el resto de las funciones"""
        super().__init__(chrome_browser)

    def verify_login(self):
        """Verifica si el usuario está autenticado antes de ejecutar otras funciones."""
        if not self.logged_in:
            raise RuntimeError("Debes iniciar sesión primero usando la función login() Heredada de Catalogue que la heredo de Login.")
    
    def checkout(self):
        """Abre la página de checkout Your information."""
        self.verify_login()
        WebDriverWait(self.browser, BrowserConfig.TIMEOUTLOW).until(
            EC.element_to_be_clickable((By.ID, 'checkout'))
        ).click()
        return self
    
    def continue_shopping(self):
        """Se devuelve a la página de catalogue."""
        self.verify_login()
        WebDriverWait(self.browser, BrowserConfig.TIMEOUTLOW).until(
            EC.element_to_be_clickable((By.ID, 'continue-shopping'))
        ).click()
        return self