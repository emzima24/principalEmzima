from imports import webdriver,pytest
from configconstan import config


@pytest.fixture
def chrome_browser():
    driver = webdriver.Chrome()
    driver.maximize_window()
    yield driver
    driver.quit()

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