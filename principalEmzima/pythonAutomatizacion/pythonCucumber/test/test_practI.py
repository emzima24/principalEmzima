import datetime
import os
from typing import Literal
from selenium import webdriver
from selenium.webdriver.common.by import By
from selenium.webdriver.common.keys import Keys
from selenium.webdriver.support.ui import WebDriverWait
from selenium.webdriver.support import expected_conditions as EC
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
fill_text = 'mercado libre argentina'
exep_meli = 'Mercado Libre Argentina - Envíos Gratis en el día'
search = 'Pc Gamer Ryzen 7 5700g Rtx 3060 12gb 32gb Vega 8960gb Wifi'
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
@pytest.mark.case_1
@allure.title('google/meli.ar de busqueda especifica')
def test_meli(chrome_browser):
    chrome_browser.get(url_goo)
    chrome_browser.find_element(By.NAME, 'q').send_keys(fill_text,Keys.ENTER)
    chrome_browser.find_element(
        By.XPATH, '//*[@id="rso"]/div[1]/div/div/div/div/div/div/div/div[1]/div/span/a/h3'
    ).click()
    allure_attach(chrome_browser.get_screenshot_as_png(),'meli1.png')
    assert chrome_browser.title in  exep_meli

@pytest.mark.login
@pytest.mark.firefox
@pytest.mark.case_2
@allure.title('login test automation no ingresa e ingresa practica 1')
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
        text = firefox_browser.find_element(                 # logout_button
            By.XPATH, '//*[@id="loop-container"]/div/article/div[2]/p[1]/strong'   # By.LINK_TEXT, 'Log out' #CLASS_NAME, 'wp-block-button__link' #
        ).text 
        #allure.dynamic.title('Password valid')
        allure_attach(firefox_browser.get_screenshot_as_png(),'ingresa.png')
        assert text in 'Congratulations student. You successfully logged in!'                                            # logout_button.is_displayed(), 'Logout button is not displayed.'  
    except NoSuchElementException:  
        assert False, 'Congratulations student. You successfully logged in!'  


@pytest.mark.smoke
@pytest.mark.chrome
@pytest.mark.case_3
@allure.title('google/meli.ar de busqueda especifica')
def test_meli_large(chrome_browser):
    chrome_browser.get(url_goo)
    chrome_browser.find_element(By.NAME, 'q').send_keys(fill_text,Keys.ENTER)
    chrome_browser.find_element(
        By.XPATH, '//*[@id="rso"]/div[1]/div/div/div/div/div/div/div/div[1]/div/span/a/h3'
    ).click()
    # chrome_browser.find_element(
    #     By.XPATH, '//a[@href ="https://www.mercadolibre.com.ar/categorias#nav-header"]'
    # ).click()
    # WebDriverWait(chrome_browser,10).until(
    #     EC.element_to_be_clickable(( By.PARTIAL_LINK_TEXT, "Tecnología")) # By.XPATH, '/html/body/header/div/div[5]/div/ul/li[1]/div/ul/li[4]/a')) # 
    # ).click()
    # WebDriverWait(chrome_browser,10).until(
    #     EC.element_to_be_clickable((By.PARTIAL_LINK_TEXT, "PC"))#.XPATH, '/html/body/header/div/div[5]/div/ul/li[1]/div/ul/li[4]/a'))
    # ).click()
    #time.sleep(3)
    
    
    # chrome_browser.find_element(
    #     By.ID, 'cb1-edit'
    # ).send_keys(search,Keys.ENTER)
    # images = chrome_browser.find_elements(
    #     By.TAG_NAME, 'img' # [@alt="Pc Gamer Armada Ryzen 7 5700g Rtx 3060 12gb 64gb 960gb Wifi Imagen - 1/6"]' # .LINK_TEXT,  search
    # )
    # image = None
    # for img in images:
    #     if img.get_attribute('alt') == search:
    #         image = img
    #         break

    # assert image is not None,  'Ta jodida la vaina'
    # image.click()
    
    
    
    #time.sleep(3)
    # chrome_browser.find_element(
    #     By.LINK_TEXT,  'PC'
    #     # 'body > header > div > div.nav-area.nav-bottom-area.nav-center-area > div > ul > li.nav-menu-item.nav-menu-chevron-down > div > div > div > div > div:nth-child(2) > ul > li:nth-child(4) > a' 
    #     # '/html/body/header/div/div[5]/div/ul/li[1]/div/div/div/div/div[2]/ul/li[4]/a' 
    #     # '//a[@href ="https://listado.mercadolibre.com.ar/computacion/pc-escritorio/pc/#menu=categories"]'
    # ).click()
    # time.sleep(2)

#   
#     chrome_browser.find_element(
#         By.XPATH, '/html/body/header/div/div[5]/div/ul/li[1]/div/div/div/div/div[2]/ul/li[4]/a'
#     ).click()
#     chrome_browser.find_element(
#         By.XPATH, '//a[href ="https://listado.mercadolibre.com.ar/pc-gamer#trends_tracking_id=fce9fb54-0ae4-4728-9b28-898863e0da77&component_id=MOST_WANTED]'
#     ).click()
# #  '')



    #allure_attach(chrome_browser.get_screenshot_as_png(),'meli1.png')
    #assert chrome_browser.title in  'Pc Gamer | MercadoLibre'