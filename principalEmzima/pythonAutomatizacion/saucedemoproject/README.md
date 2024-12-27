# Proyecto Saucedemo (automatización python)
Los controladores de las páginas de la web app:
1. Login (clase Login) **Emiliano**. 
2. Catalogo (clase Catalogue) **Emiliano - Ana Maria** Hereda la clase Login. 
3. Descripcion (clase Description) **Milton** Hereda la clase Catalogue, Cart. (Pudiera solo heredar la clase Catalogue)  
4. Carro (clase Cart) **Emiliano - Fabian** Hereda la clase Catalogue. (Pudiera solo heredar la clase Description y asi hay una herencia continua)  
5. Information (clase Checkout_Information) **Emiliano - Bisset** Hereda la clase Cart. 
6. Checkout (clase Checkout_Overview)  **Franciso - Martin** Hereda la clase Checkout_Information.
7. Completada (clase Checkout_Complete) **David - Silvia** Hereda la clase Checkout_Overview y Description de la cual se sobre escribe una clase. (Si Cart hereda de Description no hace falta que herede aca porque estaria en la linea)

## Sobre el archivo configconstan.py
Contiene 3 clases 
* BrowserConfig:
    Contiene la url y la constante de tiempos de espera en segundos .
* Config:
    Define el entorno en combinación con el archivo pytest.py.  
    Se reconocen como entornos el usuario error_user (entorno 'test'), el usuario standard_user (entorno 'prod') y el usuario problem_user (entorno 'prbl'). Sólo a manera de poder cambiar de usuario y de resultado de la prueba. Y entendiendo que el contexto entorno es más que esto. E instancia el objeto para su uso.
* Cards:
    Define cada uno de los productos del catalogo y contiene sus 'xpath_title' (xpath para el titulo de la tarjeta),
            'xpath_image' (xpath para la imagen de la tarjeta) y el 'id_add_cart'(id para el boton add to cart de la tarjeta).

## Sobre el archivo conftest.py
Contiene:
* Chrome_browser, fixture para definir el webdriver de chrome para su uso en todos los procesos. Apertura y cierre. 
* allure_attach, fixture que define el método de captura de imagenes para extender en cualquiera de los archivos de python durante las pruebas .
* pytest_adoption, establece el uso de --env, opcion para cambiar el entorno con el comando de ejecucion en la terminal. Segun las siglas de cada entorno señaladas en el archivo anterior.
* set_environment, predefine el  entorno como 'prod'.
## Sobre el archivo pytest.py
Contiene: 
* el directorio definido por defecto para allure y unos marcadores que aunque no se usan puen usarse para ejecuciones con pytest -m.

## Sobre el archivo imports.py
Contiene todas las librerias cuyas importaciones son necesarias para este proyecto. Luego cada archivo py puede llamar a las que necesite desde imports.

## Sobre el archivo enviroment.py
***NO UTILIZADO*** Contiene la configuración necesaria de context para la administraci{o}n durante las pruebas si se usase behave. Como se usa pytest-bdd no es necesario.

## Sobre las pruebas
Existen dos tipos de pruebas:

### Pruebas internas:
Mediante el archivo **test_file.py** en la carpeta test se hacen las pruebas la programación por páginas de la web app. Solo prueban la implementación de webdriver para administrar las páginas y asi configurar las pruebas. No tienen asserts solo tienen que realizar la manipulación de la página necesaria.   
*Se recomienda que se comente la linea que habilita Allure durante las pruebas con el archivo pytest*   
Para ejecutar todo el archivo: **pytest test/test_file.py**    
Para ejecutar solo un test específico el archivo: **pytest test/test_file.py::test_complete** 

### Pruebas a sistemas
Mediante el archivo **test_endToEnd.py** en la carpeta features/steps se prueban las features que el escenario define segun el contexto de behave(Gherkin). Este incluye capturas de imagenes y creación de informes en **Allure** para el contexto de ejecución.    
Para ejecutar con pytest-bdd: **pytest features/steps/test_end2end.py**   
Para ejecutar el informe allure: **allure serve ./reports/allure-results** y seguir instrucciones para parar la implementación del informe

## El trabajo fue realizado por el equipo siguiente:
[Ana María Aracelli]()   
[Bisset Gonzales]()   
[Flor Jaimes]()   
[Milton Klun]()   
[Martin Morán]()   
[Silvia Verónica Noriega]()   
[Edwar Fabian Nossa]()   
[Francisco Jose Parra]()   
[Emiliano Zapata Machin](https://www.linkedin.com/in/emiliano-zapata-machin-emzima/)

