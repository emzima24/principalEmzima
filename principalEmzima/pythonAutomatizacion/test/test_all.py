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
url_goo = 'https://www.google.com'
url_tsc = 'https://books.toscrape.com/'
url_slt = 'https://www.selenium.dev/selenium/web/dynamic.html'
url_din = 'https://a778-2800-810-470-86ea-73e1-3762-9c2c-de0c.ngrok-free.app'

# paso preconfigurar con elementos recursivos
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

@pytest.mark.juntos
@pytest.mark.chrome
@allure.title('test by name')
def test_websacraping_simple_Cromium(chrome_browser):
    chrome_browser.get(url_goo)
    chrome_browser.find_element(By.NAME, 'q').send_keys('Hola mundo chrome') 
    #time.sleep(3)
    allure_attach(chrome_browser.get_screenshot_as_png(),'test1.png')
    assert chrome_browser.title ==  'Google'

@pytest.mark.juntos
@pytest.mark.edge
@allure.title('test by id')
def test_selenium_Edge(edge_browser):
    edge_browser.get(url_goo)
    edge_browser.find_element(By.ID, 'APjFqb').send_keys('Hola mundo edge')
    #time.sleep(3)
    allure_attach(edge_browser.get_screenshot_as_png(),'test2.png')
    assert edge_browser.title not in  ['Gogle','gogle','Googl']

@pytest.mark.juntos
@pytest.mark.firefox
@allure.title('test by class and value')
def test_selenium_Firefox(firefox_browser):
    firefox_browser.get(url_goo)
    added = firefox_browser.find_element(By.CLASS_NAME, 'gLFyf')
    added.send_keys('Hola mundo firefox')
    #time.sleep(3)
    allure_attach(firefox_browser.get_screenshot_as_png(),'test3.png')
    assert added.get_property('value') == 'Hola mundo firefox'

@pytest.mark.prueba
@allure.title('title page')
def test_topscrape(chrome_browser):
    chrome_browser.get(url_tsc)
    allure_attach(chrome_browser.get_screenshot_as_png(),'test4.png')
    assert chrome_browser.title ==  'All products | Books to Scrape - Sandbox'
    
@pytest.mark.skip('Not included for testing')
@pytest.mark.addparame
@allure.title("Parameterization with addition")
@pytest.mark.parametrize("input1, input2, output",[(5,5,11),(3,5,12)])
def test_add(input1: Literal[5] | Literal[3], input2: Literal[5], output: Literal[10] | Literal[12]):
	assert input1+input2 != output,"failed"
    
@pytest.mark.clicksleep
@allure.title('selenium page test1')
def test_sleep(chrome_browser):
    chrome_browser.get(url_slt)
    chrome_browser.find_element(By.ID, 'adder').click()
    #time.sleep(4)
    added = chrome_browser.find_element(By.ID, 'box0')
    allure_attach(chrome_browser.get_screenshot_as_png(),'test5.png')
    assert added.get_dom_attribute('class') == 'redbox'

@pytest.mark.waitexplicit
@allure.title('selenium page test2')
def test_explicit(firefox_browser):
    firefox_browser.get(url_slt)
    revealed = firefox_browser.find_element(By.ID, 'revealed')
    firefox_browser.find_element(By.ID, 'reveal').click()
    wait = WebDriverWait(firefox_browser, timeout=10)
    wait.until(lambda d : revealed.is_displayed())
    revealed.send_keys('Displayed')
    #time.sleep(2)
    allure_attach(firefox_browser.get_screenshot_as_png(),'test6.png')
    assert revealed.get_property('value') == 'Displayed'

@pytest.mark.confixture
@allure.title('mozilla or python page, the test is the answer')
def test_title(chrome_browser):  
    chrome_browser.get('https://www.mozilla.org/es-AR/') #'https://www.python.org'  
    #time.sleep(2)
    allure_attach(chrome_browser.get_screenshot_as_png(),'test7.png')
    assert chrome_browser.title == 'Welcome to Python.org' # 'Internet para las personas, no para las ganancias' # 

@pytest.mark.login
@allure.title('login test automation version1  ID')
def test_login_functionality(firefox_browser):  
    firefox_browser.get('https://practicetestautomation.com/practice-test-login/')  
    firefox_browser.execute_script("window.scrollTo(0, 400)")  
    #time.sleep(2)
    firefox_browser.find_element(By.ID, 'username').send_keys('student')  
    firefox_browser.find_element(By.ID, 'submit').click()
    #time.sleep(2)
    error_msg = firefox_browser.find_element(By.ID, 'error')   
    allure_attach(firefox_browser.get_screenshot_as_png(),'test8.png')
    allure.dynamic.title('Password invalid')
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
        allure_attach(firefox_browser.get_screenshot_as_png(),'test9.png')
        allure.dynamic.title('Password valid')
        assert logout_button.is_displayed(), 'Logout button is not displayed.'  
    except NoSuchElementException:  
        assert False, 'Logout button does not exist.'  

# esta pagina no puede ser usa por que el url cambia diariamente
@pytest.mark.skip('Url no disponible')
@pytest.mark.logindos
@allure.title('login test automation version XPATH')
def test_login_functional(firefox_browser):  
    firefox_browser.get(url_din) 
    #time.sleep(2)
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
    #time.sleep(3)
    firefox_browser.find_element(  
            By.XPATH, '//*[@id="navbarText"]/ul/li[2]/a'  
        ).click()
    #time.sleep(2)
    firefox_browser.execute_script("window.scrollTo(0, 400)")  
    typeActiv = firefox_browser.find_element(  
            By.NAME, 'phone'  
        )
    allure_attach(firefox_browser.get_screenshot_as_png(),'test10.png')
    assert  typeActiv.get_property('value') == '91145789233' 
    #time.sleep(2)
    typeActiv = firefox_browser.find_element(  
            By.NAME, 'country'   
        )
    assert  typeActiv.get_property('value') == 'Argentina' 
    typeActiv = firefox_browser.find_element(  
            By.NAME, 'cuitCus' 
        )
    assert  typeActiv.get_property('value') == '25959844007'
    firefox_browser.find_element(  
            By.XPATH, '//*[@id="navbarText"]/ul/li[4]/a'  
        ).click()
    #time.sleep(2)


@pytest.mark.paginaprecio
@allure.title('last test with XPATH')
def test_topscrape_link(edge_browser):  
    edge_browser.get(url_tsc)
    #time.sleep(5)
    edge_browser.find_element(  
            By.XPATH, '//*[@id="default"]/div/div/div/aside/div[2]/ul/li/ul/li[13]/a'  
        ).click()
    #time.sleep(2)
    edge_browser.find_element(  
            By.XPATH, '//*[@id="default"]/div/div/div/div/section/div[2]/ol/li[7]/article/h3/a'  
        ).click()
    #time.sleep(2)
    edge_browser.execute_script("window.scrollTo(0, 800)")  
    price = edge_browser.find_element(  
            By.XPATH, '//*[@id="content_inner"]/article/table/tbody/tr[3]/td'  
        ).text
    allure_attach(edge_browser.get_screenshot_as_png(),'test11.png')
    #time.sleep(2)
    assert  price in '£52.60'
