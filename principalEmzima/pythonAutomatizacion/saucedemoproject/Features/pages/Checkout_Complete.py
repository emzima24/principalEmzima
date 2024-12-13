from imports import *  
from configconstan import BrowserConfig
from Features.pages.Checkout_Overview import Checkout_Overview

class Checkout_Complete(Checkout_Overview):
    def __init__(self, chrome_browser):
        """Inicializa el navegador en la instancia Checkout_Complete que hereda Checkout_Overview herendando de Cart que hereda de Catalogue que hereda de Login.
        Lo solicita para comenzar e incorporarlo en el resto de las funciones"""
        super().__init__(chrome_browser)

    def verify_login(self):
        """Verifica si el usuario está autenticado antes de ejecutar otras funciones."""
        if not self.logged_in:
            raise RuntimeError("Debes iniciar sesión primero usando la función login() Heredada de Catalogue que la heredo de Login.")
        
    def back_home(self):
        """Se dirge a la pagina de catalog. """
        self.verify_login()
        WebDriverWait(self.browser, BrowserConfig.TIMEOUTLOW).until(
            EC.element_to_be_clickable((By.ID, 'back-to-products'))
        ).click()
        return self