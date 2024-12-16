from selenium import webdriver
from pytest_bdd import scenario, given,when,then
import pytest
import allure

def allure_attach(image_bytes, name):  
    allure.attach(
            image_bytes,
            name=name,
            attachment_type=allure.attachment_type.PNG)
    
@pytest.mark.behave
@scenario('../features/example.feature',"Open website and check it's title",)
def test_bbd():
    pass 

@given(u'I want to launch the browser')
def i_want_to_launch_the_browser(context,url):
    context.driver = webdriver.Chrome()

@when(u'I enter the <website> in the navegation bar and go there')
def i_enter_the_website_in_the_navegation_bar_and_go_there(context):
    context.driver.get('https://practicetestautomation.com/practice-test-login/')
    

@then(u'I verify that page by it is title')
def i_verify_that_page_by_it_is_title(context):
    allure_attach(context.driver.get_screenshot_as_png(),'test_ingreso.png')
    assert context.driver.title == 'Test Login | Practice Test Automation'
    context.driver.quit()