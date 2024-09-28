# video en youtube para pensar en como construir este codigo  https://youtu.be/rkQETLak6vU

import datetime
import os
from typing import Literal
from selenium import webdriver
from selenium.webdriver.common.by import By
from selenium.webdriver.common.keys import Keys
from selenium.webdriver.support.ui import WebDriverWait
from selenium.webdriver.support.expected_conditions import presence_of_element_located
from selenium.common import NoSuchElementException
import time
import pytest
import allure
#-----------
# paso preconfigurar con elementos recursivos
url_goo = 'https://www.google.com'
url_tsc = 'https://books.toscrape.com/'
url_pyt = 'https://www.python.org'
url_moz = 'https://www.mozilla.org/es-AR/'
url_sel = 'https://www.selenium.dev/selenium/web/dynamic.html'
url_ptl = 'https://practicetestautomation.com/practice-test-login/'
url_din = 'https://54a1-2800-810-470-86ea-3b92-7c51-5d4f-d5e9.ngrok-free.app'  
fill_text = 'Hola mundo '
exep_ts = 'All products | Books to Scrape - Sandbox'
exep_py = 'Welcome to Python.org'
exep_mo = 'Internet para las personas, no para las ganancias'

@pytest.fixture()  
def chrome_browser():  
    driver = webdriver.Chrome()  
    yield driver  
    driver.quit()

@pytest.fixture()  
def firefox_browser():  
    driver = webdriver.Firefox()  
    yield driver  
    driver.quit()

@pytest.fixture()  
def edge_browser():  
    driver = webdriver.Edge()  
    yield driver  
    driver.quit()

def allure_attach(image_bytes, name):  
    allure.attach(
            image_bytes,
            name=name,
            attachment_type=allure.attachment_type.PNG)
  

@pytest.mark.smoke
@pytest.mark.chrome
@allure.title('Abrir chrome llenar la barra de busqueda confirmar titulo by Name')
def test_websacrapping_simple_Cromium(chrome_browser):
    chrome_browser.get(url_goo)
    chrome_browser.find_element(By.NAME, 'q').send_keys(fill_text + 'chrome') # 
    #time.sleep(2)
    allure_attach(chrome_browser.get_screenshot_as_png(),'test1.png')
    assert chrome_browser.title ==  'Google'
    

@pytest.mark.smoke
@pytest.mark.edge
@allure.title('Abrir edge llenar la barra de busqueda confirmar titulo by Id')
def test_selenium_Edge(edge_browser):
    edge_browser.get(url_goo)
    edge_browser.find_element(By.ID, 'APjFqb').send_keys(fill_text + 'edge')
    #time.sleep(3)
    allure_attach(edge_browser.get_screenshot_as_png(),'test2.png')
    assert edge_browser.title !=  'Gogle'

@pytest.mark.smoke
@pytest.mark.firefox
@allure.title('abrir firefox llenar la barra de busqueda confirmar titulo by class')
def test_selenium_Firefox(firefox_browser):
    firefox_browser.get(url_goo)
    added = firefox_browser.find_element(By.CLASS_NAME, 'gLFyf')
    added.send_keys(fill_text + 'firefox')
    #time.sleep(3)
    allure_attach(firefox_browser.get_screenshot_as_png(),'test3.png')
    assert added.get_property('value') == (fill_text + 'firefox')

@pytest.mark.smoke
@pytest.mark.chrome
@allure.title('abrir chrome llenar la barra de busqueda confirmar titulo by Name')
def test_topscrape_Chrome(chrome_browser):
    chrome_browser.get(url_tsc)
    allure_attach(chrome_browser.get_screenshot_as_png(),'test4.png')
    assert chrome_browser.title in  exep_ts
    
@pytest.mark.confixture
@pytest.mark.chrome
@allure.title('abrir una pagina y confirmar por titulo by Name')
def test_title(chrome_browser):  
    chrome_browser.get(url_pyt) #url_moz  
    #time.sleep(3)
    #chrome_browser.get_screenshot_as_file('./reporte/prueba1.png')
    allure_attach(chrome_browser.get_screenshot_as_png(),'test5.png')
    assert chrome_browser.title == exep_py # exep_mo 
    
@pytest.mark.skip('No incluido para pruebas')
@pytest.mark.addparame
@allure.title('prueba de parametrizacion con aritmetica simple')
@pytest.mark.parametrize('input1, input2, output',[(5,5,11),(3,5,12)])
def test_add(input1: Literal[5] | Literal[3], input2: Literal[5], output: Literal[11] | Literal[12]):
	assert input1+input2 != output,'failed'

@pytest.mark.domattribute
@pytest.mark.edge
@allure.title('ensayo de selenium para hacer click y verificar el cuadro rojo')
def test_sleep(edge_browser):
    edge_browser.get(url_sel)
    edge_browser.find_element(By.ID, 'adder').click()
    #time.sleep(10)
    edge_browser.implicitly_wait(2) # obligatorio sino falla porque la espera por default es muy corta
    added = edge_browser.find_element(By.ID, 'box0')
    allure_attach(edge_browser.get_screenshot_as_png(),'test6.png')
    assert added.get_dom_attribute('class') == 'redbox'
    
