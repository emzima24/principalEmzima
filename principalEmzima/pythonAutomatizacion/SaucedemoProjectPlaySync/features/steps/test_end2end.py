from imports import given, when, then, scenario, pytest, parsers,allure,expect
from features.pages.Checkout_Complete import Checkout_Complete
from configconstan import BrowserConfig, config

URL = BrowserConfig.BASE_URL
USER = config.get('USERNAME')
PASSWORD = config.get('PASSWORD')

checkout_complete = None

@allure.title('EndToEnd Test')
@scenario('../end2end.feature', 'I log in, add a product to the cart, complete the purchase, and log out')
def test_bdd():
    pass

@given(u'I go to the website as a registered user')
def i_go_to_the_website_as_a_registered_user(page):
    global checkout_complete
    checkout_complete = Checkout_Complete(page)
    checkout_complete.open_url(URL)

@allure.step("ingresar usuario y contraseña")
@when(u'I enter the username and password')
def i_enter_the_username_and_password(allure_attach):
    checkout_complete.username(USER)
    checkout_complete.password(PASSWORD)
    allure_attach(checkout_complete.screenshot_bytes(), 'Ingresado usuario y contraseña')


@when(u'I click on Login button')
def i_click_on_login_button():
    checkout_complete.login_button()

@allure.step("Añadir un producto al carro de compras")
@when(parsers.parse('I click on the Add to cart button for the {product}'))
def i_click_on_the_add_to_cart_button_for_the_product(product,allure_attach):
    checkout_complete.add_to_cart(product)
    allure_attach(checkout_complete.screenshot_bytes(), 'Pantalla de Catalogo')

@allure.step("Completar la compra")
@when(u'I click on the cart icon')
def i_click_on_the_cart_icon(allure_attach):
    checkout_complete.cart()
    allure_attach(checkout_complete.screenshot_bytes(), 'Pantalla de Carro')


@when(u'I click on the Checkout button')
def i_click_on_the_checkout_button():
    checkout_complete.checkout()


@when(parsers.parse('I fill First Name field with {first_name}'))
def i_fill_first_name_field_with_first_name(first_name):
    checkout_complete.first_name(first_name)


@when(parsers.parse('I fill Last Name field with {last_name}'))
def i_fill_last_name_field_with_last_name(last_name):
    checkout_complete.last_name(last_name)

@when(parsers.parse('I fill Zip Code field with {zip_code}'))
def i_fill_zip_code_field_with_zip_code(zip_code):
    checkout_complete.postal_code(zip_code)
    # time.sleep(2)


@allure.step("Ingresados los datos de envio")
@when(u'I click on the Continue button')
def i_click_on_the_continue_button(allure_attach):
    allure_attach(checkout_complete.screenshot_bytes(), 'Pantalla de formulario de envio relleno')
    checkout_complete.continue_button()


@allure.step("Confirmar la compra")
@when(u'I click on the Finish button')
def i_click_on_the_finish_button(allure_attach):
    allure_attach(checkout_complete.screenshot_bytes(), 'Pantalla de confirmacion de compra')
    checkout_complete.finish()


@allure.step("Mensaje compra completada")
@when(u'I click on the Back Home button')
def i_click_on_the_back_home_button(allure_attach):
    allure_attach(checkout_complete.screenshot_bytes(), 'Pantalla de compra completada')
    checkout_complete.back_home()
    # time.sleep(2)

@allure.step("Volver a la pagina principal luego de completar la compra y abrir el menu hamburguesa")
@when(u'I display the hamburger menu')
def i_display_the_hamburger_menu(allure_attach):
    checkout_complete.hamburger_menu()
    allure_attach(checkout_complete.screenshot_bytes(), 'Pantalla en el catalogo del menu hamburguesa')


@when(u'I log out')
def i_log_out():
    checkout_complete.logout()


@then(u'I want to go to the login page')
def i_want_to_go_to_the_login_page(allure_attach):
    login_button = checkout_complete.login_button_location()
    allure_attach(checkout_complete.screenshot_bytes(), 'Pantalla de login')
    expect(login_button).to_be_enabled()
