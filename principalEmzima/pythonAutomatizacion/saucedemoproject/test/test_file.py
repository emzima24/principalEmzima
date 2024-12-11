from imports import *
from configconstan import BrowserConfig,config
from Features.pages.Login import Login
from Features.pages.Catalogue import Catalogue
from Features.pages.Cart import Cart
from Features.pages.Checkout_Information import Checkout_Information
from Features.pages.Checkout_Overview import Checkout_Overview
from Features.pages.Checkout_Complete import Checkout_Complete
from Features.pages.Description import Description


URL = BrowserConfig.BASE_URL
USER = config.get('USERNAME')
PASSWORD = config.get('PASSWORD')

# prueba de que funciona login
def test_login(chrome_browser): 
    login = Login(chrome_browser)
    login.login(URL,USER,PASSWORD)

# prueba de que funciona logout / Menu Hamburguesa
def test_logout(chrome_browser):
    catalogue = Catalogue(chrome_browser)
    catalogue.login(URL,USER,PASSWORD)
    catalogue.hamburger_menu()
    catalogue.logout()

# prueba de que funciona Cart
def test_cart(chrome_browser):
    catalogue = Catalogue(chrome_browser)
    catalogue.login(URL,USER,PASSWORD)
    catalogue.cart()

# prueba de que funciona Add to cart
def test_add_cart(chrome_browser):
    catalogue = Catalogue(chrome_browser)
    catalogue.login(URL,USER,PASSWORD)
    catalogue.add_to_cart('Sauce Labs Oneise')
    catalogue.cart()

# prueba de que funciona checkout
def test_checkout(chrome_browser):
    cart = Cart(chrome_browser)
    cart.login(URL,USER,PASSWORD)
    cart.add_to_cart('Sauce Labs Oneise')
    cart.cart()
    cart.checkout()

# prueba de que funciona continue
def test_continue(chrome_browser):
    checkout_information = Checkout_Information(chrome_browser)
    checkout_information.login(URL,USER,PASSWORD)
    checkout_information.add_to_cart('Sauce Labs Oneise')
    checkout_information.cart()
    checkout_information.checkout()
    checkout_information.continue_paying('Carlos','Ramirez','C1429SAV')


def test_finish(chrome_browser):
    checkout_overview = Checkout_Overview(chrome_browser)
    checkout_overview.login(URL, USER,PASSWORD)
    checkout_overview.add_to_cart('Sauce Labs Oneise')
    checkout_overview.cart()
    checkout_overview.checkout()
    checkout_overview.continue_paying('Carlos','Ramirez','C1429SAV')
    checkout_overview.finish()