@pytest.mark.waitexplicit
@pytest.mark.firefox
@allure.title('ensayo de selenium para hacer click y insertar texto en cuadro emergente y verficar el texto ingresado y con espera explicita')
def test_explicit(firefox_browser):
    firefox_browser.get(url_sel)
    revealed = firefox_browser.find_element(By.ID, 'revealed')
    firefox_browser.find_element(By.ID, 'reveal').click()
    wait = WebDriverWait(firefox_browser, timeout=10)
    wait.until(lambda d : revealed.is_displayed())
    revealed.send_keys(fill_text)
    #time.sleep(2)
    allure_attach(firefox_browser.get_screenshot_as_png(),'test7.png')
    assert revealed.get_property('value') == fill_text

@pytest.mark.login
@pytest.mark.firefox
@allure.title('login test automation no ingresa e ingresa')
def test_login_functionality(firefox_browser):  
    firefox_browser.get(url_ptl)  
    firefox_browser.execute_script('window.scrollTo(0, 400)')  
    #time.sleep(2)
    firefox_browser.find_element(By.ID, 'username').send_keys('student')  
    firefox_browser.find_element(By.ID, 'submit').click()
    #time.sleep(2)
    error_msg = firefox_browser.find_element(By.ID, 'error')   
    #allure.dynamic.title('Password invalid')
    allure_attach(firefox_browser.get_screenshot_as_png(),'no ingresa.png')
    assert error_msg.is_displayed(), 'Your password is invalid!'
    #time.sleep(2)
    firefox_browser.find_element(By.ID, 'username').send_keys('student')  
    firefox_browser.find_element(By.ID, 'password').send_keys('Password123')  
    firefox_browser.find_element(By.ID, 'submit').click()  
    #time.sleep(2)
    try:  
        logout_button = firefox_browser.find_element(  
            By.CLASS_NAME, 'wp-block-button__link'   # By.LINK_TEXT, 'Log out'
        ) 
        #allure.dynamic.title('Password valid')
        allure_attach(firefox_browser.get_screenshot_as_png(),'ingresa.png')
        assert logout_button.is_displayed(), 'Logout button is not displayed.'  
    except NoSuchElementException:  
        assert False, 'Logout button does not exist.'  

@pytest.mark.e2e
@pytest.mark.firefox
@allure.title('login test automation version XPATH')
# este no se puede ejecutar porque el link es variable diariamente
# si me conoces pedime el link por discord y vamos
def test_login_functional(firefox_browser):
    firefox_browser.get(url_din) 
    #time.sleep(2)
    firefox_browser.implicitly_wait(2) # obligatorio sino falla porque la espera por default es muy corta

    firefox_browser.find_element(  
            By.XPATH, '//*[@id="root"]/div/main/div/div/section[1]/div/footer/button'  
        ).click()
    #time.sleep(2)
    firefox_browser.find_element(  
            By.XPATH, '//*[@id="navbarText"]/ul/li[4]/a'  
        ).click()
    firefox_browser.find_element(By.ID, 'email').send_keys('ezsaatas.bnfasc@gmail.com')  
    firefox_browser.find_element(By.ID, 'password').send_keys('camilo123')  
  
    firefox_browser.find_element(By.ID, 'access').click()  
    time.sleep(2) # obligatorio sino falla porque la espera por default es muy corta
    #firefox_browser.implicitly_wait(4) no funciona se puede probar con una espera explicita
    firefox_browser.find_element(  
            By.XPATH, '//*[@id="navbarText"]/ul/li[2]/a'  
        ).click()
    #time.sleep(2)
    firefox_browser.execute_script('window.scrollTo(0, 400)')  
    typeActiv = firefox_browser.find_element(  
            By.NAME, 'phone'  
        )
    allure_attach(firefox_browser.get_screenshot_as_png(),'test10.png')
    #allure.dynamic.title('phone value')
    assert  typeActiv.get_property('value') == '91145789233' 
    #time.sleep(2)
    typeActiv = firefox_browser.find_element(  
            By.NAME, 'country'   
        )
    #allure.dynamic.title('country value')
    assert  typeActiv.get_property('value') == 'Argentina' 
    typeActiv = firefox_browser.find_element(  
            By.NAME, 'cuitCus' 
        )
    #allure.dynamic.title('cuit value')
    assert  typeActiv.get_property('value') == '25959844007'
    firefox_browser.find_element(  
            By.XPATH, '//*[@id="navbarText"]/ul/li[4]/a'  
        ).click()
    #time.sleep(2)
    firefox_browser.implicitly_wait(2)

@pytest.mark.xpath
@pytest.mark.edge
@allure.title('test con XPATH')
def test_topscrape_link(edge_browser):  
    edge_browser.get(url_tsc)
    #time.sleep(5)
    edge_browser.find_element(  
            By.XPATH, '//*[@id="default"]/div/div/div/aside/div[2]/ul/li/ul/li[13]/a'  
        ).click()
    #time.sleep(2)
    edge_browser.execute_script('window.scrollTo(0, 900)')
    #time.sleep(2)
    edge_browser.find_element(  
            By.XPATH, '//*[@id="default"]/div/div/div/div/section/div[2]/ol/li[7]/article/h3/a'  
        ).click()
    #time.sleep(2)
    edge_browser.execute_script('window.scrollTo(0, 900)')  
    price = edge_browser.find_element(  
            By.XPATH, '//*[@id="content_inner"]/article/table/tbody/tr[3]/td'  
        ).text
    allure_attach(edge_browser.get_screenshot_as_png(),'test11.png')
    #time.sleep(2)
    assert  price in '£52.60'
