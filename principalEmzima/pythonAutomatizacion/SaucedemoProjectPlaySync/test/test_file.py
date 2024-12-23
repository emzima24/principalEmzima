from imports import *
from configconstan import BrowserConfig,config
from features.pages.Login import Login
from features.pages.Catalogue import Catalogue
from features.pages.Cart import Cart
from features.pages.Checkout_Information import Checkout_Information
from features.pages.Description import Description
from features.pages.Checkout_Overview import Checkout_Overview
from features.pages.Checkout_Complete import Checkout_Complete

URL = BrowserConfig.BASE_URL
USER = config.get('USERNAME')
PASSWORD = config.get('PASSWORD')

# prueba de que funciona login
def test_login(page):  
    login = Login(page)
    login.login(URL,USER,PASSWORD)
    time.sleep(3)

    

# prueba de que funciona logout / Menu Hamburguesa
def test_logout(page):
    catalogue = Catalogue(page)
    catalogue.login(URL,USER,PASSWORD)
    catalogue.hamburger_menu()
    catalogue.logout()

# prueba de que funciona Cart / Add to cart / Reset App
def test_cart(page):
    catalogue = Catalogue(page)
    catalogue.login(URL,USER,PASSWORD)
    catalogue.add_to_cart('Sauce Labs Oneise')
    # time.sleep(3)
    catalogue.hamburger_menu()
    catalogue.reset_app_state()
    catalogue.cart()
    # time.sleep(3)

# prueba de que funciona Cart / Description  
def test_cart_description(page):
    catalogue = Catalogue(page)
    catalogue.login(URL,USER,PASSWORD)
    catalogue.description('Test.allTheThings() T-Shirt (Red)')
    # time.sleep(3)
    catalogue.cart()
    # time.sleep(3)


# prueba de que funciona checkout / continue shopping
def test_checkout(page):
    cart = Cart(page)
    cart.login(URL,USER,PASSWORD)
    cart.add_to_cart('Test.allTheThings() T-Shirt (Red)')
    cart.cart()
    cart.continue_shopping()
    # time.sleep(2)
    cart.cart()
    cart.checkout()
    # time.sleep(3)


# prueba de que funciona continue
def test_continue(page):
    checkout_information = Checkout_Information(page)
    checkout_information.login(URL,USER,PASSWORD)
    checkout_information.add_to_cart('Sauce Labs Oneise')
    checkout_information.cart()
    checkout_information.checkout()
    checkout_information.first_name('Carlos')
    checkout_information.last_name('Alonso')
    checkout_information.postal_code('C1429SAV')
    # checkout_information.continue_button()
    # time.sleep(2)
    checkout_information.cancel()
    checkout_information.checkout()
    checkout_information.continue_paying('Carlos','Ramirez','C1429SAV')
    # time.sleep(2)


# prueba de que funciona description
def test_description(page):
    description = Description(page)
    description.login(URL,USER,PASSWORD)
    description.description('Sauce Labs Fleece Jacket')
    description.add_to_cart_description()
    description.back_to_products()
    # time.sleep(2)
    description.cart()
    description.hamburger_menu()
    description.logout()

# prueba de que funciona cancel/ finish
def test_finish(page):
    checkout_overview = Checkout_Overview(page)
    checkout_overview.login(URL,USER,PASSWORD)
    checkout_overview.add_to_cart('Sauce Labs Oneise')
    checkout_overview.cart()
    checkout_overview.checkout()
    checkout_overview.continue_paying('Carlos','Ramirez','C1429SAV')
    # time.sleep(2)
    checkout_overview.cancel()
    checkout_overview.cart()
    checkout_overview.checkout()
    # time.sleep(2)
    checkout_overview.continue_paying('Antonio','Ramirez','C1429SAV')
    checkout_overview.finish()
    # time.sleep(2)

# prueba de que funciona complete
def test_complete(page):
    checkout_complete = Checkout_Complete(page)
    checkout_complete.login(URL,USER,PASSWORD)
    checkout_complete.add_to_cart('Sauce Labs Oneise')
    checkout_complete.cart()
    checkout_complete.checkout()
    checkout_complete.first_name('Carlos')
    checkout_complete.last_name('Alonso')
    checkout_complete.postal_code('C1429SAV')
    # time.sleep(2)
    checkout_complete.continue_button()
    checkout_complete.finish()
    checkout_complete.back_home()
    # time.sleep(2)
    checkout_complete.hamburger_menu()
    checkout_complete.logout()
    # time.sleep(2)
