from configconstan import config,BrowserConfig  


class Login:
    def __init__(self, page):
        """Inicializa el navegador en la instancia Login.
        Lo solicita para comenzar e incorporarlo en el resto de las funciones"""
        self.page = page
        self.logged_in = False
    
    def screenshot_bytes(self):
        """Toma una captura de pantalla del navegador."""
        return self.page.screenshot()
    
    def open_url(self,url):
        """Ingresa a la url."""
        self.page.goto(url)

    def username(self,user_name):
        """Completa el campo de nombre de usuario."""
        self.page.locator("[data-test=\"username\"]").fill(user_name)

    def password(self,password):
        """Completa el campo de contraseña."""
        self.page.locator("[data-test=\"password\"]").fill(password)

    def login_button_location(self):
        """Ubica el botón de login."""
        return self.page.locator("[data-test=\"login-button\"]")

    def login_button(self):
        """Hace clic en el botón de login."""
        try:
            self.page.locator("[data-test=\"login-button\"]").click()
            self.logged_in = True
        except Exception as e:
            raise AssertionError(f"Login fallido: {e}")
        return self

    def login(self,url,user,password):
        """Realiza el inicio de sesión completo."""
        self.open_url(url)
        self.username(user)
        self.password(password)
        self.login_button()
        self.logged_in = True
        # time.sleep(BrowserConfig.TIMEOUTLOW)
        return self