from features.pages.Catalogue import Catalogue
from features.pages.Cart import Cart


class Description(Cart, Catalogue):
    def __init__(self, page):
        """Inicializa el navegador en la instancia Description herendando de Catalogue que hereda de Login.
        Lo solicita para comenzar e incorporarlo en el resto de las funciones"""
        super().__init__(page)

    def verify_login(self):
        """Verifica si el usuario está autenticado antes de ejecutar otras funciones."""
        if not self.logged_in:
            raise RuntimeError("Debes iniciar sesión primero usando la función login() Heredada de Catalogue que la heredo de Login.")

    async def add_to_cart_description(self):
        """Añade un producto al carro desde la página Description"""
        self.verify_login()
        await self.page.locator('button[data-test="add-to-cart"][id="add-to-cart"]').click()
        return self

    async def back_to_products(self):
        """Se devuelve a la página Catalogue"""
        self.verify_login()
        await self.page.get_by_role('button',name='Back to products').click()
        return self