from imports import *  
from configconstan import BrowserConfig, Cards 
from Features.pages.Catalogue import Catalogue


class Description(Catalogue):
    def __init__(self, chrome_browser):
        """Inicializa el navegador en la instancia Description herendando de Catalogue que hereda de Login.
        Lo solicita para comenzar e incorporarlo en el resto de las funciones"""
        super().__init__(chrome_browser)

    def verify_login(self):
        """Verifica si el usuario está autenticado antes de ejecutar otras funciones."""
        if not self.logged_in:
            raise RuntimeError("Debes iniciar sesión primero usando la función login() Heredada de Catalogue que la heredo de Login.")

    def add_to_cart(self, product_name):
        """Añade un producto al carro usando su ID."""
        product = Cards.products.get(product_name)
        self.verify_login()
        WebDriverWait(self.browser, BrowserConfig.TIMEOUTLOW).until(
            EC.element_to_be_clickable((By.ID, product['id_add_cart']))
        ).click()
        return self
    
    def cart(self):
        """Abre el carro de compras desde la barra superior."""
        self.verify_login()
        WebDriverWait(self.browser, BrowserConfig.TIMEOUTLOW).until(
            EC.element_to_be_clickable((By.ID, 'shopping_cart_container'))
        ).click()
        return self

    def back_to_products(self):
        """Se devuelve a la página de catalogo."""
        self.verify_login()
        WebDriverWait(self.browser, BrowserConfig.TIMEOUTLOW).until(
            EC.element_to_be_clickable((By.ID, 'back-to-products'))
        ).click()
        return self