from configconstan import Cards
from features.pages.Login import Login

class Catalogue(Login):
    def __init__(self, page):
        """Inicializa el navegador en la instancia Catalogue herendando de Login.
        Lo solicita para comenzar e incorporarlo en el resto de las funciones"""
        super().__init__(page)

    def verify_login(self):
        """Verifica si el usuario está autenticado antes de ejecutar otras funciones."""
        if not self.logged_in:
            raise RuntimeError("Debes iniciar sesión primero usando la función login() heredada de Login.")

    async def hamburger_menu(self):
        """Abre el menú hamburguesa desde la página principal."""
        self.verify_login()
        await self.page.get_by_role("button",name="Open Menu").click()
        return self

    async def all_items(self):
        """Selecciona la opción 'All Items' en el menú."""
        await self.page.get_by_role("link",name="All Items").click()

    async def logout(self):
        """Cierra sesión desde el menú."""
        await self.page.get_by_role("link",name="Logout").click()
        self.logged_in = False 

    async def reset_app_state(self):
        """Reinicia el estado de la aplicación."""
        await self.page.get_by_role("link",name="Reset App State").click()


    async def cart(self):
        """Abre el carro de compras desde la barra superior."""
        self.verify_login()
        await self.page.click('a.shopping_cart_link[data-test="shopping-cart-link"]')
        return self

    async def add_to_cart(self, product_name):
        """Añade un producto al carro usando su ID."""
        self.verify_login()
        product = Cards.products.get(product_name)
        await self.page.click(product['button'])
        return self
    
    async def description(self,product_name):
        """Abre el carro de compras desde la barra superior."""
        self.verify_login()
        product = Cards.products.get(product_name)
        await self.page.click(product['link'])
        return self