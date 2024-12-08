from imports import *  
from configconstan import BrowserConfig
from Features.pages.Cart import Cart


class Checkout_Information(Cart):
    def __init__(self, chrome_browser):
        """Inicializa el navegador en la instancia Checkout_Information herendando de Cart que hereda de Catalogue que hereda de Login.
        Lo solicita para comenzar e incorporarlo en el resto de las funciones"""
        super().__init__(chrome_browser)

    def verify_login(self):
        """Verifica si el usuario está autenticado antes de ejecutar otras funciones."""
        if not self.logged_in:
            raise RuntimeError("Debes iniciar sesión primero usando la función login() Heredada de Cart que la heredo de Catalogue que la heredo de Login.")
    
    def first_name(self,name_first):
        """Completa el campo de nombre del usuario."""
        self.verify_login()
        self.browser.find_element(By.ID, 'first-name').send_keys(name_first)

    def last_name(self,name_last):
        self.verify_login()
        """Completa el campo de apellido del usuario."""
        self.browser.find_element(By.ID, 'last-name').send_keys(name_last)

    def postal_code(self,code_postal):
        self.verify_login()
        """Completa el campo de código postal del usuario."""
        self.browser.find_element(By.ID, 'postal-code').send_keys(code_postal)

    def continue_button(self):
        """Abre la página de checkout overview confirmando los valores de los inputs."""
        self.verify_login()
        WebDriverWait(self.browser, BrowserConfig.TIMEOUTLOW).until(
            EC.element_to_be_clickable((By.ID, 'continue'))
        ).click()

    def cancel(self):
        """Se devuelve a la página de cart."""
        self.verify_login()
        WebDriverWait(self.browser, BrowserConfig.TIMEOUTLOW).until(
            EC.element_to_be_clickable((By.ID, 'cancel'))
        ).click()

    def continue_paying(self,name_first,name_last,code_postal):
        """Abre la página de checkout overview."""
        WebDriverWait(self.browser, BrowserConfig.TIMEOUTLOW).until(
            EC.presence_of_element_located((By.ID, 'postal-code')))
        self.first_name(name_first)
        self.last_name(name_last)
        self.postal_code(code_postal)
        self.continue_button()
        #time.sleep(BrowserConfig.TIMEOUTLOW)