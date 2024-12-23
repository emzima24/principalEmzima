# from imports import  fixture, use_fixture, async_playwright,async_run_until_complete

# @fixture()
# async def chrome_browser(context): 
#     p = await async_playwright().start()
#     driver = await p.chromium.launch(headless=False,slow_mo=500,channel="chrome")
#     context.page = await driver.new_page()
#     yield context.page
#     await context.page.close()
#     await driver.close()

# @async_run_until_complete
# async def before_scenario(context,scenario):
#     await use_fixture(chrome_browser,context)

