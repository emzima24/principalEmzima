from imports import *
from Features.pages.Login import Login
from Features.pages.Catalogue import Catalogue
from Features.pages.Cart import Cart

# prueba de que funciona login
def test_login(chrome_browser): 
    login = Login(chrome_browser)
    login.login()

# prueba de que funciona logout / Menu Hamburguesa
def test_logout(chrome_browser):
    catalogue = Catalogue(chrome_browser)
    catalogue.login()
    catalogue.hamburger_menu()
    catalogue.logout()

# prueba de que funciona Cart
def test_cart(chrome_browser):
    catalogue = Catalogue(chrome_browser)
    catalogue.login()
    catalogue.cart()

# prueba de que funciona Add to cart
def test_add_cart(chrome_browser):
    catalogue = Catalogue(chrome_browser)
    catalogue.login()
    catalogue.add_to_cart('Sauce Labs Oneise')
    catalogue.cart()

# prueba de que funciona checkout
def test_checkout(chrome_browser):
    cart = Cart(chrome_browser)
    cart.login()
    cart.add_to_cart('Sauce Labs Oneise')
    cart.cart()
    cart.checkout()

# # prueba de que funciona checkout
# def test_checkout(chrome_browser):
#     catalogue = Catalogue(chrome_browser)
#     catalogue.login()
#     catalogue.add_to_cart('Sauce Labs Oneise')
#     catalogue.cart()
#     cart = Cart(catalogue)
#     cart.checkout()

