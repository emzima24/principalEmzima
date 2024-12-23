from imports import pytest
from configconstan import BrowserConfig,config
from features.pages.Login import Login

URL = BrowserConfig.BASE_URL
USER = config.get('USERNAME')
PASSWORD = config.get('PASSWORD')

# @pytest.fixture(scope="function")
# async def browser_context():
#     async with async_playwright() as p:
#         browser = await p.chromium.launch(headless=False)  # Cambia a True si prefieres sin interfaz
#         context = await browser.new_context()
#         yield context
#         await context.close()
#         await browser.close()

# @pytest.fixture(scope="function")
# async def page(browser_context):
#     page = await browser_context.new_page()
#     yield page
#     await page.close()

# @pytest.mark.asyncio
# async def test_login(page):  
#     async with page:  # Consider using context manager for cleanup
#         login = Login(page)
#         await login.login(URL,USER,PASSWORD)
#         # Añadir más verificaciones según sea necesario
#         assert "Expected text" in await page.content()

# async def main():
#     async with async_playwright() as p:
#         browser = await p.chromium.launch()
#         page = await browser.new_page()
#         await page.goto("http://playwright.dev")
#         print(await page.title())
#         await browser.close()

# @pytest.mark.asyncio
# async def test_login():
#     async with async_playwright() as p:
#         browser = await p.chromium.launch()
#         page = await browser.new_page()
#         await page.goto(URL)
#         await page.wait_for_selector('input[name="username"]')  # Espera explícita para el campo de usuario
#         await page.fill('input[name="username"]', USER)
        
#         await page.wait_for_selector('input[name="password"]')  # Espera explícita para el campo de contraseña
#         await page.fill('input[name="password"]', PASSWORD)
        
#         await page.wait_for_selector('button[type="submit"]')  # Espera explícita para el botón de submit
#         await page.click('button[type="submit"]')
#         await browser.close()

