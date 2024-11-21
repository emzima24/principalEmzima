from behave import *
from selenium import webdriver
from selenium.webdriver.common.by import By
import time
import pytest

@given(u'I\'m a registered user on the {website}')
def im_a_registered_user_on_the_website(context,website:str):
    context.driver = webdriver.Chrome()
    context.driver.get(website)

@when(u'I enter my {username} and {password}')
def i_enter_my_username_and_password(context,username:str,password:str):
    time.sleep(3)
    context.driver.find_element(By.ID, 'username').send_keys(username)  
    context.driver.find_element(By.ID, 'password').send_keys(password)  
    

@when(u'click on the login buttom')
def click_on_the_login_buttom(context):
    context.driver.find_element(By.ID, 'submit').click()

@then(u'I can log in or receive error {message}')
def i_can_log_in_or_receive_error_message(context,message:str):
    if message.__contains__('Congratulations'):
        text = context.driver.find_element(
                By.XPATH, '//*[@id="loop-container"]/div/article/div[2]/p[1]/strong' 
        ).text
    else:
        text = context.driver.find_element(
                By.ID, 'error' 
        ).text
    assert text in message
    context.driver.quit()