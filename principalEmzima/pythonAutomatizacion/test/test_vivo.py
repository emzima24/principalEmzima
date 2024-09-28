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
url_sel = 'https://www.selenium.dev/selenium/web/dynamic.html'
url_din = 'https://54a1-2800-810-470-86ea-3b92-7c51-5d4f-d5e9.ngrok-free.app'  
url_moz = 'https://www.mozilla.org/es-AR/'
url_pyt = 'https://www.python.org'
url_ptl = 'https://practicetestautomation.com/practice-test-login/'
fill_text = 'Hola mundo '
res_exctsc = 'All products | Books to Scrape - Sandbox'
res_exc = 'Hola mundo'
# paso 3 sencillo web scrapping
def test_websacrapping_simple_Cromium():
    driver = webdriver.Chrome()  
    driver.get(url_goo)
    time.sleep(2)
    driver.quit()
    

def test_selenium_Edge():
# paso 4 pasar de web scrapping a test
    driver = webdriver.Edge()  
    driver.get(url_goo)
    time.sleep(2)
    assert driver.title in 'Google'
    driver.quit()

# paso 5 pasar de web scrapping a test
@pytest.mark.confixture
def test_topscrape_Chrome():
    driver = webdriver.Firefox()  
    driver.get(url_tsc)
    time.sleep(2)
    assert driver.title == res_exctsc
    driver.quit()

# paso 6 llenar un campo y hacer clic y espera con selenium
def test_title():  
    driver = webdriver.Firefox()  
    driver.get(url_goo)
    time.sleep(2)
    add = driver.find_element(By.ID, 'APjFqb')
    add.send_keys(res_exc)
    assert add.get_property('value') == res_exc
    driver.quit() 

# paso 7 test rellenado de datos
def test_selenium_Firefox():
    pass

# paso 8 parametrizar
def test_add():
	pass

# paso 9 hacer clic
def test_sleep():
    pass

# paso 10 llenar un campo y hacer clic y espera con selenium
def test_explicit():
    pass

def test_topscrape_link():  
    pass

def test_login_functionality():  
    pass

def test_login_functional():
    pass
