from imports import *  
from configconstan import BrowserConfig, Cards 
from features.pages.Login import Login


class Catalogue(Login):
    def __init__(self, chrome_browser):
        """Inicializa el navegador en la instancia Catalogue herendando de Login.
        Lo solicita para comenzar e incorporarlo en el resto de las funciones"""
        super().__init__(chrome_browser)

    def verify_login(self):
        """Verifica si el usuario está autenticado antes de ejecutar otras funciones."""
        if not self.logged_in:
            raise RuntimeError("Debes iniciar sesión primero usando la función login() heredada de Login.")

    def hamburger_menu(self):
        """Abre el menú hamburguesa desde la página principal."""
        self.verify_login()
        WebDriverWait(self.browser, BrowserConfig.TIMEOUTLOW).until(
            EC.element_to_be_clickable((By.ID, 'react-burger-menu-btn'))
        ).click()
        return self

    def all_items(self):
        """Selecciona la opción 'All Items' en el menú."""
        WebDriverWait(self.browser, BrowserConfig.TIMEOUTLOW).until(
            EC.element_to_be_clickable((By.ID, 'inventory_sidebar_link'))
        ).click()

    def logout(self):
        """Cierra sesión desde el menú."""
        WebDriverWait(self.browser, BrowserConfig.TIMEOUTLOW).until(
            EC.element_to_be_clickable((By.ID, 'logout_sidebar_link'))
        ).click()
        time.sleep(BrowserConfig.TIMEOUTLOW)
        self.logged_in = False 

    def reset_app_state(self):
        """Reinicia el estado de la aplicación."""
        WebDriverWait(self.browser, BrowserConfig.TIMEOUTLOW).until(
            EC.element_to_be_clickable((By.ID, 'reset_sidebar_link'))
        ).click()

    def cart(self):
        """Abre el carro de compras desde la barra superior."""
        self.verify_login()
        WebDriverWait(self.browser, BrowserConfig.TIMEOUTLOW).until(
            EC.presence_of_element_located((By.XPATH, '//*[@id="shopping_cart_container"]/a'))
        ).click()
        #time.sleep(BrowserConfig.TIMEOUTLOW)
        return self

    def add_to_cart(self, product_name):
        """Añade un producto al carro usando su ID."""
        product = Cards.products.get(product_name)
        self.verify_login()
        WebDriverWait(self.browser, BrowserConfig.TIMEOUTLOW).until(
            EC.element_to_be_clickable((By.ID, product['id_add_cart']))
        ).click()
        return self
    
    def description(self,product_name):
        """Abre el carro de compras desde la barra superior."""
        product = Cards.products.get(product_name)
        self.verify_login()
        WebDriverWait(self.browser, BrowserConfig.TIMEOUTLOW).until(
            EC.element_to_be_clickable((By.XPATH, product['xpath_title']))
        ).click()
        #time.sleep(BrowserConfig.TIMEOUTLOW)
        return self


        
    