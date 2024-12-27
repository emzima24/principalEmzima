from imports import pytest,allure, async_playwright,Playwright,Page,pytest_asyncio,asyncio
from configconstan import config



@pytest_asyncio.fixture()
async def page():
    async with async_playwright() as p:
        browser = await p.chromium.launch(headless=True)  # Cambia a True si prefieres sin interfaz
        page = await browser.new_page()
        yield page
        await browser.close()
   
@pytest.fixture()
def allure_attach():
    def attach(image_bytes, name):
        allure.attach(
            image_bytes,
            name=name,
            attachment_type=allure.attachment_type.PNG
        )
    return attach

def async_bdd_decorator(step_func):
    def wrapper(func):
        @step_func
        @pytest.mark.asyncio
        async def async_wrapper(*args, **kwargs):
            await func(*args, **kwargs)
        return async_wrapper
    return wrapper

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