from behave import *
from selenium import webdriver
from selenium.webdriver.common.keys import Keys



@given(u'I want to launch the browser')
def i_want_to_launch_the_browser(context):
    context.driver = webdriver.Chrome()

@when(u'I enter the <website> in the navegation bar and go there')
def i_enter_the_website_in_the_navegation_bar_and_go_there(context):
    context.driver.get('https://practicetestautomation.com/practice-test-login/')
    

@then(u'I verify that page by it is title')
def i_verify_that_page_by_it_is_title(context):
    assert context.driver.title == 'Test Login | Practice Test Automation'
    context.driver.quit()
