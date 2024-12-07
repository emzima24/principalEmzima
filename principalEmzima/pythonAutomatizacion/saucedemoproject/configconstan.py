
class BrowserConfig:
    """Clase para gestionar las constantes en la automatización."""
    # URLS
    BASE_URL = 'https://www.saucedemo.com/'

    # Configuración del navegador
    TIMEOUTLOW = 2  
    TIMEOUTMEDIUM = 4  
    TIMEOUTHIGH = 6  

class Config:
    """Clase para gestionar la configuración dinámica según el entorno."""
    configurations = {
        'test': {
            'USERNAME' : 'error_user',
            'PASSWORD' : 'secret_sauce',
        },
        'prod': {
            'USERNAME' : 'standard_user',
            'PASSWORD' : 'secret_sauce',
        },
        'prbl': {
            'USERNAME' : 'problem_user',
            'PASSWORD' : 'secret_sauce',
        },
    }

    # Variable global inicial para el entorno
    def __init__(self, env='prod'):
        self.env = env  

    # Función para cambiar la configuración
    def set_environment(self, env_name):
        """Cambia el entorno activo."""
        if env_name in self.configurations:
            self.env = env_name
        else:
            raise ValueError(f'El entorno "{env_name}" no está definido.')

    # Variables que reflejan el entorno actual
    def get(self, key):
        """Obtiene un valor de configuración del entorno activo."""
        if key in ['USERNAME', 'PASSWORD']:
            return self.configurations[self.env][key]
        elif key in ['BASE_URL', 'TIMEOUTLOW', 'TIMEOUTMEDIUM', 'TIMEOUTHIGH']:
            return getattr(BrowserConfig, key)
        
class Cards:
    products = {
        'Sauce Labs Backpack': {
            'xpath_title' : '//*[@id="item_4_title_link"]/div',
            'xpath_image' : '//*[@id="item_4_img_link"]/img',
            'id_add_cart':'add-to-cart-sauce-labs-backpack',
        }, 
        'Sauce Labs Bike Light': {
            'xpath_title' : '//*[@id="item_0_title_link"]/div',
            'xpath_image' : '//*[@id="item_0_img_link"]/img', 
            'id_add_cart':'add-to-cart-sauce-labs-bike-light',
        },
        'Sauce Labs Bolt T-Shirt': {
            'xpath_title' : '//*[@id="item_1_title_link"]/div',
            'xpath_image' : '//*[@id="item_1_img_link"]/img',
            'id_add_cart':'add-to-cart-sauce-labs-bolt-t-shirt',
        },
        'Sauce Labs Fleece Jacket': {
            'xpath_title' : '//*[@id="item_5_title_link"]/div', 
            'xpath_image' : '//*[@id="item_5_img_link"]/img',
            'id_add_cart':'add-to-cart-sauce-labs-fleece-jacket',
        }, 
        'Sauce Labs Oneise': {
            'xpath_title' : '//*[@id="item_2_title_link"]/div', 
            'xpath_image' : '//*[@id="item_2_img_link"]/img',
            'id_add_cart':'add-to-cart-sauce-labs-onesie',
        },
        'Test.allTheThings() T-Shirt (Red)': {
            'xpath_title' : '//*[@id="item_3_title_link"]/div', 
            'xpath_image' : '//*[@id="item_3_img_link"]/img',
            'id_add_cart':'add-to-cart-test.allthethings()-t-shirt-(red)',
        },
    }

config = Config()