from imports import *  
from configconstan import config,BrowserConfig  


class Login:
    def __init__(self, chrome_browser):
        """Inicializa el navegador en la instancia Login.
        Lo solicita para comenzar e incorporarlo en el resto de las funciones"""
        self.browser = chrome_browser
        self.logged_in = False

    def username(self,user_name):
        """Completa el campo de nombre de usuario."""
        self.browser.find_element(By.ID, 'user-name').send_keys(user_name)

    def password(self,password):
        """Completa el campo de contraseña."""
        self.browser.find_element(By.ID, 'password').send_keys(password)

    def login_button(self):
        """Hace clic en el botón de login."""
        self.browser.find_element(By.ID, 'login-button').click()

    def login(self,url,user,password):
        """Realiza el inicio de sesión completo."""
        self.browser.get(url)
        try:
            WebDriverWait(self.browser, BrowserConfig.TIMEOUTLOW).until(
                EC.presence_of_element_located((By.ID, 'password'))
            )
            self.username(user)
            self.password(password)
            self.login_button()

            WebDriverWait(self.browser, BrowserConfig.TIMEOUTLOW).until(
                lambda driver: driver.current_url != BrowserConfig.BASE_URL
            )
            self.logged_in = True
            #time.sleep(BrowserConfig.TIMEOUTLOW)
        except Exception as e:
            raise AssertionError(f"Login fallido: {e}")

        return self
    

    