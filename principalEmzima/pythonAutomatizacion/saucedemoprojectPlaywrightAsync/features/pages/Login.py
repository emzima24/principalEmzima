from imports import asyncio  
from configconstan import config,BrowserConfig  


class Login:
    def __init__(self, page):
        """Inicializa el navegador en la instancia Login.
        Lo solicita para comenzar e incorporarlo en el resto de las funciones"""
        self.page = page
        self.logged_in = False

    async def screenshot_bytes(self):
        """Toma una captura de pantalla del navegador."""
        return await self.page.screenshot()
    
    async def open_url(self,url):
        """Ingresa a la url."""
        await self.page.goto(url)

    async def username(self,user_name):
        """Completa el campo de nombre de usuario."""
        await self.page.locator("[data-test=\"username\"]").fill(user_name)

    async def password(self,password):
        """Completa el campo de contraseña."""
        await self.page.locator("[data-test=\"password\"]").fill(password)

    async def login_button_location(self):
        """Ubica el botón de login."""
        return await self.page.locator("[data-test=\"login-button\"]")

    async def login_button(self):
        """Hace clic en el botón de login."""
        try:
            await self.page.locator("[data-test=\"login-button\"]").click()
            self.logged_in = True
        except Exception as e:
            raise AssertionError(f"Login fallido: {e}")
        return self

    async def login(self,url,user,password):
        """Realiza el inicio de sesión completo."""
        await self.open_url(url)
        await self.username(user)
        await self.password(password)
        await self.login_button()
        self.logged_in = True
        # time.sleep(BrowserConfig.TIMEOUTLOW)
        return self