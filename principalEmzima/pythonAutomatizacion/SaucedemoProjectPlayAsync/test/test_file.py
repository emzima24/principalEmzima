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
@pytest.mark.asyncio
async def test_login(page):  
    login = Login(page)
    await login.login(URL,USER,PASSWORD)
    

# prueba de que funciona logout / Menu Hamburguesa
@pytest.mark.asyncio
async def test_logout(page):
    catalogue = Catalogue(page)
    await catalogue.login(URL,USER,PASSWORD)
    await catalogue.hamburger_menu()
    await catalogue.logout()

# prueba de que funciona Cart / Add to cart / Reset App
@pytest.mark.asyncio
async def test_cart(page):
    catalogue = Catalogue(page)
    await catalogue.login(URL,USER,PASSWORD)
    await catalogue.add_to_cart('Sauce Labs Oneise')
    # time.sleep(3)
    await catalogue.hamburger_menu()
    await catalogue.reset_app_state()
    await catalogue.cart()
    # time.sleep(3)

# prueba de que funciona Cart / Description  
@pytest.mark.asyncio
async def test_cart_description(page):
    catalogue = Catalogue(page)
    await catalogue.login(URL,USER,PASSWORD)
    await catalogue.description('Test.allTheThings() T-Shirt (Red)')
    # time.sleep(3)
    await catalogue.cart()
    # time.sleep(3)


# prueba de que funciona checkout / continue shopping
@pytest.mark.asyncio
async def test_checkout(page):
    cart = Cart(page)
    await cart.login(URL,USER,PASSWORD)
    await cart.add_to_cart('Test.allTheThings() T-Shirt (Red)')
    await cart.cart()
    await cart.continue_shopping()
    # time.sleep(2)
    await cart.cart()
    await cart.checkout()
    # time.sleep(3)


# prueba de que funciona continue
@pytest.mark.asyncio
async def test_continue(page):
    checkout_information = Checkout_Information(page)
    await checkout_information.login(URL,USER,PASSWORD)
    await checkout_information.add_to_cart('Sauce Labs Oneise')
    await checkout_information.cart()
    await checkout_information.checkout()
    await checkout_information.first_name('Carlos')
    await checkout_information.last_name('Alonso')
    await checkout_information.postal_code('C1429SAV')
    # await checkout_information.continue_button()
    # time.sleep(2)
    await checkout_information.cancel()
    await checkout_information.checkout()
    await checkout_information.continue_paying('Carlos','Ramirez','C1429SAV')
    # time.sleep(2)


# prueba de que funciona description
@pytest.mark.asyncio
async def test_description(page):
    description = Description(page)
    await description.login(URL,USER,PASSWORD)
    await description.description('Sauce Labs Fleece Jacket')
    await description.add_to_cart_description()
    await description.back_to_products()
    # time.sleep(2)
    await description.cart()
    await description.hamburger_menu()
    await description.logout()

# prueba de que funciona cancel/ finish
@pytest.mark.asyncio
async def test_finish(page):
    checkout_overview = Checkout_Overview(page)
    await checkout_overview.login(URL,USER,PASSWORD)
    await checkout_overview.add_to_cart('Sauce Labs Oneise')
    await checkout_overview.cart()
    await checkout_overview.checkout()
    await checkout_overview.continue_paying('Carlos','Ramirez','C1429SAV')
    # time.sleep(2)
    await checkout_overview.cancel()
    await checkout_overview.cart()
    await checkout_overview.checkout()
    # time.sleep(2)
    await checkout_overview.continue_paying('Antonio','Ramirez','C1429SAV')
    await checkout_overview.finish()
    # time.sleep(2)

# prueba de que funciona complete
@pytest.mark.asyncio
async def test_complete(page):
    checkout_complete = Checkout_Complete(page)
    await checkout_complete.login(URL,USER,PASSWORD)
    await checkout_complete.add_to_cart('Sauce Labs Oneise')
    await checkout_complete.cart()
    await checkout_complete.checkout()
    await checkout_complete.first_name('Carlos')
    await checkout_complete.last_name('Alonso')
    await checkout_complete.postal_code('C1429SAV')
    # time.sleep(2)
    await checkout_complete.continue_button()
    await checkout_complete.finish()
    await checkout_complete.back_home()
    # time.sleep(2)
    await checkout_complete.hamburger_menu()
    await checkout_complete.logout()
    # time.sleep(2)
