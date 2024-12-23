from imports import pytest,allure, subprocess,sync_playwright
from configconstan import config

@pytest.fixture(scope="session")
def browser_context():
    with sync_playwright() as p:
        browser = p.chromium.launch(headless=True)  # Cambia a True si prefieres sin interfaz
        context = browser.new_context()
        yield context
        context.close()
        browser.close()

@pytest.fixture(scope="function")
def page(browser_context):
    page = browser_context.new_page()
    yield page
    page.close()
   
@pytest.fixture()
def allure_attach():
    def attach(image_bytes, name):  
        allure.attach(
                image_bytes,
                name=name,
                attachment_type=allure.attachment_type.PNG)
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

# def pytest_addoption(parser):
#     parser.addoption('--behave', action='store-true',help='run behave BBD tests')

# def pytest_configure(config):
#     if config.getoption('--behave'):
#         subprocess.run(['behave'],check=True)