#Se deberia poder ejecutar en colab pero por alguna razon no me funcionaba apesar de haberlo probado

import re
from playwright.sync_api import Page, expect

def test_has_title(page: Page):
    page.goto("https://books.toscrape.com/")


    expect(page).to_have_title(re.compile("All products | Books to Scrape - Sandbox"))

def test_get_started_link(page: Page):
    page.goto("https://books.toscrape.com/")

    page.get_by_role("link", name="Music").click()

    page.get_by_text("Chronicles, Vol. 1").click()

    expect(page).to_have_title(re.compile("Chronicles, Vol. 1 | Books to Scrape - Sandbox"))
