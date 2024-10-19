from selenium import webdriver
from pytest_bdd import scenario, given,when,then
import pytest
import allure
from test_example import test_bdd
@pytest.mark.behave
@scenario('../features/example.feature','Open website and check it\'s titlle')
def test_bdd():
    pass

@given(u'I want to launch the browser')
def i_want_to_launch_the_browser(context):
    context.driver = webdriver.Chrome()


@when(u'I enter the {website} in the navegation bar and go there')
def i_enter_the_website_in_the_navegation_bar_and_go_there(context, website):
    context.driver.get(website)


@then(u'I verify that page by it is title')
def i_verify_that_page_by_it_is_title(context):
    assert context.driver.title in 'Test Login'
    context.driver.quit()