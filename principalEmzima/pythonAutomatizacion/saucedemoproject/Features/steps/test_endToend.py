import time
# from conftest import allure_attach
from imports import  scenario, given,when,then, allure,parsers
from configconstan import BrowserConfig,config
from features.pages.Checkout_Complete import Checkout_Complete

checkout_complete = None   
@allure.title('EndToEnd Test')
@scenario('../endToEnd.feature', 'I log in, add a product to the cart, complete the purchase, and log out')
def test_bdd():
    pass

@given(u'I go to the website as a registered user')
def i_go_to_the_website_as_a_registered_user(chrome_browser): 
    global checkout_complete
    checkout_complete = Checkout_Complete(chrome_browser)
    checkout_complete.open_url(BrowserConfig.BASE_URL)

allure.step("ingresar usuario y contraseña")
@when(u'I enter the username and password')
def i_enter_the_username_and_password(allure_attach):
    checkout_complete.username(config.get('USERNAME'))
    checkout_complete.password(config.get('PASSWORD'))
    allure_attach(checkout_complete.get_screenshot_as_png(), 'Ingresado usuario y contraseña')

@when(u'I click on Login button')
def i_click_on_login_button():
    checkout_complete.login_button()
    #time.sleep(3)

allure.step("Añadir un producto al carro de compras")
@when(parsers.parse('I click on the Add to cart button for the {product}'))
def i_click_on_the_add_to_cart_button_for_the_product(product,allure_attach):
    checkout_complete.add_to_cart(product)
    allure_attach(checkout_complete.get_screenshot_as_png(), 'Pantalla de Catalogo')

allure.step("Completar la compra")
@when(u'I click on the cart icon')
def i_click_on_the_cart_icon(allure_attach):
    checkout_complete.cart()
    allure_attach(checkout_complete.get_screenshot_as_png(), 'Pantalla de Carro')

@when(u'I click on the Checkout button')
def i_click_on_the_checkout_button():
    checkout_complete.checkout()

@when(parsers.parse('I filled the field for the {field_name} with {value}'))
def i_filled_the_field_for_the_field_name_with_value(field_name, value):
    if field_name == "first_name":
        checkout_complete.first_name(value)
    elif field_name == "last_name":
        checkout_complete.last_name(value)
    elif field_name == "zip_code":
        checkout_complete.postal_code(value)
    else:
        raise ValueError(f"Unknown field: {field_name}")
    #time.sleep(1)

allure.step("Ingresados los datos de envio")
@when(u'I click on the Continue button')
def i_click_on_the_continue_button(allure_attach):
    allure_attach(checkout_complete.get_screenshot_as_png(), 'Pantalla de formulario de envio relleno')
    checkout_complete.continue_button()

allure.step("Confirmar la compra")
@when(u'I click on the Finish button')
def i_click_on_the_finish_button(allure_attach):
    allure_attach(checkout_complete.get_screenshot_as_png(), 'Pantalla de confirmacion de compra')
    checkout_complete.finish()

allure.step("Mensaje compra completada")
@when(u'I click on the Back Home button')
def i_click_on_the_back_home_button(allure_attach):
    allure_attach(checkout_complete.get_screenshot_as_png(), 'Pantalla de compra completada')
    checkout_complete.back_home()

allure.step("Volver a la pagina principal luego de completar la compra y abrir el menu hamburguesa")
@when(u'I display the hamburger menu')
def i_display_the_hamburger_menu(allure_attach):
    checkout_complete.hamburger_menu()
    allure_attach(checkout_complete.get_screenshot_as_png(), 'Pantalla en el catalogo del menu hamburguesa')

@when(u'I log out')
def i_log_out():
    checkout_complete.logout()    
    
@then(u'I want to go to the login page')
def i_want_to_go_to_the_login_page(allure_attach):
    login_button = checkout_complete.login_button_location()
    allure_attach(checkout_complete.get_screenshot_as_png(), 'Pantalla de login')
    assert login_button.is_enabled()
    


