from imports import Page  
from features.pages.Cart import Cart

class Checkout_Information(Cart):
    def __init__(self, page:Page):
        """Inicializa el navegador en la instancia Checkout_Information herendando de Cart que hereda de Catalogue que hereda de Login.
        Lo solicita para comenzar e incorporarlo en el resto de las funciones"""
        super().__init__(page)

    def verify_login(self):
        """Verifica si el usuario está autenticado antes de ejecutar otras funciones."""
        if not self.logged_in:
            raise RuntimeError("Debes iniciar sesión primero usando la función login() Heredada de Cart que la heredo de Catalogue que la heredo de Login.")
    
    def first_name(self,name_first):
        """Completa el campo de nombre del usuario."""
        self.verify_login()
        self.page.locator('input[data-test="firstName"][name="firstName"]').fill(name_first)



    def last_name(self,name_last):
        """Completa el campo de apellido del usuario."""
        self.verify_login()
        self.page.locator('input[data-test="lastName"][name="lastName"]').fill(name_last)


    def postal_code(self,code_postal):
        """Completa el campo de código postal del usuario."""
        self.verify_login()
        self.page.locator('input[data-test="postalCode"][name="postalCode"]').fill(code_postal)
        

    def continue_button(self):
        """Abre la página de checkout overview confirmando los valores de los inputs."""
        self.verify_login()
        self.page.get_by_role('button',name='Continue').click()

    def cancel(self):
        """Se devuelve a la página de catalogo."""
        self.verify_login()
        self.page.get_by_role('button',name='Cancel').click()

    def continue_paying(self,name_first,name_last,code_postal):
        """Abre la página de checkout overview."""
        self.first_name(name_first)
        self.last_name(name_last)
        self.postal_code(code_postal)
        self.continue_button()