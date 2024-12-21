from imports import *
from configconstan import BrowserConfig,config
from features.pages.Login import Login
from features.pages.Catalogue import Catalogue
from features.pages.Cart import Cart
from features.pages.Checkout_Information import Checkout_Information
from features.pages.Checkout_Overview import Checkout_Overview
from features.pages.Checkout_Complete import Checkout_Complete
from features.pages.Description import Description

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

# prueba de que funciona description
def test_description(chrome_browser):
    description = Description(chrome_browser)
    description.login(URL,USER,PASSWORD)
    description.description('Sauce Labs Oneise')
    description.add_to_cart_description()
    description.cart()
    description.hamburger_menu()
    description.logout()

# prueba de que funciona finish
def test_finish(chrome_browser):
    checkout_overview = Checkout_Overview(chrome_browser)
    checkout_overview.login(URL,USER,PASSWORD)
    checkout_overview.add_to_cart('Sauce Labs Oneise')
    checkout_overview.cart()
    checkout_overview.checkout()
    checkout_overview.continue_paying('Carlos','Ramirez','C1429SAV')
    checkout_overview.finish()

# prueba de que funciona back home
def test_back_home(chrome_browser):
    checkout_complete = Checkout_Complete(chrome_browser)
    checkout_complete.login(URL,USER,PASSWORD)
    checkout_complete.add_to_cart('Sauce Labs Oneise')
    checkout_complete.cart()
    checkout_complete.checkout()
    checkout_complete.continue_paying('Carlos','Ramirez','C1429SAV')
    checkout_complete.finish()
    checkout_complete.back_home()
    checkout_complete.hamburger_menu()
    checkout_complete.logout()