from features.pages.Catalogue import Catalogue

class Cart(Catalogue):
    def __init__(self, page):
        """Inicializa el navegador en la instancia Cart herendando de Catalogue que hereda de Login.
        Lo solicita para comenzar e incorporarlo en el resto de las funciones"""
        super().__init__(page)

    def verify_login(self):
        """Verifica si el usuario está autenticado antes de ejecutar otras funciones."""
        if not self.logged_in:
            raise RuntimeError("Debes iniciar sesión primero usando la función login() Heredada de Catalogue que la heredo de Login.")
    
    async def checkout(self):
        """Abre la página de checkout Your information."""
        self.verify_login()
        await self.page.get_by_role('button',name='Checkout').click()
        return self
    
    async def continue_shopping(self):
        """Se devuelve a la página de catalogue."""
        self.verify_login()
        await self.page.get_by_role('button',name='Continue Shopping').click()
        return self