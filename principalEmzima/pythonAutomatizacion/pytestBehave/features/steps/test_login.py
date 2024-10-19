from selenium import webdriver
from selenium.webdriver.common.by import By
from pytest_bdd import scenario, given, when, then, parsers
import pytest
from test_example import allure_attach 

@pytest.mark.behave
@scenario('../features/login.feature','Login test in ulr',)
def test_bbd():
    pass 

@given(parsers.parse('I\'m a registered user on the {website}'))
def im_a_registered_user_on_the_website(context,website):
    context.driver = webdriver.Chrome()
    context.driver.get(website)

@when(parsers.parse('I enter my {username} and {password}'))
def i_enter_my_username_and_password(context,username,password):
    #time.sleep(3)
    context.driver.implicitly_wait(2)
    username = username if username != '[blanck]'  else ''
    password = password if password != '[blanck]'  else ''
    context.driver.find_element(By.ID, 'username').send_keys(username)  
    context.driver.find_element(By.ID, 'password').send_keys(password)  
    allure_attach(context.driver.get_screenshot_as_png(),'test_login1.png')
    

@when('click on the login buttom')
def click_on_the_login_buttom(context):
    context.driver.find_element(By.ID, 'submit').click()

@then(parsers.parse('I can log in or receive error {message}'))
def i_can_log_in_or_receive_error_message(context,message):
    if message.__contains__('Congratulations'):
        text = context.driver.find_element(
                By.XPATH, '//*[@id="loop-container"]/div/article/div[2]/p[1]/strong' 
        ).text
    else:
        text = context.driver.find_element(
                By.ID, 'error' 
        ).text
    allure_attach(context.driver.get_screenshot_as_png(),'test_login2.png')
    assert text in message
    context.driver.quit()