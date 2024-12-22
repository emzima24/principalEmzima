from imports import webdriver,pytest,allure
from configconstan import config



@pytest.fixture()
def chrome_browser(): 
    driver = webdriver.Chrome()
    driver.maximize_window()
    yield driver
    driver.quit()
  
@pytest.fixture()
def allure_attach():
    def attach(image_bytes, name):
        allure.attach(
            image_bytes,
            name=name,
            attachment_type=allure.attachment_type.PNG
        )
    return attach

def pytest_addoption(parser):
    """Agrega la opción '--env' para cambiar el entorno desde la línea de comandos."""
    parser.addoption(
        '--env',
        action='store',
        default='prod',  
        help='Selecciona el entorno: "test", "prod" o "prbl"',
    )

@pytest.fixture(autouse=True)
def set_environment(pytestconfig):
    """Configura el entorno según la opción '--env'."""
    env = pytestconfig.getoption('env')
    config.set_environment(env) 
    print(f"ENTORNO CONFIGURADO: {env}")
