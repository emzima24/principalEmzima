from features.pages.Cart import Cart

class Checkout_Information(Cart):
    def __init__(self, page):
        """Inicializa el navegador en la instancia Checkout_Information herendando de Cart que hereda de Catalogue que hereda de Login.
        Lo solicita para comenzar e incorporarlo en el resto de las funciones"""
        super().__init__(page)

    def verify_login(self):
        """Verifica si el usuario está autenticado antes de ejecutar otras funciones."""
        if not self.logged_in:
            raise RuntimeError("Debes iniciar sesión primero usando la función login() Heredada de Cart que la heredo de Catalogue que la heredo de Login.")
    
    async def first_name(self,name_first):
        """Completa el campo de nombre del usuario."""
        self.verify_login()
        await self.page.locator('input[data-test="firstName"][name="firstName"]').fill(name_first)



    async def last_name(self,name_last):
        """Completa el campo de apellido del usuario."""
        self.verify_login()
        await self.page.locator('input[data-test="lastName"][name="lastName"]').fill(name_last)


    async def postal_code(self,code_postal):
        """Completa el campo de código postal del usuario."""
        self.verify_login()
        await self.page.locator('input[data-test="postalCode"][name="postalCode"]').fill(code_postal)
        

    async def continue_button(self):
        """Abre la página de checkout overview confirmando los valores de los inputs."""
        self.verify_login()
        await self.page.get_by_role('button',name='Continue').click()

    async def cancel(self):
        """Se devuelve a la página de catalogo."""
        self.verify_login()
        await self.page.get_by_role('button',name='Cancel').click()

    async def continue_paying(self,name_first,name_last,code_postal):
        """Abre la página de checkout overview."""
        await self.first_name(name_first)
        await self.last_name(name_last)
        await self.postal_code(code_postal)
        await self.continue_button()